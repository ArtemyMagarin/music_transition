import json 
from bottle import Bottle, run, template, static_file, response, redirect
from yandex import YandexMusicParser
import bottle as flask
from bottle.ext import beaker

session_opts = {
    'session.type': 'file',
    'session.cookie_expires': 300,
    'session.data_dir': './data',
    'session.auto': True
}

app = beaker.middleware.SessionMiddleware(flask.app(), session_opts)

def authrequired(func):
    def do_stuff(*args, **kwargs):
        s = flask.request.environ.get('beaker.session')
        if s.get('loggedin') != True:
            return redirect('/login')
        func(*args, **kwargs)
    
    return do_stuff


@flask.hook('after_request')
def enable_cors():
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, OPTIONS'
    response.headers['Access-Control-Allow-Headers'] = 'Origin, Accept, Content-Type, X-Requested-With, X-CSRF-Token'


@flask.get('/yandex/<login>')
def yandex(login):
    yms = YandexMusicParser()
    data = yms.fetch_data(login)
    response.content_type = 'application/json'
    return json.dumps(data, sort_keys=True, indent=4, separators=(',', ': '))


@flask.get('/yandexauth')
def yandex():
    s = flask.request.environ.get('beaker.session')
    s['loggedin'] = True
    s.save()
    return '''
        <script>
            var token = /access_token=([^&]+)/.exec(document.location.hash)[1];
            fetch('https://login.yandex.ru/info?oauth_token='+token).then(data => data.json()).then(data => window.location.replace('https://hardwaymusic.herokuapp.com/user/'+data.display_name))
        </script>
    '''


@flask.get('/')
@flask.get('/index')
@authrequired
def index():
    return template('index.html')

@flask.get('/memories')
@authrequired
def memories():
    return template('memories.html')


@flask.get('/points')
@authrequired
def points():
    return template('points.html')


@flask.get('/userpage')
@authrequired
def userpage():
    return template('userpage.html')


@flask.get('/events')
@authrequired
def events():
    return template('events.html')

@flask.get('/login')
def login():
    return template('login.html')

# static files
@flask.get('/css/<filepath:re:.*\.css>')
def styles(filepath):
    return static_file(filepath, root="static/css")


@flask.get('/img/<filepath:path>')
def styles(filepath):
    return static_file(filepath, root="static/img")


@flask.get('/favicon.ico')
def styles():
    return static_file('favicon.ico', root="static/img")




@flask.route('/user/<username>', methods=['POST', 'GET'])
@authrequired
def user_management(username):
    if request.method == 'GET':
        return template('userpage.html')



if __name__ == '__main__':
    run(app, host='localhost', port=9999)

