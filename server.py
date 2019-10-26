import json 
from bottle import Bottle, run, template, static_file, response, request, redirect
from yandex import YandexMusicParser
import bottle as flask
from bottle.ext import beaker

LOCAL = False

session_opts = {
    'session.type': 'file',
    'session.cookie_expires': 300,
    'session.data_dir': '.data',
    'session.auto': True
}

app = beaker.middleware.SessionMiddleware(flask.app(), session_opts)
flask.debug(True)

def authrequired(func):
    def do_stuff(*args, **kwargs):
        s = flask.request.environ.get('beaker.session')
        if s.get('loggedin') != True:
            return redirect('/login')
        return func(*args, **kwargs)
    
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


@flask.post('/datahandler')
def datahandler():
    data = request.json
    s['user'] = data
    s.save()
    return 'ok'


@flask.get('/yandexauth')
def yandex():
    s = flask.request.environ.get('beaker.session')
    s['loggedin'] = True
    s.save()
    url = 'https://hardwaymusic.herokuapp.com' if not LOCAL else 'http://localhost:9999'
    return '''
        <script>
            var token = /access_token=([^&]+)/.exec(document.location.hash)[1];
            fetch('https://login.yandex.ru/info?oauth_token='+token)
            .then(data => data.json())
            .then(data => {
                window.localStorage.setItem('userData', JSON.stringify(data));
                fetch('%s/datahandler', { method: 'post', data: data })
                    .then(data => data.text())
                    .then(item => window.location.replace('%s/user/' + data.display_name))
            })
        </script>
    '''% (url, url)


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
    return template('userpage.tpl')


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

@flask.get('/css/<filepath:re:.*\.js>')
def scripts(filepath):
    return static_file(filepath, root="static/js")


@flask.get('/img/<filepath:path>')
def images(filepath):
    return static_file(filepath, root="static/img")


@flask.get('/favicon.ico')
def favicon():
    return static_file('favicon.ico', root="static/img")


@flask.route('/user/<username>', methods=['POST', 'GET'])
@authrequired
def user_management(username):
    s = flask.request.environ.get('beaker.session')
    if request.method == 'GET':
        data = {
            'loggedin': {
                'avatar': 'https://avatars.yandex.net/get-yapic/'+s['user']['default_avatar_id']+'/islands-200'
            },
            'owner': {
                'avatar': 'https://avatars.yandex.net/get-yapic/'+s['user']['default_avatar_id']+'/islands-200',
                'name': s['user']['real_name']
            }
        }
        return template('userpage.tpl', data=data)


# Don't forget to remove this before production deploy
@flask.get('/lord_artemy_please_login_me')
def sudo_login():
    s = flask.request.environ.get('beaker.session')
    s['loggedin'] = True
    s.save()
    return redirect('/')



if __name__ == '__main__':
    LOCAL = True
    run(app, host='localhost', port=9999, reloader=True)

