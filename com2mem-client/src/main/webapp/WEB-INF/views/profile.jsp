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
                        <li class="activeTab"><a href="profile">My profile</a> <span class="icon-envelope"></span></li>
                        <li><a href="about">About</a></li>
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
            <div  style="margin-top: 50px"
                class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <div class="panel-title">My profile</div>
                        <div style="float: right; font-size: 85%; position: relative; top: -10px"></div>
                    </div>
                    <div class="panel-body">
                        <form id="signupform" class="form-horizontal" role="form">
                            <div id="eForm" class="form-group">
                                <label id="alE3"
                                    for="email" class="col-md-3 control-label">Email</label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control" id="inputEmail" name="email"
                                        placeholder="Email Address"> <span id="sucE"
                                        class="glyphicon glyphicon-ok form-control-feedback hooded" aria-hidden="true"></span>
                                    <span id="failE" class="glyphicon glyphicon-remove form-control-feedback hooded"
                                        aria-hidden="true"></span>
                                </div>
                            </div>
                            <div id="uForm" class="form-group">
                                 <label
                                    id="alU3" for="username" class="col-md-3 control-label">Username</label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control" id="inputUsername" name="username"
                                        placeholder="Username"> <span id="sucU"
                                        class="glyphicon glyphicon-ok form-control-feedback hooded" aria-hidden="true"></span>
                                    <span id="failU" class="glyphicon glyphicon-remove form-control-feedback hooded"
                                        aria-hidden="true"></span>
                                </div>
                            </div>
                            <div id="pForm" class="form-group">
                                <label id="alP1" for="password" class="col-md-3 control-label">Password</label> <label
                                    id="alP2" for="password" class="col-md-3 control-label  hooded">Your
                                    password must be at least 4 characters</label>
                                <div class="col-md-9">
                                    <input type="password" class="form-control" id="inputPassword" name="password"
                                        placeholder="Password"><span id="sucP"
                                        class="glyphicon glyphicon-ok form-control-feedback hooded" aria-hidden="true"></span>
                                    <span id="failP" class="glyphicon glyphicon-remove form-control-feedback hooded"
                                        aria-hidden="true"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-3 col-md-9">
                                    <button id="btn-signup" type="button" class="btn btn-info register">Sign Up</button>
                                </div>
                            </div>
                        </form>
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