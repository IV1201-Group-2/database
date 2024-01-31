# Database
Database schema & Utilities

## Important notes
1. Ensure that the PostgreSQL username is "postgres" to migrate data since the owner of tables are hardcoded to user "postgres"
2. Generally The Host Is localhost And The Port Is 5432 

## Step By Step Commands For Datamigration

### Create a New Database 
```sh
createdb [database_name]
```

### Check Which Port And Host Is Configured By Opening The PSQL Command-line
```sh
psql -U username -d database_name
```

### Check Port Number 
```sh
SHOW data_directory;
SHOW port;
```

### Find The hba_file Containing Host Value
```sh
SHOW hba_file;
```

#### Exit PSQL Command-line And Find The Host Value
```sh
nano /path/to/pg_hba.conf
```

### Dump All Data Into The New Database
```sh
psql -h [host] -U postgres -p [port] -d [new_database] -a -f postgresg2_dump.sql
```


