
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Commit 2 memo</title>
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

.flip {
	-webkit-perspective: 800;
	width: 400px;
	height: 200px;
	position: relative;
	margin: 50px auto;
}

.flip .card.flipped {
	-webkit-transform: rotatex(-180deg);
}

.flip .card {
	width: 100%;
	height: 100%;
	-webkit-transform-style: preserve-3d;
	-webkit-transition: 0.5s;
}

.flip .card .face {
	width: 100%;
	height: 100%;
	position: absolute;
	-webkit-backface-visibility: hidden;
	z-index: 2;
	font-family: Georgia;
	text-align: left;
}

.flip .card .front {
	position: absolute;
	z-index: 1;
	background: white;
	color: black;
	cursor: pointer;
	border: solid;
	font-size: 3em;
	text-align: center;
	line-height: 200px;
}

.flip .card .back {
	-webkit-transform: rotatex(-180deg);
	background: white;
	color: black;
	cursor: pointer;
	border: solid;
}
</style>
</head>

<body ng-app="myApp" class="ng-cloak">

	<nav class="navbar navbar-default navbar-fixed-top" role="banner">
		<div class="container">
			<div class="navbar-header">
				<a href="/" class="navbar-brand">C2memo</a>
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
						<div class="flip">
							<div id="a" class="card">
								<div class="face front">food</div>
								<div class="face back">
									<div>
										<span> /food/ </span>
									</div>
									<audio controls=""
										src="http://media.merriam-webster.com/soundc11/f/food0001.wav"
										type="audio/mpeg"></audio>
									<div>
										<span style="font-style: italic;">noun</span>
									</div>
									<div class="senseNumber">
										<span style="font-weight: bold;">(1 a)</span> :material
										consisting essentially of protein, carbohydrate, and fat used
										in the body of an organism to sustain growth, repair, and
										vital processes and to furnish energy
									</div>
								</div>
							</div>
						</div>
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
	<script src="static/js/angular-bootstrap.js" type="text/javascript"></script>
	<script src="static/js/hello.js"></script>
	<script src="static/js/app.js"></script>
	<script src="static/js/user_service.js"></script>
	<script src="static/js/user_controller.js"></script>

	<script type="text/javascript">
        $('.flip').click(function() {
            $(this).find('.card').toggleClass('flipped');
            return false;
        });
    </script>



</body>
</html>