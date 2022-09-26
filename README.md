# RappiPay-Challenge
Repositorio que contiene las pruebas requeridas para el Reto RappiPay como parte de su aplicación DataEng.

Como se describe en las instrucciones, este repositorio contiene

1. [Diagrama de componentes]() para el caso dado.
2. [Esquema de estrella]() para el caso dado.
3. Diseño de proyecto en Airflow con una base de datos Postgres, desplegado en Docker.

Para desplegar correctamente el punto numero 3, se ha seguido el [tutorial](https://medium.com/@garc1a0scar/how-to-start-with-apache-airflow-in-docker-windows-902674ad1bbe) propuesto. Sin embargo, por requerimentos del despliegue en Docker, así como necesidades de importación de datos, será necesario cumplir con los siguientes pasos:

1. Seguir, como descrito, el [tutorial](https://medium.com/@garc1a0scar/how-to-start-with-apache-airflow-in-docker-windows-902674ad1bbe).
2. Modificar el archivo [docker-composer.yaml]() como preparación de la base de datos PostgreSQL en su respectivo servicio.
    ![image](https://user-images.githubusercontent.com/46640257/192177165-e0a38ec4-a026-4e0e-83c6-b10499580d68.png)
    
    ~~~
    volumes:
      -  "./local_pgdata:/var/lib/postgresql/data/pgdata"
    ports:
      - 5432:5432
    ~~~
3. Volver a ejecutar el comando `docker-compose up` para general directorio de archivos para importación de archivos.
4. Agregar archivos CSV contenidos en el [folder de este repositorio]() al directorio `C:\Users\<user>\docker\airflow\local_pgdata`.
5. 
