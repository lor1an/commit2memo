<html>
<head>
<title>commit2memo</title>
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<link rel="icon" type="image/x-icon" href="static/img/favicon.ico" />
<link rel="shortcut icon" type="image/x-icon"
	href="static/img/favicon.ico" />
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
<link rel="stylesheet" href="static/css/styles.css">
<style>
.error {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #a94442;
	background-color: #f2dede;
	border-color: #ebccd1;
}

.msg {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #31708f;
	background-color: #d9edf7;
	border-color: #bce8f1;
}

#login-box {
	width: 300px;
	padding: 20px;
	margin: 100px auto;
	background: #fff;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border: 1px solid #000;
}

.b {
	margin-right: 0;
	margin-left: 0;
	background-color: #fff;
	border-color: #ddd;
	border-width: 1px;
	border-radius: 4px 4px 0 0;
	-webkit-box-shadow: none;
	box-shadow: none;
}
</style>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top" role="banner">
		<div class="container">
			<div class="navbar-header">
				<a href="/" class="navbar-brand">commit2memo</a>
			</div>
			<nav class="collapse navbar-collapse" role="navigation">
				<ul class="nav navbar-nav">
					<li><a href="register">Sign up</a></li>
					<li><a href="about">About</a></li>
				</ul>
			</nav>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<div id="leftCol" class="col-md-3 sidebar">
				<ul class="nav nav-pills nav-stacked">
				</ul>
			</div>
			<!-- <div class="col-sm-6 worker">
				<form class="form-signin">
					<h2 class="form-signin-heading">Sign in:</h2>
					<label for="inputUsername" class="sr-only">Username</label> <input
						type="text" id="inputUsername" class="form-control"
						placeholder="Username" required="true" autofocus="true"> <label
						for="inputPassword" class="sr-only">Password</label> <input
						type="password" id="inputPassword" class="form-control"
						placeholder="Password" required="true">
					<button class="btn btn-lg btn-primary btn-block login"
						type="submit">Sign in</button>
				</form>
			</div> -->

			<div id="loginbox" style="margin-top: 50px;"
				class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
				<div class="panel panel-info">
					<div class="panel-heading">
						<div class="panel-title">Sign In</div>
					</div>
					<div style="padding-top: 30px" class="panel-body">

						<div style="display: none" id="login-alert"
							class="alert alert-danger col-sm-12"></div>

						<form id="loginform" class="form-horizontal" role="form">

							<div style="margin-bottom: 25px" class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-user"></i></span> <input
									id="inputUsername" type="text" class="form-control"
									name="username" value="" placeholder="username or email">
							</div>

							<div style="margin-bottom: 25px" class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-lock"></i></span> <input
									id="inputPassword" type="password" class="form-control"
									name="password" placeholder="password">
							</div>

							<div style="margin-top: 10px" class="form-group">

								<div class="col-sm-12 controls">
									<a id="btn-login" href="#" class="btn btn-success login">Login
									</a>
								</div>
							</div>

						</form>



					</div>
				</div>
			</div>
		</div>

	</div>

	<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
	<script>
        $('.login').click(function(e) {
            e.preventDefault();
            console.log();
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            console.log(token);
            console.log(header);
            var inUser = $('#inputUsername').val();
            var inPass = $('#inputPassword').val();
            $.ajax({
                url : 'http://localhost:10080/commit2memo/j_spring_security_check',
                type : 'POST',
                data : {
                    "username" : inUser,
                    "password" : inPass
                },
                beforeSend : function(xhr) {
                    xhr.setRequestHeader("X-Ajax-call", "true");
                   // xhr.setRequestHeader(header, token);
                },
                success : function(data) {
                    window.location = "http://localhost:10080/commit2memo/card";
                },
                error : function(data) {
                    console.log(data);
                }
            });
        });
    </script>
</body>
</html>