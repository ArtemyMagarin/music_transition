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
            % include('sidebar.tpl')
            <div class="col-9" style="padding: 0 30px;">
                <div class="row mt-2">
                    <div class="card mb-3 w-100">
                        <div class="row no-gutters">
                            <h4 class="mt-4 ml-4 mb-0">Insights</h4>
                        </div>

                        <div class="row no-gutters p-2">
                            <img src="/img/spleen.png" class="story" data-toggle="modal" data-target="#ingihtsModal" data-whatever="/img/spleen.png"/>
                            <img src="/img/diana.png" class="story" data-toggle="modal" data-target="#ingihtsModal" data-whatever="/img/diana.png"/>
                            <img src="/img/filipp.png" class="story" data-toggle="modal" data-target="#ingihtsModal" data-whatever="/img/filipp.png"/>
                            <img src="/img/irina.png" class="story" data-toggle="modal" data-target="#ingihtsModal" data-whatever="/img/irina.png"/>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="card mb-3 w-100">
                        <div class="row no-gutters">
                            <div class="col-3">
                                <img src="https://s3-alpha-sig.figma.com/img/ddfc/296a/b4935703c191f8d0526e1127ef4aec51?Expires=1572825600&Signature=Ythe-REHOBZNph2TAwBXXw1O6r0JViW1vn2QuocO7fC73ReLOWbLLYQag~dIc5ExGZTtR-pqFD11ZMGB-NLuYGjU7r5Puzx433xzW68XQ4FzbaHThp9767RmeVdXK-cGFJqG5zPIDHxbfpvilp1hiug5n-PnSXBYVroW8kH6d7t3p-KOLSl2x6dy0xpNl5qpCDFgKtbU2QqgG-WYjDJ4~KnsPm~fRQXtsACjgaNVNcK3VXzAuz31xHaR~3UmKW~dOJAvbkpF24jebq~YSGmoH6m6afCsS76fvl-uHwtyNsRgb10wLkz8uM4dxDHu6GEI5GeT1SJj3r0c6nETm6GV-A__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA" class="card-img img-fluid" alt="...">
                            </div>
                        <div class="col-9">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <p class="card-text" style="font-size: 24px">Upcoming concert</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <h1 class="card-title"><strong>Bring Me the Horizon</strong></h1>
                                    </div>
                                    <div class="col-md-4">
                                        <button type="button" class="btn btn-danger btn-block btn-md"><a href="https://spb.ponominalu.ru/event/bring-me-the-horizon" target="_blank">Buy ticket</a></button>
                                    </div>
                                </div>
                                    <div class="row mb-0">
                                        <div class="col-md-8">
                                            <p class="card-text text-muted">6th of February | Yubileyny Sports Palace</p>
                                        </div>
                                        <div class="col-md-4">
                                            <p class="card-text text-muted text-center">10% discount for 30 points!</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="card card-battle mb-3 p-3 w-100">
                        <div class="row no-gutters">
                            <div id="battle-left" class="battle-side" style="width: 50%; border-right: 2px solid #de0e0e">
                                <div class="row battle-row">
                                    <div class="col-5">
                                        <img src="https://kudago.com/media/images/event/46/63/46637b8aabd406c0cd83df1d9e601f8c.jpg" class="card-img">
                                    </div> 
                                    <div class="offset-1">
                                        <svg class="ml-2" width="22" height="26" viewBox="0 0 16 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M15 7.26795C16.3333 8.03775 16.3333 9.96225 15 10.7321L3 17.6603C1.66667 18.4301 -8.94676e-07 17.4678 -8.27378e-07 15.9282L-2.21695e-07 2.0718C-1.54397e-07 0.532196 1.66667 -0.430055 3 0.339746L15 7.26795Z" fill="#eb0e0e"/>
                                                </svg>
                                    </div>
                                    <div class="offset-1">
                                        <span class="battle-artist" onclick="closetab('r')">
                                            Affinage
                                        </span><br>
                                        <span class="battle-artist-percent" onclick="closetab('r')">
                                            23%
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div id="battle-right" class="battle-side" style="width: 50%">
                                <div class="row battle-row">
                                    <div class="offset-1">
                                        <span class="battle-artist" onclick="closetab('l')">
                                            RSAC
                                        </span><br>
                                        <span class="battle-artist-percent" onclick="closetab('r')">
                                            77%
                                        </span>
                                    </div>
                                    <div class="offset-1">
                                        <svg class="ml-2" width="22" height="26" viewBox="0 0 16 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M15 7.26795C16.3333 8.03775 16.3333 9.96225 15 10.7321L3 17.6603C1.66667 18.4301 -8.94676e-07 17.4678 -8.27378e-07 15.9282L-2.21695e-07 2.0718C-1.54397e-07 0.532196 1.66667 -0.430055 3 0.339746L15 7.26795Z" fill="#eb0e0e"/>
                                                </svg>
                                    </div>
                                    <div class="col-5 offset-2">
                                        <img src="https://avatars.mds.yandex.net/get-afishanew/34116/5e29cf9015e2e3bc2a1f4dab65506a91/960x690_noncrop" class="card-img">
                                    </div>
                                </div>
                            </div>

                            
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="card mb-3 p-3 w-100">
                        <div class="row no-gutters">
                            <div class="col-2">
                                <img src="https://avatars.yandex.net/get-music-content/2399641/0642dd6f.a.9070622-1/200x200" class="card-img">
                            </div>
                            <div class="col-9 offset-1" >
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <p class="card-text" style="font-size: 24px">New release</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-8">
                                            <h1 class="card-title"><strong>JESUS IS KING</strong></h1>
                                        </div>
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-danger btn-block btn-md">
                                                Listen
                                                <svg class="ml-2" width="12" height="14" viewBox="0 0 16 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M15 7.26795C16.3333 8.03775 16.3333 9.96225 15 10.7321L3 17.6603C1.66667 18.4301 -8.94676e-07 17.4678 -8.27378e-07 15.9282L-2.21695e-07 2.0718C-1.54397e-07 0.532196 1.66667 -0.430055 3 0.339746L15 7.26795Z" fill="white"/>
                                                </svg>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="row mb-0">
                                        <div class="col-md-8">
                                            <p class="card-text text-muted">Kanye West | Foreign rap & hip-hop</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="card mb-3 p-3 w-100">
                        <div class="row no-gutters">
                            <div class="col-2">
                                <img src="https://pbs.twimg.com/profile_images/1148663897538224129/DIod8cN8_400x400.jpg" class="card-img" style="border-radius: 100px">
                            </div>
                            <div class="col-9 offset-1" >
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <p class="card-text text-muted">@ladygaga on Twitter | 16 Oct</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-8 pt-2">
                                            <h3 class="card-title">What's fortnite</h3>
                                        </div>
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-primary btn-block btn-md"><a href="https://twitter.com/ladygaga/status/1184174532124266496" target="_blank">Open on Twitter</a></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ingihtsModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">

          <div class="modal-body">
            <img src="/img/spleen.png"/>
          </div>

        </div>
      </div>
    </div>

    <script src="/js/player.js"></script>


    <script type="text/javascript">
        function closetab(side) {
            let side_open = 'battle-right';
            let side_close = 'battle-left';
            let number = '78%';
            if (side === 'r') {
                side_close = 'battle-right';
                side_open = 'battle-left';
                number = '24%';
            }

            document.getElementById(side_close).style.width = '0%';
            document.getElementById(side_close).style.opacity = '0';
            document.getElementById(side_open).style.width = '100%';
            document.getElementById('battle-left').style.border = 'none';
            document.querySelector('#' + side_open + ' .battle-artist-percent').innerHTML = number;

            localStorage.setItem('voted', side);
        }

        // function createPlayer() {
        //     var player = new ya.music.Audio();
        //     var appletContainer = document.querySelector("#player");
        //     var audioPlayer = new ya.music.Audio(null, appletContainer);
        //     audioPlayer.initPromise().then(function() {
        //         console.log("Аудиоплеер готов к работе.");
        //     }, function() {
        //         console.error("Не удалось инициализировать аудиоплеер.");
        //     });
        // }

        function openInsightsModal() {
            $('#ingihtsModal').on('show.bs.modal', function (event) {
              var button = $(event.relatedTarget) 
              var url = button.data('whatever') 

              var modal = $(this)
              modal.find('.modal-body img').attr('src', url)
            })
        }

        document.addEventListener("DOMContentLoaded", function(event) { 
            if (localStorage.getItem('voted')) {
                closetab(localStorage.getItem('voted'));
            }
            // createPlayer();
            openInsightsModal();

        });
  

    </script>
    <script src="/js/user.js"></script>


</body>
</html>
