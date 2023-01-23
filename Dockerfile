FROM python:3.9.16-buster

RUN apt-get update && apt-get install -y sqlite3

WORKDIR /4tapp

ADD eCommerce ./eCommerce
ADD static ./static
ADD store ./store
ADD templates ./templates
ADD db.sqlite3 ./
ADD requirements.txt ./
ADD manage.py ./

RUN pip install -r requirements.txt

RUN python manage.py migrate

CMD python manage.py runserver 0.0.0.0:8000