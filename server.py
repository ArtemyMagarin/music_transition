from bottle import Bottle


app = Bottle(__name__)

@app.get('/yandex/<login:int>')
def yandex(login):
	yms = YandexMusicParser()
	data = yms.fetch_data(login)
    return data
