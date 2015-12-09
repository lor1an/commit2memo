
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
					<button id="add" type="button" class="btn btn-success add-deck"
						data-toggle="modal">
						<span class='glyphicon glyphicon-plus' aria-hidden='true'></span>
						Add
					</button>
				</div>
			</div>
		</div>
	</div>
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
					<li role="presentation"><a href="decksPage">Decks</a></li>
					<li role="presentation" class="active"><a href="card">Add
							card</a></li>
					<li role="presentation"><a href="cardsPage">All cards</a></li>
				</ul>
			</div>
			<div class="col-sm-6 worker">
				<div class="thumbnail">
					<div class="input-group">
						<input type="text" id="search_field" class="form-control"
							placeholder="Search for..." /> <span class="input-group-btn">
							<button class="btn btn-primary search" type="button">Search</button>
						</span>
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
        $('.search').click(function() {
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
                "children" : [ {
                    "tag" : "div",
                    "class" : "entryWord",
                    "html" : "<span style='font-weight: bold;' >\${entryWord}</span><span>  /\${pronunciation}/ </span>"
                }, {
                    "tag" : "div",
                    "html" : "<audio controls src='\${sound.wav}' type='audio/mpeg'></audio>"
                }, {
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
                "children" : [ {
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
            $.get(url + word, function(data) {
                var json = data.entryList;

                if (!$('#list').is(':empty')) {
                    $('#list').empty();
                }

                for (var j = 0; j < json.length; j++) {
                    $('#list').json2html(json[j], transform);
                    var inc = incr();
                    transform.children[2].id = "def" + inc;
                }
                i = 0;
                for (var j = 0; j < json.length; j++) {
                    var inc = incr();
                    var k_inc = 0;
                    for (var k = 0; k < json[j].def.sndf.length; k++) {
                        transform2.id = "sndf" + inc.toString() + k_inc;
                        $('#def' + inc).json2html(json[j].def.sndf[k], transform2);
                        k_inc++;
                    }
                }
                $("span:contains('//')").css("display", "none");
                $("span:contains('()')").css("display", "none");
                $.get('static/pages/buttons.html', function(data) {
                    $(data).find(".brut, .addCrd").appendTo(".word");
                });
                $('.senseNumber').append(checkbox);

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
        $(document).on("click", ".addCard", function() {
            //$('#addDeckModal').modal('show');
        });
        $(document).on("click", ".dropdown-menu li a",function(){
            var selText = $(this).text();
            $(this).parents('.btn-group').find('.dropdown-toggle').html(selText+' <span class="caret"></span>');
          });
    </script>
</body>
</html>