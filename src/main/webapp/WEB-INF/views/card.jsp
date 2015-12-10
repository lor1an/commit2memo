
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>commit2memo</title>
<link rel="icon" type="image/x-icon" href="static/img/favicon.ico" />
<link rel="shortcut icon" type="image/x-icon"
	href="static/img/favicon.ico" />
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="static/css/styles.css">
</head>
<body>
	<div class="modal bs-example-modal-sm" id="addDeckModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<div class="panel panel-info modal-content">
				<div class="panel-heading modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<div class="modal-title" id="myModalLabel">Add deck:</div>
				</div>
				<div class="modal-body">
					<div>
						<label for="name" class="col-md-3 control-label">Name</label>
						<div class="col-md-9">
							<input type="text" class="form-control" id="name" name="name">
						</div>
					</div>
				</div>
				<div class="deck-modal col-md-offset-4">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class='glyphicon glyphicon-arrow-left' aria-hidden='true'></span>
						Back
					</button>
					<button id="add" type="button" class="btn btn-primary add-deck"
						data-toggle="modal">
						<span class='glyphicon glyphicon-plus' aria-hidden='true'></span>
						Add
					</button>
				</div>
			</div>
		</div>
	</div>
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
						<li><a href class="logout">Logout</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div id="leftCol" class="col-md-3 sidebar">
				<ul class="nav nav-pills nav-stacked">
					<li role="presentation"><a href="trainings">Trainings</a></li>
					<li role="presentation"><a href="decksPage">Decks</a></li>
					<li role="presentation" class="active"><a href="">Add card</a></li>
					<li role="presentation"><a href="cardsPage">All cards</a></li>
				</ul>
			</div>
			<div class="col-sm-6 worker">
				<div class="thumbnail">

					<div>
						<div class="input-group" style="postion: absolute">
							<input type="text" id="search_field" class="form-control"
								placeholder="Search for..." /> <span class="input-group-btn">
								<button class="btn btn-primary search" type="button"
									style="width: 100px;">
									<span class='glyphicon glyphicon-search' aria-hidden='true'></span>
									Search
								</button>
							</span>
						</div>
						<div class="input-group"
							style="postion: absolute; padding-top: 5px; padding-bottom: 5px;">
							<p
								style="display: table-header-group; font-size: 13px; font-weight: 500;">Add
								card to selected deck:</p>
							<select id="selectDeck" class="form-control">
							</select> <span class="input-group-btn">
								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#addDeckModal"
									style="width: 100px;">
									<span class='glyphicon glyphicon-plus' aria-hidden='true'></span>
									Add Deck
								</button>
							</span>
						</div>
					</div>
					<div id="list" class='list'></div>
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

	<script>
		var decksUrl = "http://localhost:10080/commit2memo/decks";
		$('.search')
				.click(
						function() {
							var checkbox = "<span class='input-group-addon'><input type='checkbox' aria-label='...'></span>";
							var i = 0;
							function incr() {
								i += 1;
								return i;
							}
							var inc = incr();
							var transform = {
								"tag" : "div",
								"id" : "\${id}",
								"class" : "word",
								"children" : [
										{
											"tag" : "div",
											"class" : "entryWord",
											"html" : "<span style='font-weight: bold;' >\${entryWord}</span><span>  /\${pronunciation}/ </span>"
										},
										{
											"tag" : "div",
											"html" : "<audio controls src='\${sound.wav}' type='audio/mpeg'></audio>"
										},
										{
											"tag" : "div",
											"class" : "def",
											"id" : "def" + inc,
											"html" : "<span style='font-style: italic;' >	\${funcLabel}</span>"
										} ]
							};

							var transform2 = {
								"tag" : "div",
								"class" : "sndf",
								"id" : "sndf" + inc,
								"children" : [
										{
											"tag" : "div",
											"class" : "senseNumber input-group",
											"html" : "<span style='font-weight: bold;' >(\${senseNumber})</span> \${value} \${synonymous} \${verbalIllustration}"
										}, {
											"tag" : "div",
											"class" : "usageNote",
											"html" : "\${usageNote}"
										} ]
							};

							var word = $('#search_field').val();
							var url = "http://localhost:10080/commit2memo/entryList/";
							$
									.get(
											url + word,
											function(data) {
												var json = data.entryList;

												if (!$('#list').is(':empty')) {
													$('#list').empty();
												}

												for (var j = 0; j < json.length; j++) {
													$('#list').json2html(
															json[j], transform);
													var inc = incr();
													transform.children[2].id = "def"
															+ inc;
												}
												i = 0;
												for (var j = 0; j < json.length; j++) {
													var inc = incr();
													var k_inc = 0;
													for (var k = 0; k < json[j].def.sndf.length; k++) {
														transform2.id = "sndf"
																+ inc
																		.toString()
																+ k_inc;
														$('#def' + inc)
																.json2html(
																		json[j].def.sndf[k],
																		transform2);
														k_inc++;
													}
												}
												$("span:contains('//')").css(
														"display", "none");
												$("span:contains('()')").css(
														"display", "none");
												$
														.get(
																'static/pages/buttons.html',
																function(data) {
																	$(data)
																			.find(
																					".brut, .btn-group-justified")
																			.appendTo(
																					".word");
																});
												$('.senseNumber').append(
														checkbox);

											}).fail(function() {
										console.log("error");
									});

						});
		function getButtons() {
			return $.ajax({
				url : "http://localhost:10080/commit2memo/buttons",
				type : 'GET',
				async : false,
				error : function(data) {
					console.log(data);
				}
			}).responseText;
		};
		$(document).on("click", ".btn-group-justified", function() {
			console.log("i am here");
			var id = $("#selectDeck").children(":selected").attr("id");
			console.log(id);
		});

		$(document).ready(function() {
			addDecks();
		});

		function addDecks() {
			var url = decksUrl;
			$.get(url, function(data) {
				var transform = {
					"tag" : "option",
					"id" : "\${deckId}",
					"html" : "\${name}"
				};

				$('#selectDeck').empty();
				$('#selectDeck').json2html(data, transform);

			}).fail(function() {
				console.log("error");
			});
		};

		$('#add').click(function(e) {
			e.preventDefault();
			$.ajax({
				url : decksUrl,
				type : 'POST',
				contentType : "application/json",
				data : JSON.stringify({
					"name" : $('#name').val(),
				}),
				success : function(data) {
					$('#addDeckModal').modal('hide');
					addDecks();
				},
				error : function(data) {
					console.log(data);
				}
			});
		});
	</script>
</body>
</html>