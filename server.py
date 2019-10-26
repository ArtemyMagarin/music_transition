import json 
from bottle import Bottle, run
from yandex import YandexMusicParser

app = Bottle(__name__)

@app.get('/yandex/<login>')
def yandex(login):
    yms = YandexMusicParser()
    data = yms.fetch_data(login)
    return json.dumps(data, sort_keys=True, indent=4, separators=(',', ': '))


@app.get('/yandexauth')
def yandex():
    return '''
        <script>
            var token = /access_token=([^&]+)/.exec(document.location.hash)[1];
            fetch('https://login.yandex.ru/info?oauth_token='+token).then(data => data.json()).then(data => window.location.replace('https://hardwaymusic.herokuapp.com/yandex/'+data.display_name))
        </script>

    '''

if __name__ == '__main__':
    run(app, host='localhost', port=9999)

