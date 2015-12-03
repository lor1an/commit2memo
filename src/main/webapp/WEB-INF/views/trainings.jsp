
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>commit2memo</title>

<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
<link rel="stylesheet" href="static/css/styles.css">

<style type="text/css">
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
<body>
	<nav class="navbar navbar-default navbar-fixed-top" role="banner">
		<div class="container">
			<div class="navbar-header">
				<a href="/" class="navbar-brand">commit2memo</a>
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
			<div id="leftCol" class="col-md-3 sidebar">
				<ul class="nav nav-pills nav-stacked">
					<li role="presentation" class="active"><a href="trainings">Trainings</a></li>
					<li role="presentation"><a href="decks">Decks</a></li>
					<li role="presentation"><a href="card">Add card</a></li>
					<li role="presentation"><a href="cards">All cards</a></li>
				</ul>
			</div>
			<div class="col-sm-6 worker">
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
									in the body of an organism to sustain growth, repair, and vital
									processes and to furnish energy
								</div>
							</div>
						</div>
					</div>
					<div class="btn-group btn-group-justified" role="group">
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-danger">
								<span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
								Bad
							</button>
						</div>
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-success">
								<span class="glyphicon glyphicon-repeat" aria-hidden="true"></span>
								Good
							</button>
						</div>
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-primary">
								<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
								Easy
							</button>
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