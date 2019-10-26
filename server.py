import json 
from bottle import Bottle, run, template, static_file, response
from yandex import YandexMusicParser

app = Bottle(__name__)

@app.hook('after_request')
def enable_cors():
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, OPTIONS'
    response.headers['Access-Control-Allow-Headers'] = 'Origin, Accept, Content-Type, X-Requested-With, X-CSRF-Token'


@app.get('/yandex/<login>')
def yandex(login):
    yms = YandexMusicParser()
    data = yms.fetch_data(login)
    response.content_type = 'application/json'
    return json.dumps(data, sort_keys=True, indent=4, separators=(',', ': '))


@app.get('/yandexauth')
def yandex():
    return '''
        <script>
            var token = /access_token=([^&]+)/.exec(document.location.hash)[1];
            fetch('https://login.yandex.ru/info?oauth_token='+token).then(data => data.json()).then(data => window.location.replace('https://hardwaymusic.herokuapp.com/yandex/'+data.display_name))
        </script>

    '''


@app.get('/')
def index():
    return template('index.html')

@app.get('/memories')
def memories():
    return template('memories.html')


@app.get('/points')
def points():
    return template('points.html')


@app.get('/userpage')
def userpage():
    return template('userpage.html')


@app.get('/events')
def userpage():
    return template('events.html')


@app.get('/css/<filepath:re:.*\.css>')
def styles(filepath):
    return static_file(filepath, root="static/css")


@app.get('/img/<filepath:path>')
def styles(filepath):
    return static_file(filepath, root="static/img")



if __name__ == '__main__':
    run(app, host='localhost', port=9999)

