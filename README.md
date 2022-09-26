# RappiPay-Challenge
Repositorio que contiene las pruebas requeridas para el Reto RappiPay como parte de su aplicación DataEng.

Como se describe en las instrucciones, este repositorio contiene

1. [Diagrama de componentes]() para el caso dado.
2. [Esquema de estrella]() para el caso dado.
3. Diseño de proyecto en Airflow con una base de datos Postgres, desplegado en Docker.

Para desplegar correctamente el punto numero 3, se ha seguido el [tutorial](https://medium.com/@garc1a0scar/how-to-start-with-apache-airflow-in-docker-windows-902674ad1bbe) propuesto. Sin embargo, por requerimentos del despliegue en Docker, así como necesidades de importación de datos, será necesario cumplir con los siguientes pasos:

1. Seguir, como descrito, el [tutorial](https://medium.com/@garc1a0scar/how-to-start-with-apache-airflow-in-docker-windows-902674ad1bbe).
2. Agregar archivo [dag.py]() al directorio `C:\Users\<user>\docker\airflow\dags`.
3. Modificar el archivo [docker-composer.yaml]() como preparación de la base de datos PostgreSQL en su respectivo servicio.
    ![image](https://user-images.githubusercontent.com/46640257/192177165-e0a38ec4-a026-4e0e-83c6-b10499580d68.png)
    
    ~~~
    volumes:
      -  "./local_pgdata:/var/lib/postgresql/data/pgdata"
    ports:
      - 5432:5432
    ~~~
    
4. Crear Conexión en la interface de Airflow con los siguientes parámetros.
    ![image](https://user-images.githubusercontent.com/46640257/192179112-cebc9169-e588-4278-af64-e66c34fee6e7.png)
    ![image](https://user-images.githubusercontent.com/46640257/192179226-67677995-005d-45b7-80d5-23260ab2e23a.png)
    
    `password: airflow`
    
5. Volver a ejecutar el comando `docker-compose up` para generar el directorio de archivos para importación de archivos.
6. Agregar archivos CSV contenidos en el [folder de este repositorio]() al directorio `C:\Users\<user>\docker\airflow\local_pgdata`. *NOTA:* Los archivos en este repositorio son los ya testeados para el despliegue. Fueron modificados a través de una limpieza de datos sencilla para poder ser usados.

    
