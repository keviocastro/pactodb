dbname=$1

echo "Setting pre restoration..."

psql -h localhost -U postgres -c "SELECT pg_terminate_backend(pid) 
    FROM pg_stat_activity 
    WHERE datname = '$dbname';"

echo "Settings pre restoration completed!"


