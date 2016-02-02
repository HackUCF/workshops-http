#!/usr/bin/env python
import os

from flask import Flask, render_template, request, abort
from tornado.wsgi import WSGIContainer
from tornado.httpserver import HTTPServer
from tornado.ioloop import IOLoop
import requests

app = Flask(__name__)
FLAG = os.environ.get('FLAG', None)
if FLAG is None:
    raise ValueError('FLAG environment variable missing! Nobody can win...')

@app.route('/')
def index():
    return render_template('index.html')


@app.route('/visit', methods=['POST'])
def visit():
    url = request.form['url']
    if not url.startswith(('http://', 'https://')):
        abort(400)

    data = {'flag': FLAG}
    headers = {'User-Agent': 'http-scorer/1.0'}
    requests.post(url, data=data, headers=headers)
    return render_template('visit.html', url=url)

def main():
    http_server = HTTPServer(WSGIContainer(app))
    http_server.listen(80)
    IOLoop.instance().start()

if __name__ == '__main__':
    main()
