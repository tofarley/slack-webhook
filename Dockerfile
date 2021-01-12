FROM ubuntu:20.04

ENV FLASK_APP=app.py
ENV SLACK_WEBHOOK=https://hooks.slack.com/services/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

RUN apt-get update -y && \
    apt-get install -y python3 python3-pip python3-dev

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip3 install -r requirements.txt

COPY . /app

#ENTRYPOINT [ "python3" ]

CMD python3 app.py