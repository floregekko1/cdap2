# cdap2

***
## MariaDb
[mariadb Documentation repository](https://github.com/yve-n/Docker-Install/edit/main/README.md)

1. **Connect to MariaDB from the MySQL/MariaDB command line client using the docker-compose.yml**
    * create your docker-compose.yml in your project:  

                version: "3.9"

                volumes:
                persistent:

                services:
                db:
                    image: mariadb
                    container_name: mariadb
                    ports:
                    - 3306:3306
                    environment:
                    MARIADB_ROOT_PASSWORD: {your password}
                    volumes:
                    - persistent:/var/lib/mysql
                    networks:
                    - default

    * Run : 
            docker-compose up -d

    * shell access to your container mariadb :  

            $ docker exec -it mariadb bash   

    * connect to your mariadb
         > --use **root** as user for this, but you can manage your user:  

            $  mysql -uroot -p  

    * In your container mariadb create your database and then create your tables 

            $  CREATE DATABASE contact DEFAULT CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI;
            $  use contact;
            $  CREATE TABLE IF NOT EXISTS user (id INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL, firstName
                VARCHAR(32) NOT NULL, lastName VARCHAR(32) DEFAULT NULL, phone VARCHAR(10) DEFAULT NULL, mail VARCHAR(50) NOT NULL, password VARCHAR(25) NOT NULL) ENGINE=INNODB;
        






