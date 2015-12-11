<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>commit2memo</title>
<link rel="icon" type="image/x-icon" href="static/img/favicon.ico" />
<link rel="shortcut icon" type="image/x-icon"
	href="static/img/favicon.ico" />
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
<link rel="stylesheet" href="static/css/styles.css">

<style type="text/css">
</style>
</head>
<body>
	<div class="navbar-wrapper">
		<div class="container"></div>
		<div class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button class="navbar-toggle" data-toggle="collapse" type="button" data-target=".navbar-collapse">
									<span class='glyphicon glyphicon-menu-hamburger' aria-hidden='true'></span>
									<span class="sr-only">Toggle navigation</span> 
								</button>
					<a href="/" class="navbar-brand">commit2memo</a>
				</div>
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li><a href="profile">My profile</a> <span
							class="icon-envelope"></span></li>
						<li><a href="">About</a></li>
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
					<li role="presentation" class="active"><a href="trainings">Trainings</a></li>
					<li role="presentation"><a href="decksPage">Decks</a></li>
					<li role="presentation"><a href="cardPage">Add card</a></li>
					<li role="presentation"><a href="cardsPage">All cards</a></li>
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
							<!-- 	<audio controls=""
									src="http://media.merriam-webster.com/soundc11/f/food0001.wav"
									type="audio/mpeg"></audio> -->
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
	<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
		$('.flip').click(function() {
			$(this).find('.card').toggleClass('flipped');
			return false;
		});
	</script>
</body>
</html>