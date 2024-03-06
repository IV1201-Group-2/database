# Database

This repository contains essential resources for migrating a legacy database to a modern Postgres environment, with a focus on internationalization support.

## File descriptions

### Migrated database

- `schema.sql` - A Postgres-compatible schema for setting up an empty database.
- `schema_sqlite.sql` - A SQLite-compatible schema for setting up an empty database. This schema can be used for unit testing.
- `migrated_data.sql` - Migrated data from the legacy database using the new table format. This script should be run after `schema.sql`.

### Legacy database

- `legacy_database.sql` - A copy of the existing legacy database. This script is only here as a reference and is not compatible with the latest version of backend services.
- `alter_competence_table.sql` - SQL script to update the schema of the competence table to support internationalization.

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

4. **Create tables**:

   ```bash
   heroku pg:psql <add-on-name> --app <app-name> < schema.sql
   ```

5. **Load existing data**:

   ```bash
   heroku pg:psql <add-on-name> --app <app-name> < migrated_data.sql
   ```

6. **Connect to database**:

   ```bash
   heroku pg:psql <add-on-name> --app <app-name>
   ```
