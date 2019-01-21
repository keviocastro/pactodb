#!/bin/bash

su - postgres -c '/usr/pgsql-9.3/bin/postgres -D /pg_home'
su - postgres -c "psql -U postgres -c \"alter user postgres with password '$POSTGRES_PASSWORD';\""