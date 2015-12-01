
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Bootply snippet - Bootstrap Bootstrap 3 Affix Sidebar</title>
<meta name="generator" content="Bootply" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description"
	content="Uses a fixed left sidebar, that attaches after scrolling past a large top header. Scrollspy menu." />
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
<link href="css/styles.css" rel="stylesheet">


<style type="text/css">
/*
A Bootstrap 3.1 affix sidebar template
from http://bootply.com

This CSS code should follow the 'bootstrap.css'
in your HTML file.

license: MIT
author: bootply.com
*/
body {
	padding-top: 50px;
}

#masthead {
	min-height: 250px;
}

#masthead h1 {
	font-size: 30px;
	line-height: 1;
	padding-top: 20px;
}

#masthead .well {
	margin-top: 8%;
}

@media screen and (min-width: 768px) {
	#masthead h1 {
		font-size: 50px;
	}
}

.navbar-bright {
	background-color: #111155;
	color: #fff;
}

.affix-top, .affix {
	position: static;
}

@media ( min-width : 979px) {
	#sidebar.affix-top {
		position: static;
		margin-top: 30px;
		width: 228px;
	}
	#sidebar.affix {
		position: fixed;
		top: 70px;
		width: 228px;
	}
}

#sidebar li.active {
	border: 0 #eee solid;
	border-right-width: 5px;
}
</style>
</head>

<body ng-app="myApp" class="ng-cloak">

	<nav class="navbar navbar-default navbar-fixed-top" role="banner">
		<div class="container">
			<div class="navbar-header">
				<a href="/" class="navbar-brand">2memo</a>
			</div>
			<nav class="collapse navbar-collapse" role="navigation">
				<ul class="nav navbar-nav">
					<li><a href="profile">My profile</a></li>
					<li><a href="about">About</a></li>
					<li><a href="logout">Logout</a></li>
				</ul>
			</nav>
		</div>
	</nav>

	<div class="container">
		<div class="row">
			<div class="col-md-3" id="leftCol">
				<ul class="nav nav-stacked" style="position: fixed; top: 80px;"
					id="sidebar">
					<li><a href="trainings">Trainings</a></li>
					<li><a href="decks">Decks</a></li>
					<li><a href="card">Add card</a></li>
					<li><a href="cards">All cards</a></li>
				</ul>
			</div>
			<div class="row">
				<div class="col-sm-6 ">
					<div class="thumbnail">
						<div class="caption">
							<h3>Card:</h3>
							<div class="btn-group btn-group-justified" role="group">
								<!-- <a href="#" class="btn btn-primary" role="button">Button</a> <a
									href="#" class="btn btn-default" role="button">Button</a> -->
								<div class="btn-group" role="group">
									<button type="button" class="btn btn-default">
										<span class="glyphicon glyphicon-chevron-left"
											aria-hidden="true"></span> Prev card
									</button>
								</div>
								<div class="btn-group" role="group">
									<button type="button" class="btn btn-success">
										<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
										Remember
									</button>
								</div>
								<div class="btn-group" role="group">
									<button type="button" class="btn btn-danger">
										<span class="glyphicon glyphicon-repeat" aria-hidden="true"></span>
										Repeat Later
									</button>
								</div>
								<div class="btn-group" role="group">
									<button type="button" class="btn btn-default">
										<span class="glyphicon glyphicon-chevron-right"
											aria-hidden="true"></span> Next card
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>







		<!-- 
		<div class="col-md-9 col-md-offset-4"
			ng-controller="UserController as ctrl" style="box-shadow: 0 0;">
			<div class="panel panel-default">
				<div class="formcontainer">
					<form ng-submit="ctrl.submit()" name="myForm"
						class="form-horizontal">
						<input type="hidden" ng-model="ctrl.user.id" />
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="file">Name</label>
								<div class="col-md-7">
									<input type="text" ng-model="ctrl.user.username" name="uname"
										class="username form-control input-sm"
										placeholder="Enter your name" required ng-minlength="3" />
									<div class="has-error" ng-show="myForm.$dirty">
										<span ng-show="myForm.uname.$error.required">This is a
											required field</span> <span ng-show="myForm.uname.$error.minlength">Minimum
											length required is 3</span> <span ng-show="myForm.uname.$invalid">This
											field is invalid </span>
									</div>
								</div>
							</div>
						</div>


						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="file">Address</label>
								<div class="col-md-7">
									<input type="text" ng-model="ctrl.user.address"
										class="form-control input-sm"
										placeholder="Enter your Address. [This field is validation free]" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="file">Email</label>
								<div class="col-md-7">
									<input type="email" ng-model="ctrl.user.email" name="email"
										class="email form-control input-sm"
										placeholder="Enter your Email" required />
									<div class="has-error" ng-show="myForm.$dirty">
										<span ng-show="myForm.email.$error.required">This is a
											required field</span> <span ng-show="myForm.email.$invalid">This
											field is invalid </span>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="form-actions floatRight">
								<input type="submit"
									value="{{!ctrl.user.id ? 'Add' : 'Update'}}"
									class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
								<button type="button" ng-click="ctrl.reset()"
									class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset
									Form</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div> -->
	</div>
	<script src="static/js/angular-bootstrap.js" type="text/javascript"></script>
	<script src="static/js/hello.js"></script>
	<script src="static/js/app.js"></script>
	<script src="static/js/user_service.js"></script>
	<script src="static/js/user_controller.js"></script>




	<style>
.ad {
	position: absolute;
	bottom: 70px;
	right: 48px;
	z-index: 992;
	background-color: #f3f3f3;
	position: fixed;
	width: 155px;
	padding: 1px;
}

.ad-btn-hide {
	position: absolute;
	top: -10px;
	left: -12px;
	background: #fefefe;
	background: rgba(240, 240, 240, 0.9);
	border: 0;
	border-radius: 26px;
	cursor: pointer;
	padding: 2px;
	height: 25px;
	width: 25px;
	font-size: 14px;
	vertical-align: top;
	outline: 0;
}

.carbon-img {
	float: left;
	padding: 10px;
}

.carbon-text {
	color: #888;
	display: inline-block;
	font-family: Verdana;
	font-size: 11px;
	font-weight: 400;
	height: 60px;
	margin-left: 9px;
	width: 142px;
	padding-top: 10px;
}

.carbon-text:hover {
	color: #666;
}

.carbon-poweredby {
	color: #6A6A6A;
	float: left;
	font-family: Verdana;
	font-size: 11px;
	font-weight: 400;
	margin-left: 10px;
	margin-top: 13px;
	text-align: center;
}
</style>

</body>
</html>