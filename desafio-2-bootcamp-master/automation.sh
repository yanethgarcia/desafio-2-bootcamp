#!/bin/bash

mkdir tempdir/
mkdir tempdir/templates
mkdir tempdir/static

cp static/* tempdir/static
cp -r templates/* tempdir/templates
cp -r desafio2_app.py tempdir/

touch dockerfile

echo "FROM python" >> dockerfile
echo "RUN pip install flask" >>  dockerfile
echo "COPY ./static /home/myapp/static/" >>  dockerfile
echo "COPY ./templates /home/myapp/templates/" >>  dockerfile
echo "COPY desafio2_app.py /home/myapp/" >>  dockerfile
echo "EXPOSE 5050" >>  dockerfile
echo "CMD python3 /home/myapp/desafio2_app.py" >>  dockerfile

mv dockerfile tempdir/

cd tempdir/

docker build -t my_web_2 .
docker run -t -d -p 5050:5050 --name my_web_2running my_web_2
docker ps -a
