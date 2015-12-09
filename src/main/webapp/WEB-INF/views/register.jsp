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
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top" role="banner">
		<div class="container">
			<div class="navbar-header">
				<a href="/" class="navbar-brand">commit2memo</a>
			</div>
			<nav class="collapse navbar-collapse" role="navigation">
				<ul class="nav navbar-nav">
					<li><a href="login">Sign in</a></li>
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

			<div id="signupbox" style="margin-top: 50px"
				class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
				<div class="panel panel-info">
					<div class="panel-heading">
						<div class="panel-title">Sign Up</div>
						<div
							style="float: right; font-size: 85%; position: relative; top: -10px">
						</div>
					</div>
					<div class="panel-body">
						<form id="signupform" class="form-horizontal" role="form">
							<div id="signupalert" style="display: none"
								class="alert alert-danger">
								<p>Error:</p>
								<span></span>
							</div>
							<div class="form-group">
								<label for="email" class="col-md-3 control-label">Email</label>
								<div class="col-md-9">
									<input type="text" class="form-control" name="email"
										placeholder="Email Address">
								</div>
							</div>
							<div class="form-group">
								<label for="username" class="col-md-3 control-label">Username</label>
								<div class="col-md-9">
									<input type="text" class="form-control" id="inputUsername"
										name="username" placeholder="Username">
								</div>
							</div>
							<div class="form-group">
								<label for="password" class="col-md-3 control-label">Password</label>
								<div class="col-md-9">
									<input type="password" class="form-control" id="inputPassword"
										name="password" placeholder="Password">
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-offset-3 col-md-9">
									<button id="btn-signup" type="button"
										class="btn btn-info register">Sign Up</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="static/js/auth.js"></script>
</body>
</html>