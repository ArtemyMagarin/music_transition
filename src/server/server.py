import json 
from bottle import Bottle, run, template, static_file, response, request, redirect
from src.scraputils.yandex import YandexMusicParser
import bottle
from bottle.ext import beaker


session_opts = {
    'session.type': 'file',
    'session.cookie_expires': 300,
    'session.data_dir': '.data',
    'session.auto': True
}

bottle.TEMPLATE_PATH += ['src/server/views']

app = beaker.middleware.SessionMiddleware(bottle.app(), session_opts)
bottle.debug(True)

def authrequired(func):
    def do_stuff(*args, **kwargs):
        s = bottle.request.environ.get('beaker.session')
        if s.get('loggedin') != True:
            return redirect('/login')
        return func(*args, **kwargs)
    
    return do_stuff


@bottle.hook('after_request')
def enable_cors():
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, OPTIONS'
    response.headers['Access-Control-Allow-Headers'] = 'Origin, Accept, Content-Type, X-Requested-With, X-CSRF-Token'


@bottle.get('/yandex/<login>')
def yandex(login):
    yms = YandexMusicParser()
    data = yms.fetch_data(login)
    response.content_type = 'application/json'
    return json.dumps(data, sort_keys=True, indent=4, separators=(',', ': '))


@bottle.get('/yandexauth')
def yandex():
    s = bottle.request.environ.get('beaker.session')
    s['loggedin'] = True
    s.save()
    url = 'https://hardwaymusic.herokuapp.com'
    return '''
        <script>
            var token = /access_token=([^&]+)/.exec(document.location.hash)[1];
            fetch('https://login.yandex.ru/info?oauth_token='+token)
            .then(data => data.json())
            .then(data => {
                window.localStorage.setItem('userData', JSON.stringify(data));
                window.location.replace('%s/user/' + data.display_name)
            })
        </script>
    ''' % url


@bottle.get('/')
@bottle.get('/index')
@authrequired
def index():
    return template('index.html')

@bottle.get('/memories')
@authrequired
def memories():
    return template('memories.html')


@bottle.get('/points')
@authrequired
def points():
    return template('points.html')


@bottle.get('/userpage')
@authrequired
def userpage():
    return template('userpage.tpl')


@bottle.get('/events')
@authrequired
def events():
    return template('events.html')

@bottle.get('/login')
def login():
    return template('login.html', root='src/server/views')

# static files
@bottle.get('/css/<filepath:re:.*\.css>')
def styles(filepath):
    return static_file(filepath, root="src/server/static/css")

@bottle.get('/js/<filepath:re:.*\.js>')
def scripts(filepath):
    return static_file(filepath, root="src/server/static/js")


@bottle.get('/img/<filepath:path>')
def images(filepath):
    return static_file(filepath, root="src/server/static/img")


@bottle.get('/favicon.ico')
def favicon():
    return static_file('favicon.ico', root="src/server/static/img")


@bottle.get('/mp3/<filepath:re:.*\.mp3>')
def audios(filepath):
    return static_file(filepath, root="src/server/static/mp3")


@bottle.route('/user/<username>', methods=['POST', 'GET'])
@authrequired
def user_management(username):
    if request.method == 'GET':
        data = {
            'loggedin': {
                'avatar': 'https://avatars.yandex.net/get-yapic/0/0-0/islands-200'
            }
        }
        return template('userpage.tpl', data=data)


# Don't forget to remove this before production deploy
@bottle.get('/lord_artemy_please_login_me')
def sudo_login():
    s = bottle.request.environ.get('beaker.session')
    s['loggedin'] = True
    s.save()
    return redirect('/')



