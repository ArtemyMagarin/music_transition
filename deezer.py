from scraper.baseparser import BaseParser


class DeezerParser(BaseParser):

    @staticmethod
    def get_auth_url():
        url = 'https://connect.deezer.com/oauth/auth.php?app_id={app_id}&redirect_uri={redirect_uri}&perms=basic_access'
        return url.format(app_id=, redirect_uri=)
    
    def __init__(self):
        super(DeezerParser, self).__init__()