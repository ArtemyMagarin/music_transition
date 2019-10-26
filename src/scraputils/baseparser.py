import requests


class BaseParser:
    def __init__(self):
        self.session = requests.Session()

    def do_get(self, url, params=None):
        return self.session.get(url, data=params)

    def do_post(self, url, data):
        return self.session.post(url, data=data)
