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
                    Memories
                </h1>
            </div>
            <div class="row">
                <div class="card mb-4 mt-4 w-100">
                    <div class="row no-gutters">
                        <div class="col-3">
                            <svg class="card-img" width="128" height="128" viewBox="0 0 128 128" fill="none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                <rect width="128" height="128" fill="url(#pattern0)"/>
                                <defs>
                                    <pattern id="pattern0" patternContentUnits="objectBoundingBox" width="1" height="1">
                                        <use xlink:href="#image0" transform="scale(0.0078125)"/>
                                    </pattern>
                                    <image id="image0" width="128" height="128" xlink:href="data:image/png;base64,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"/>
                                </defs>
                            </svg>
                        </div>
                        <div class="col-6">
                            <div class="card-body">
                                <h1 class="card-title">Your year 2015</h1>
                                <p class="card-text">
                                    Remember what you were listening to 4 years ago.
                                </p>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="card-body">
                            <button type="button" class="btn btn-danger btn-block btn-md mt-4">
                                Listen
                                <svg class="ml-2" width="12" height="14" viewBox="0 0 16 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M15 7.26795C16.3333 8.03775 16.3333 9.96225 15 10.7321L3 17.6603C1.66667 18.4301 -8.94676e-07 17.4678 -8.27378e-07 15.9282L-2.21695e-07 2.0718C-1.54397e-07 0.532196 1.66667 -0.430055 3 0.339746L15 7.26795Z" fill="white"/>
                                </svg>
                            </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="card mb-4 w-100">
                    <div class="row no-gutters">
                        <div class="col-3">
                            <svg class="card-img" width="164" height="164" viewBox="0 0 164 164" fill="none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                <rect x="72.5806" y="0.816589" width="116.108" height="116.108" transform="rotate(38.3326 72.5806 0.816589)" fill="url(#pattern1)"/>
                                <defs>
                                    <pattern id="pattern1" patternContentUnits="objectBoundingBox" width="1" height="1">
                                        <use xlink:href="#image1" transform="scale(0.0078125)"/>
                                    </pattern>
                                    <image id="image1" width="128" height="128" xlink:href="data:image/png;base64,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"/>
                                </defs>
                            </svg>
                        </div>
                        <div class="col-6">
                            <div class="card-body">
                                <h1 class="card-title">Autumn mix</h1>
                                <p class="card-text">
                                    Songs that you enjoy when the leaves are yellow.
                                </p>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="card-body">
                                <button type="button" class="btn btn-danger btn-block btn-md mt-4">
                                    Listen
                                    <svg class="ml-2" width="12" height="14" viewBox="0 0 16 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M15 7.26795C16.3333 8.03775 16.3333 9.96225 15 10.7321L3 17.6603C1.66667 18.4301 -8.94676e-07 17.4678 -8.27378e-07 15.9282L-2.21695e-07 2.0718C-1.54397e-07 0.532196 1.66667 -0.430055 3 0.339746L15 7.26795Z" fill="white"/>
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="card mb-3 pt-3 pb-3 w-100">
                    <div class="row no-gutters">
                        <div class="col-3">
                            <svg class="card-img" width="128" height="128" viewBox="0 0 128 128" fill="none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                <rect width="128" height="128" fill="url(#pattern2)"/>
                                <defs>
                                    <pattern id="pattern2" patternContentUnits="objectBoundingBox" width="1" height="1">
                                        <use xlink:href="#image2" transform="scale(0.0078125)"/>
                                    </pattern>
                                    <image id="image2" width="128" height="128" xlink:href="data:image/png;base64,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"/>
                                </defs>
                            </svg>
                        </div>
                        <div class="col-6">
                            <div class="card-body">
                                <h1 class="card-title">Back to 2007</h1>
                                <p class="card-text">
                                    Go back in time to 2007!
                                </p>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="card-body">
                                <button type="button" class="btn btn-danger btn-block btn-md mt-4">
                                    Listen
                                    <svg class="ml-2" width="12" height="14" viewBox="0 0 16 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M15 7.26795C16.3333 8.03775 16.3333 9.96225 15 10.7321L3 17.6603C1.66667 18.4301 -8.94676e-07 17.4678 -8.27378e-07 15.9282L-2.21695e-07 2.0718C-1.54397e-07 0.532196 1.66667 -0.430055 3 0.339746L15 7.26795Z" fill="white"/>
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<script src="/js/user.js"></script>
<script src="/js/player.js"></script>
</body>
</html>
