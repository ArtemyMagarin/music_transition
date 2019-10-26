#!/usr/bin/env python3

from wsgi import application
from bottle import run


run(application, host='localhost', port=9999, reloader=True)
