docker run -e "SGA_TARGET=512M"  --name 18c -p 1523:1521 --rm -d quillbuilduser/oracle-18-xe-micro

while ! nc -z localhost 1523; do
    echo "Waiting for Oracle"
    sleep 5;
done;
sleep 5;

echo "Connected to Oracle"
sleep 5
