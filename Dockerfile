FROM ubuntu:20.04

ENV FLASK_APP=app.py

RUN apt-get update -y && \
    apt-get install -y python3 python3-pip python3-dev

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip3 install -r requirements.txt

COPY . /app

#ENTRYPOINT [ "python3" ]

<<<<<<< HEAD
CMD python3 app.py
=======
CMD python3 app.py
>>>>>>> 670d9d0efc44f58a934eceda959f9e12b61e276c
