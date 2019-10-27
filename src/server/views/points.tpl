<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Melomania</title>

    <script src="https://music.yandex.ru/api/audio/dist/index.js"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="/css/player.css"/>
</head>
<body>

    <div class="container-fluid">
        <div class="row">
        % include('sidebar.tpl')
        <div class="col ml-3 mr-3">
            <div class="row mt-4">
                <h1 class="display-4">
                    <span id="points">225</span> points
                </h1>
            </div>

            <div class="row">
                <div class="card mb-3 w-100">
                    <div class="row no-gutters">
                        <div class="col-2">
                            <img src="/img/lisa.png" class="card-img">
                        </div>
                        <div class="col-10">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <p class="card-text" style="font-size: 24px">Merch / Clothes</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <h1 class="card-title"><strong>T-Shirt from Lisa</strong></h1>
                                    </div>
                                    <div class="col-md-4">
                                        <button type="button" class="btn btn-danger btn-block btn-md point-btn"
                                                onclick="modifyPoints(-200)">Buy for <span class="point_value">200</span> points</button>
                                    </div>
                                </div>
                                <div class="row mb-0">
                                    <div class="col-md-8">
                                        <p class="card-text text-muted">Monetochka</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="card mb-3 w-100">
                    <div class="row no-gutters">
                        <div class="col-2">
                            <img src="/img/a-ha.png" class="card-img">
                        </div>
                        <div class="col-10">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <p class="card-text" style="font-size: 24px">Concert / Discount</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <h1 class="card-title"><strong>10% discount</strong></h1>
                                    </div>
                                    <div class="col-md-4">
                                        <button type="button" class="btn btn-danger btn-block btn-md point-btn"
                                                onclick="modifyPoints(-300)">Buy for <span class="point_value">300</span> points</button>
                                    </div>
                                </div>
                                <div class="row mb-0">
                                    <div class="col-md-8">
                                        <p class="card-text text-muted">a-ha</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="card mb-3 w-100">
                    <div class="row no-gutters">
                        <div class="col-2">
                            <img src="/img/gaga.png" class="card-img">
                        </div>
                        <div class="col-10">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <p class="card-text" style="font-size: 24px">Bonus</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <h1 class="card-title"><strong>Sing Bad Romance in Karaoke</strong></h1>
                                    </div>
                                    <div class="col-md-4">
                                        <button type="button" class="btn btn-danger btn-block btn-md" onclick="modifyPoints(100)">Get 100 points</button>
                                    </div>
                                </div>
                                <div class="row mb-0">
                                    <div class="col-md-8">
                                        <p class="card-text text-muted">Lady Gaga</p>
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
<script type="text/javascript">
    function setPoints(points) {

        if (points) {
            document.querySelector('#points').innerHTML = points;
        }
        else {
            document.querySelector('#points').innerHTML = 0;
        }
    }
    function modifyPoints(points_num) {
        let current_points = document.querySelector('#points').innerHTML;
        let new_points = parseInt(current_points)+parseInt(points_num)
        if (new_points >= 0) {
            localStorage.setItem('points_sum', new_points);
            setPoints(new_points);
            setButtonStyles(new_points);
        }
        else {
            alert("Not enough points :(")
        }
    }
    function setButtonStyles(current_points) {
        let btns = document.querySelectorAll('.point-btn');
        for (i=0; i<btns.length; i++) {
            let points_value = parseInt(btns[i].querySelector('.point_value').innerHTML);
            if (points_value > current_points) {
                btns[i].classList.add('disabled');
            }
            else {
                btns[i].classList.remove('disabled');
            }
        }

    }

    document.addEventListener("DOMContentLoaded", function(event) {
        let points = localStorage.getItem('points_sum');
        setButtonStyles(points);
        setPoints(points);

    });

</script>
<script src="/js/user.js"></script>
<script src="/js/player.js"></script>


</body>
</html>
