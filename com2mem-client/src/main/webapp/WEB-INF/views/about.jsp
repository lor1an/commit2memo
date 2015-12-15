<html>
<head>
<title>commit2memo</title>
<link rel="icon" type="image/x-icon" href="static/img/favicon.ico" />
<link rel="shortcut icon" type="image/x-icon" href="static/img/favicon.ico" />
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="static/css/styles.css">
</head>
<body>
    <div class="navbar-wrapper">
        <div class="container"></div>
        <div class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button class="navbar-toggle" data-toggle="collapse" type="button" data-target=".navbar-collapse">
                        <span class='glyphicon glyphicon-menu-hamburger' aria-hidden='true'></span> <span
                            class="sr-only">Toggle navigation</span>
                    </button>
                    <a href="/" class="navbar-brand">commit2memo</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="cardPage">Memorizing</a></li>
                        <li><a href="profile">My profile</a> <span class="icon-envelope"></span></li>
                        <li class="activeTab"><a href="about">About</a></li>
                        <li><a href="" class="logout">Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div id="leftCol" class="col-md-3 sidebar">
                <ul class="nav nav-pills nav-stacked">
                </ul>
            </div>
            <div id="loginbox" style="margin-top: 50px;"
                class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                <div class="panel panel-info"
                    style="height: 87%; border-color: #0B0B0B; padding-left: 20px; padding-right: 20px; text-align: justify;">
                    <div>
                        <h2>Spaced repetition</h2>
                        <p>Spaced repetition is a learning technique that incorporates increasing intervals of time
                            between subsequent review of previously learned material in order to exploit the
                            psychological spacing effect. Alternative names include spaced rehearsal, expanding
                            rehearsal, graduated intervals, repetition spacing, repetition scheduling, spaced retrieval
                            and expanded retrieval</p>
                        <p>Although the principle is useful in many contexts, spaced repetition is commonly applied
                            in contexts in which a learner must acquire a large number of items and retain them
                            indefinitely in memory. It is therefore well suited for the problem of vocabulary
                            acquisition in the course of second language learning, due to the size of the target
                            language's inventory of open-class words</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="static/js/auth.js"></script>
</body>
</html>