# flask_web/app.py

from os import environ
from flask import Flask
from markupsafe import escape
import requests

slack_webhook = environ.get('SLACK_WEBHOOK')

app = Flask(__name__)

@app.route('/')
def index():
    return 'Index Page: %s' % slack_webhook

@app.route('/<freq>/<title>/<desc>')
def job_complete(freq, title, desc):
    #return 'Freqency: %s, Title: %s, Desc: %s' % (freq, title, desc)
    msg = "Message from %s: %s" % (escape(title), escape(desc))
    requests.post(slack_webhook, data={'text': msg})
    return "ok"

if __name__ == '__main__':
      app.run(host='0.0.0.0', port=5000)