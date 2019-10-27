import re
from src.scraputils.baseparser import BaseParser


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

    def fetch_playlists(self, username) -> list:
        res = self.do_get(YandexMusicParser.PLAYLISTS_UI_URL.format(username=username)).text
        playlist_ids_s = re.search(r'"playlistIds":\[([0-9, ]*?)\]', res, re.IGNORECASE)
        if playlist_ids_s:
            return list(map(lambda s: s.strip(), playlist_ids_s.group(1).split(',')))
        return []

    def fetch_playlist(self, owner_id, kind_id):
        res = self.do_get(YandexMusicParser.PLAYLIST_URL.format(owner_id=owner_id, kinds=kind_id)).json()['playlist']
        return res

    def build_playlist(self, raw):
        """This method is unsafe, need some validation method"""
        cover = raw.get('ogImage', raw.get('cover', {}).get('uri'))  # may be illegal
        title = raw.get('title')
        tracks = list(map(self.process_track, raw.get('tracks', [])))
        return {'cover': cover, 'title': title, 'tracks': tracks}

    def fetch_data(self, username):
        owner_id = self.fetch_owner_id(username)
        playlist_ids = self.fetch_playlists(username)
        return [self.build_playlist(self.fetch_playlist(owner_id, playlist)) for playlist in playlist_ids]
