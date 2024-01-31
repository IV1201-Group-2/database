# database
Database schema and utilities

//Ensure that the PostgreSQL username is postgres to migrate data since the owner of tables are hardcoded to user "postgres"
//Create a new database
createdb [database_name]

//dump all data into the new database

//Check your host and port by entering the psql command line
psql -U username -d database_name
//Find the port number
SHOW data_directory;
SHOW port;

//navigate the host
SHOW hba_file;
//exit the psql command and find the hba_file to find the host
nano /path/to/pg_hba.conf

//Generally the host is localhost and port is 5432 
psql -h [host] -U postgres -p [port] -d [new_database] -a -f postgresg2_dump.sql

