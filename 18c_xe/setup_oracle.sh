

while ! nc -z $2 1521; do
    echo "Waiting for Oracle"
    sleep 5;
done;
sleep 5;

echo "Connected to Oracle"
sleep 5