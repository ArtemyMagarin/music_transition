var user = JSON.parse(window.localStorage.getItem('userData'));
var login = user.login

function renderUserPlaylists() {
    var user = JSON.parse(window.localStorage.getItem('userData'));
    var login = user.login;
    fetch('https://hardwaymusic.herokuapp.com/yandex/'+login)
        .then(data => data.json())
        .then(playlists => {
            playlists.forEach(playlist => {
                let cover = 'https://' + playlist.cover + 'm1000x1000';
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
    <div class="card">
        <img src="${cover}" style="height: 200px; width: 200px"/>'
        <div class="card-body">
            <span class="card-title">${title}</span>
            <br>
            <span class="card-text">${count}</span>
      </div>
    </div>`)
}


renderUserPlaylists()

