# Encryption

## Database
Bubble supports column-level encryption. Columns are encrypted with a symmetric key defined by the `BUBBLE_DB_ENCRYPTION_KEY`
environment variable, set in the [Bubble environment file](env_file.md).

### Rekeying the Database
Rekeying the database means to change the encryption key. This is accomplished by setting up a second, empty database and
then running a "rekey" command that reads all data from a source database using that database's encryption key, then writing
all the data into the new empty database using a new encryption key.

  * Stop the Bubble API server
  * Backup the Bubble database
  
    `pg_dump -U bubble bubble | gzip > /path/to/backup.tgz`
  * Create a new PostgreSQL database with the same schema as the source database, but no data, for example, if the source database is named `bubble` and the destination database is named `new_bubble`, you would run:

    `createdb new_bubble && pg_dump --schema-only -U bubble bubble | psql -U bubble new_bubble`
  * Run the rekey command to read all data from the source database, and write to the destination database:

```code
        ./bubble/bin/bubble rekey \
            --jar ${BUBBLE_JAR} \
            --db-user ${DB_USER} \
            --db-password "${DB_PASS}" \
            --from-db ${FROM_DB} \
            --from-key "${FROM_KEY}" \
            --to-db ${TO_DB} \
            --to-key "${TO_KEY}"

The shell variables above are: 
    BUBBLE_JAR : path to the Bubble API JAR file
    DB_USER    : name of the PostgreSQL user, usually bubble
    DB_PASS    : password for the PostgreSQL user. To use an env var, prefix with @, for example @PGPASSWORD
    FROM_DB    : name of the source database, typically bubble
    FROM_KEY   : encryption key for the source database (or env var if prefixed with @), typically @BUBBLE_DB_ENCRYPTION_KEY
    TO_DB      : name of the destination database, for example new_bubble
    TO_KEY     : encryption key for the destination database
```

  * The rekeying is now complete. Drop the old database, and rename the new database. You may need to become the postgres user to run these commands.
  
    `dropdb bubble && psql -c 'ALTER DATABASE new_bubble RENAME TO bubble'`

  * Restart the Bubble API server

## Redis
Redis values are encrypted with a symmetric key, defined by the `BUBBLE_REDIS_ENCRYPTION_KEY` environment variable, 
set in the [Bubble environment file](env_file.md).

### Rekeying Redis
Because only temporary data is stored in redis, there is a very simple rekey procedure:

  * Stop the Bubble API server
  * Flush all Redis data: `redis-cli flushall` OR `echo flushall | nc 127.0.0.1 6379`
  * Set a new encryption key (set a new value for `BUBBLE_REDIS_ENCRYPTION_KEY` in the bubble env file)
  * Restart the Bubble API server

## Cloud Storage
All data stored in cloud storage (which include backups) is encrypted locally using a key that is specific to that
particular cloud storage.  The key is generated automatically prior to first use.

If an upstream Sage Node is providing access to the cloud storage, it will not be able to see any of the data being read or written.
The file names or "keys" to the data itself are not encrypted, so these names would be visible to the Sage.
Bubble does not include any sensitive information in filenames stored in cloud storage.  

### Rekeying Cloud Storage
To rekey cloud storage, one would create a new cloud storage service with a different prefix path, then copy all the data
from the old service to the new service, then delete all the data stored via the old service.

TODO: document the procedure for rekeying a cloud storage service
