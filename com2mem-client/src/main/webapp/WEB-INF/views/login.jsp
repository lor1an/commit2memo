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
                        <li class="activeTab"><a href="register">Sign in</a></li>
                        <li><a href="register">Sign up</a></li>
                        <li><a href="static/pages/about.html">About</a></li>
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
                <div class="panel panel-info">
                    <div id="head" class="panel-heading">
                        <div class="panel-title">Sign In</div>
                    </div>
                    <div id="alert" class="alert alert-danger" role="alert"
                        style="display: none; padding: 10px; margin-bottom: 0; font-size: 16px;">
                        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> <span
                            class="sr-only">Error:</span> The username and password do not match
                    </div>
                    <div style="padding-top: 30px" class="panel-body">
                        <div style="display: none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                        <form id="loginform" class="form-horizontal" role="form">
                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> <input
                                    id="inputUsername" type="text" class="form-control" name="username" value=""
                                    placeholder="username or email">
                            </div>
                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span> <input
                                    id="inputPassword" type="password" class="form-control" name="password"
                                    placeholder="password">
                            </div>
                            <div style="margin-top: 10px" class="form-group">
                                <div class="col-sm-12 controls">
                                    <a id="btn-login" href="#" class="btn btn-success login">Login </a>
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