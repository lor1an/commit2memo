
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
	<nav class="navbar navbar-default navbar-fixed-top" role="banner">
		<div class="container">
			<div class="navbar-header">
				<a href="/" class="navbar-brand">commit2memo</a>
			</div>
			<nav class="collapse navbar-collapse" role="navigation">
				<ul class="nav navbar-nav">
					<li><a href="profile">My profile</a></li>
					<li><a href="about">About</a></li>
					<li><a href class="logout">Logout</a></li>
				</ul>
			</nav>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<div id="leftCol" class="col-md-3 sidebar">
				<ul class="nav nav-pills nav-stacked">
					<li role="presentation"><a href="trainings">Trainings</a></li>
					<li role="presentation" class="active"><a href="decks">Decks</a></li>
					<li role="presentation"><a href="card">Add card</a></li>
					<li role="presentation"><a href="cards">All cards</a></li>
				</ul>
			</div>
			<div class="col-sm-6 worker">
				<div class="thumbnail">
					<table class="table ">
						<tbody>
							<tr>
								<td>Deck1</td>
								<td class="numb"><span class="fstN">5 </span><span
									class="secN">10 </span><span class="thrN">15</span></td>
							</tr>
							<tr>
								<td>Deck2</td>
								<td class="numb"><span class="fstN">5 </span><span
									class="secN">10 </span><span class="thrN">15</span></td>
							</tr>
							<tr>
								<td>Deck3</td>
								<td class="numb"><span class="fstN">5 </span><span
									class="secN">10 </span><span class="thrN">15</span></td>
							</tr>
						</tbody>
					</table>
					<div class="btn-group btn-group-justified" role="group">
						<div class="btn-group" role="group">
							<button id="btn_s" type="button" class="btn btn-success disabled">
								<span class='glyphicon glyphicon-plus' aria-hidden='true'></span>
								Add Card
							</button>
						</div>
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-primary">
								<span class='glyphicon glyphicon-plus' aria-hidden='true'></span>
								Add Deck
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="static/js/auth.js"></script>
	<script src="static/js/jquery.json2html.js"></script>
	<script src="static/js/json2html.js"></script>
	<script>
		$('tr').click(function() {
			$(this).toggleClass('picked');
			if ($(".picked")[0]) {
				$("#btn_s").removeClass('disabled');
			} else {
				$("#btn_s").addClass('disabled');
			}

		});
	</script>
</body>
</html>