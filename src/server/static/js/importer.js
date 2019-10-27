var user = JSON.parse(window.localStorage.getItem('userData'));
var login = user.login

function renderUserPlaylists() {
    var user = JSON.parse(window.localStorage.getItem('userData'));
    var login = user.login;
    fetch('https://hardwaymusic.herokuapp.com/yandex/'+login)
        .then(data => data.json())
        .then(playlists => {
            let tmp = document.getElementById('card-playlist-import');
                tmp.parentNode.removeChild(tmp);

            playlists.forEach(playlist => {
                let cover = 'https://' + (playlist.cover || 'avatars.yandex.net/get-music-user-playlist/51766/playlist-match-default/%%').replace('%%', 'm400x400');
                let title = playlist.title;
                let count = playlist.tracks.length;
                let el = buildPlaylistCard(cover, title, count);
                document.querySelector('.playlists-wrapper').appendChild(el);
            })
        })
}

function createElementFromHTML(htmlString) {
    var div = document.createElement('div');
    div.innerHTML = htmlString.trim();
    return div.firstChild; 
}

function buildPlaylistCard(cover, title, count) {
    return createElementFromHTML(`
    <div class="card ml-3">
        <img src="${cover}" style="height: 200px; width: 200px"/>
        <div class="card-body">
            <span class="card-title">${title}</span>
            <br>
            <span class="card-text">${count} item${count>1?'s':''}</span>
      </div>
    </div>`)
}


document.getElementById('card-playlist-import').addEventListener('click', renderUserPlaylists);

