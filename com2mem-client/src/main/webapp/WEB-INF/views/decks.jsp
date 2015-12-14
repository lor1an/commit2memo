
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>commit2memo</title>
<link rel="icon" type="image/x-icon" href="static/img/favicon.ico" />
<link rel="shortcut icon" type="image/x-icon"
	href="static/img/favicon.ico" />
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
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
						<li class="activeTab"><a href="">Memorizing</a></li>
						<li><a href="profile">My profile</a> <span
							class="icon-envelope"></span></li>
						<li><a href="about">About</a></li>
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
					<li role="presentation"><a href="trainings">Trainings<span class="badge repeatCount">0</span></a></li>
					<li role="presentation" class="active"><a href="decks">Decks</a></li>
					<li role="presentation"><a href="cardPage">Add card</a></li>
					<li role="presentation"><a href="cardsPage">All cards</a></li>
				</ul>
			</div>
			<div class="col-sm-6 worker">
				<div class="btn-group btn-group-justified" role="group">
					<div class="btn-group" role="group">
						<button id="deleteButton" type="button"
							class="btn btn-danger disabled switch">
							<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
							Delete Deck
						</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#addDeckModal">
							<span class='glyphicon glyphicon-plus' aria-hidden='true'></span>
							Add Deck
						</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-success disabled switch">
							<span class='glyphicon glyphicon-play' aria-hidden='true'></span>
							Start traning
						</button>
					</div>
				</div>
				<div class="thumbnail">
					<div class="list">
						<table class="table ">
							<tbody id="decksList">
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="static/js/auth.js"></script>
	<script src="static/js/jquery.json2html.js"></script>
	<script src="static/js/json2html.js"></script>
	<script src="static/js/scripts.js"></script>
	<script>
        var decksUrl = "http://localhost:10080/commit2memo/decks";
        $('tbody').on("click", "tr.t", function() {
            if (!$(this).hasClass('picked')) {
                $(".picked").removeClass('picked');
            }
            $(this).toggleClass('picked');
            if ($(".picked")[0]) {
                var arr = $(".picked");
                $(".switch").removeClass('disabled');
            } else {
                $(".switch").addClass('disabled');
            }

        });
        $(document).ready(function() {
            addDecks();
        });

        function addDecks() {
            var test = "<td class='numb'><span class='fstN'>5 </span><span class='secN'>10 </span><span class='thrN'>15</span></td>";
            var url = decksUrl;
            $.get(url, function(data) {
                var transform = {
                    "tag" : "tr",
                    "id" : "deck\${deckId}",
                    "class" : "t",
                    "html" : "<td>\${name}</td>" + test
                };

                $('#decksList').empty();
                $('#decksList').json2html(data, transform);

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

        $('#deleteButton').click(function(e) {
            var id = $(".picked").attr("id");
            console.log(id);
            $.ajax({
                url : decksUrl + "/" + id.substring(4),
                type : 'DELETE',
                success : function(data) {
                    addDecks();
                    $(".switch").addClass('disabled');
                },
                error : function(data) {
                    console.log(data);
                }
            });
        });
    </script>
</body>
</html>