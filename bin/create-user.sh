USER=$1
PASSWORD=$2

psql -h localhost -U postgres -c "DO
\$do$
BEGIN
   IF NOT EXISTS (
      SELECT                       -- SELECT list can stay empty for this
      FROM   pg_catalog.pg_roles
      WHERE  rolname = '$USER') THEN

      CREATE ROLE $USER LOGIN PASSWORD '$PASSWORD';
   END IF;
END
\$do$;"