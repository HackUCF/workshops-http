# sql50 databases

## Instructions
Make .sql files in `docker-entrypoint-initdb.d` to create, populate, and grant select to user(s) of your choosing.

Download, run, initialize, and start the MariaDB container with the following command:

```
docker run -it -p 0.0.0.0:3306:3306 --name ctf-mariadb -e MYSQL_ROOT_PASSWORD=default_password_lol -e MYSQL_DATABASE=ctfdb -v $(pwd)/docker-entrypoint-initdb.d:/docker-entrypoint-initdb.d/ mariadb:10
```

Challenge flags can be anything from specific values in the database to hashes of command line output. If you opt for the latter, remember to compensate for missing newlines and stuff.
