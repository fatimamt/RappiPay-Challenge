from datetime import timedelta, datetime
from distutils.command.clean import clean
from email.policy import default
from textwrap import dedent

# DAG object
from airflow import DAG

# Operators
from airflow.operators.bash import BashOperator
from airflow.providers.postgres.operators.postgres import PostgresOperator
from airflow.operators.python_operator import PythonOperator
from airflow.utils.dates import days_ago

default_args = {
    'owner': 'airflow',
    'retries': 1,
    'retry_delay': timedelta(minutes=1)
}


with DAG(
    dag_id='rappipay_challenge_dag',
    default_args=default_args,
    start_date=days_ago(1)
) as dag:

    # Task 1. Create tables
    create_tables = PostgresOperator(
        task_id = 'create_postgres_table',
        postgres_conn_id = 'postgres_db',
        sql = 'files/create_tables.sql'
    )

    # Task 2. Importing values in CSV files
    importing_values = PostgresOperator(
        task_id = 'importing_table_values',
        postgres_conn_id = 'postgres_db',
        sql = 'files/import_values.sql'
    )

    # Task 3. Primary and foreign keys definition
    defining_keys = PostgresOperator(
        task_id = 'defining_table_keys',
        postgres_conn_id = 'postgres_db',
        sql = 'files/alter_tables.sql'
    )

    create_tables >> importing_values >> defining_keys