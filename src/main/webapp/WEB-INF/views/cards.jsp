
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
					<li role="presentation"><a href="decks">Decks</a></li>
					<li role="presentation"><a href="card">Add card</a></li>
					<li role="presentation" class="active"><a href="cards">All
							cards</a></li>
				</ul>
			</div>
			<div class="col-sm-6 worker">
				<div class="thumbnail">
					<table class="table ">
						<thead>
							<tr>
								<th>Front</th>
								<th>
									<div class="dropdown">
										<button class="btn btn-default dropdown-toggle" type="button"
											id="dropdownMenu1" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="true">
											Dropdown <span class="caret"></span>
										</button>
										<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
											<li><a href="#">Action</a></li>
											<li><a href="#">Another action</a></li>
											<li><a href="#">Something else here</a></li>
											<li role="separator" class="divider"></li>
											<li><a href="#">Separated link</a></li>
										</ul>
									</div>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Front1</td>
								<td>Back1</td>
							</tr>
							<tr>
								<td>Front2</td>
								<td>Back2</td>
							</tr>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>

	<div class="dropdown">
		<button class="btn btn-default dropdown-toggle" type="button"
			id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="true">
			Dropdown <span class="caret"></span>
		</button>
		<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
			<li><a href="#">Action</a></li>
			<li><a href="#">Another action</a></li>
			<li><a href="#">Something else here</a></li>
			<li role="separator" class="divider"></li>
			<li><a href="#">Separated link</a></li>
		</ul>
	</div>
	<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="static/js/jquery.json2html.js"></script>
	<script src="static/js/json2html.js"></script>
	<script src="static/js/auth.js"></script>
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