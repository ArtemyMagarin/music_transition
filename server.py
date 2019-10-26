import json 
from bottle import Bottle, run
from yandex import YandexMusicParser

app = Bottle(__name__)

@app.get('/yandex/<login>')
def yandex(login):
    yms = YandexMusicParser()
    data = yms.fetch_data(login)
    return json.dumps(data)


if __name__ == '__main__':
    run(app, host='localhost', port=9999)
