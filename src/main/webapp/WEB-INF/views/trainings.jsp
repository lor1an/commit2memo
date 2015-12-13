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
</head>
<body>
	<div class="navbar-wrapper">
		<div class="container"></div>
		<div class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button class="navbar-toggle" data-toggle="collapse" type="button"
						data-target=".navbar-collapse">
						<span class='glyphicon glyphicon-menu-hamburger'
							aria-hidden='true'></span> <span class="sr-only">Toggle
							navigation</span>
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
					<li role="presentation" class="active"><a href="trainings">Trainings
							<span class="badge">42</span>
					</a></li>
					<li role="presentation"><a href="decksPage">Decks</a></li>
					<li role="presentation"><a href="cardPage">Add card</a></li>
					<li role="presentation"><a href="cardsPage">All cards</a></li>
				</ul>
			</div>

			<div class="col-sm-6 worker">
				<div class="thumbnail">
					<ul class="nav nav-tabs">
						<li id="repeat" role="presentation" class="trtab active"><a>Repeat
								<span class="badge">42</span>
						</a></li>
						<li id="neww" role="presentation" class="trtab"><a>New
								words</a></li>
					</ul>

					<div class="" style="display: flex; padding-top: 5px;">
						<div>
							<p
								style="font-weight: 700; font-size: 17px; padding-top: 7px; padding-right: 4px;">Current
								deck</p>
						</div>
						<div style="width: 80%;">
							<select id="selectDeck" class="form-control">
							</select>
						</div>
					</div>
					<div id="memo_stat"></div>
					<div class="flip"></div>
					<div id="again_know"></div>
				</div>
			</div>
		</div>
	</div>
	<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script src="static/js/jquery.json2html.js"></script>
	<script src="static/js/json2html.js"></script>
	<script src="static/js/auth.js"></script>
	<script src="static/js/trainings.js"></script>
</body>
</html>