import re
from baseparser import BaseParser


class YandexMusicParser(BaseParser):
    PLAYLISTS_URL = 'https://music.yandex.ru/handlers/playlists-list.jsx'
    PLAYLISTS_UI_URL = 'https://music.yandex.ru/users/{username}/playlists'
    PLAYLIST_URL = 'https://music.yandex.ru/handlers/playlist.jsx?owner={owner_id}&kinds={kinds}'

    @staticmethod
    def process_track(t):
        return {
            'title': t['title'],
            'cover': t['ogImage'],
            'albums': [a['title'] for a in t['albums']],
            'artists': [a['name'] for a in t['artists']]
        }

    def __init__(self):
        super(YandexMusicParser, self).__init__()

    def fetch_owner_id(self, username):
        res = self.do_get(YandexMusicParser.PLAYLISTS_UI_URL.format(username=username)).text
        owner_id = re.search(r'"uid":"(\d+)"', res, re.IGNORECASE)
        return owner_id.group(1) if owner_id else None

    def fetch_playlists(self, owner_id) -> list:
        return self.do_post(YandexMusicParser.PLAYLISTS_URL, data={'ids': 1000, 'owner': owner_id}).json()

    def fetch_playlist(self, owner_id, kind_id):
        res = self.do_get(YandexMusicParser.PLAYLIST_URL.format(owner_id=owner_id, kinds=kind_id)).json()['playlist']
        return res

    def build_playlist(self, raw):
        """This method is unsafe, need some validation method"""
        cover = raw.get('ogImage')  # may be illegal
        title = raw.get('title')
        tracks = list(map(self.process_track, raw.get('tracks', [])))
        return {'cover': cover, 'title': title, 'tracks': tracks}

    def fetch_data(self, username):
        owner_id = self.fetch_owner_id(username)
        playlists = self.fetch_playlists(owner_id)
        return [self.build_playlist(self.fetch_playlist(owner_id, playlist['kind'])) for playlist in playlists]


if __name__ == '__main__':
    ymp = YandexMusicParser()
    print(ymp.fetch_data('magar.art'))
    print(ymp.fetch_data('v.stromtsova'))
    print(ymp.fetch_data('revyakinpa'))
