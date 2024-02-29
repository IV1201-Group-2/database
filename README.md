# Database
This repository contains essential resources for migrating a legacy database to a modern Postgres environment, with a focus on internationalization support.
## General Information

- **Legacy Database**: A SQL dump of the existing database schema.
- **Postgres**: The target database system for migration.
- **Script for i18n**: A SQL script for altering the existing database schema to support internationalization.

## Steps for migration
To migrate your database to Heroku Postgres, follow these steps. It is assumed that you have Heroku CLI installed and are logged in to your Heroku account.

1. **Create a new Heroku app**: 
    ```bash
    heroku create <app-name>
    ```

2. **Add Heroku Postgres as an add-on**: 
    ```bash
    heroku addons:create heroku-postgresql:mini --app <app-name>
    ```

3. **Retrieve the database add-on name**: 
    ```bash
    heroku pg:info --app <app-name>
    ```

4. **Restore the database**: 
    ```bash
    heroku pg:psql <add-on-name> --app <app-name> < heroku-dump-2024-02-07.sql
    ```
5. **Run the i18n script**: 
    ```bash
    heroku pg:psql <add-on-name> --app <app-name> < alter_competence_table.sql
    ```

6. **Connect to database**: 
    ```bash
    heroku pg:psql <add-on-name> --app <app-name>
    ```


## File Descriptions

- `heroku-dump-2024-02-07.sql`: A Postgres-compatible dump of the legacy database.
- `alter_competence_table.sql`: SQL script to update the schema of the competence table to support internationalization.
