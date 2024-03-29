<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Melomania</title>

    <script src="https://music.yandex.ru/api/audio/dist/index.js"></script>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="/css/player.css"/>
</head>
<body>

    <div class="container-fluid">
        <div class="row">
            % include('sidebar.tpl', title='Page Title')
            <div class="col ml-3 mr-3">
                <div class="row mt-4">
                    <h1 class="display-4">
                        My music
                    </h1>
                </div>
                <div class="row d-flex align-items-center mt-4">
                    <img src="#" class="float-left user-img mr-4 personal_image">
                    <span class="align-middle user-name personal_name"></span>
                </div>

                <div class="row mt-4">
                    <!-- <ul class="list-group list-group-horizontal">
                      <li class="list-group-item">Треки</li>
                      <li class="list-group-item">Альбомы</li>
                      <li class="list-group-item">Исполнители</li>
                      <li class="list-group-item list-group-item-active">Плейлисты</li>
                    </ul> -->

                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                      <li class="nav-item">
                        <a class="nav-link" id="track-tab" data-toggle="tab" href="#track" role="tab" aria-controls="track" aria-selected="true">Tracks</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" id="album-tab" data-toggle="tab" href="#album" role="tab" aria-controls="album" aria-selected="false">Albums</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" id="artist-tab" data-toggle="tab" href="#artist" role="tab" aria-controls="artist" aria-selected="false">Artists</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link active" id="lists-tab" data-toggle="tab" href="#lists" role="tab" aria-controls="lists" aria-selected="false">Playlists</a>
                      </li>
                    </ul>
                </div>
                <div class="row mt-4">
                    <div class="tab-content" id="myTabContent">
                      <div class="tab-pane fade" id="track" role="tabpanel" aria-labelledby="track-tab">There are no tracks here yet</div>
                      <div class="tab-pane fade" id="album" role="tabpanel" aria-labelledby="album-tab">There are no albums here yet</div>
                      <div class="tab-pane fade" id="artist" role="tabpanel" aria-labelledby="artist-tab">There are no artists here yet</div>
                      <div class="tab-pane fade show active" id="lists" role="tabpanel" aria-labelledby="lists-tab">
                        <div class="row playlists-wrapper">
                            <div id='card-playlist-import' class="card ml-3" >
                              <svg width="200" height="200" viewBox="0 0 200 200" fill="none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                <rect x="1" y="1" width="198" height="198" rx="3" fill="white" stroke="#EFEFEF" stroke-width="2"/>
                                <rect x="36" y="43" width="128" height="128" fill="url(#pattern1)" fill-opacity="0.85"/>
                                <defs>
                                <pattern id="pattern1" patternContentUnits="objectBoundingBox" width="1" height="1">
                                <use xlink:href="#image1" transform="scale(0.0078125)"/>
                                </pattern>
                                <image id="image1" width="128" height="128" xlink:href="data:image/png;base64,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"/>
                                </defs>
                                </svg>


                              <div class="card-body">
                                <span class="card-title">Add tracks</span><br>

                                <span class="card-text">from other services</span>
                              </div>
                            </div>
                        </div>

                      </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="/js/player.js"></script>

    <script src="/js/user.js"></script>
    <script src="/js/importer.js"></script>
</body>
</html>
