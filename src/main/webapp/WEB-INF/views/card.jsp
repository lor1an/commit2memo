
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<title>commit2memo</title>
<link rel="icon" type="image/x-icon" href="static/img/favicon.ico" />
<link rel="shortcut icon" type="image/x-icon"
	href="static/img/favicon.ico" />
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
<link rel="stylesheet" href="static/css/styles.css">
<style type="text/css">
.word {
	border: solid;
}

.list {
	overflow-y: scroll;
	height: 550px;
}

.senseNumber {
	border: 1px solid #ccc;
}

.input-group-addon {
	border: none;
}

.senseNumber:hover {
	background: #DCDCDC;
}

div:empty {
	display: none;
}

audio[src=""] {
	display: none;
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
					<li class="logout"><a>Logout</a></li>
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
					<li role="presentation" class="active"><a href="card">Add
							card</a></li>
					<li role="presentation"><a href="cards">All cards</a></li>
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


	<script src="static/js/angular-bootstrap.js" type="text/javascript"></script>
	<script src="static/js/hello.js"></script>
	<script src="static/js/app.js"></script>
	<script src="static/js/user_service.js"></script>
	<script src="static/js/user_controller.js"></script>
	<script src="//underscorejs.org/underscore-min.js"></script>
	<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="static/js/jquery.json2html.js"></script>
	<script src="static/js/json2html.js"></script>

	<script>
        $('.search')
                .click(
                        function() {
                            var button = "<div><div class='btn-group btn-group-justified' role='group'><div class='btn-group' role='group'><button type='button' class='btn btn-success'><span class='glyphicon glyphicon-plus' aria-hidden='true'></span>Add card</button></div></div>	</div>";
                            var checkbox = "<span class='input-group-addon'><input type='checkbox' aria-label='...'></span>";
                            var i = 0;
                            function incr() {
                                i += 1;
                                return i;
                            }
                            var inc = incr();
                            var transform = {
                                "tag" : "div",
                                "id" : "word" + inc,
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
                                    "html" : "<span style='font-weight: bold;' >(\${senseNumber})</span> \${value} \${verbalIllustration}"
                                }, {
                                    "tag" : "div",
                                    "class" : "synonymous",
                                    "html" : "\${synonymous}"
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
                                    var cur_word_id = "word" + inc
                                    transform.id = cur_word_id;
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
                                $('.word').append(button);
                                $('.senseNumber').append(checkbox);

                            }).fail(function() {
                                console.log("error");
                            });

                        });

        $('.logout').click(function(e) {
            e.preventDefault();
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
           $.ajax({
               url : 'http://localhost:10080/commit2memo/j_spring_security_logout',
               type : 'POST',
               beforeSend:function(xhr){
                    //xhr.setRequestHeader(header, token);
               },
               success : function(data) { 
                   window.location ="http://localhost:10080/commit2memo/login";
               }, 
               error : function(data) {
                   console.log(data);
               }});
        });
    </script>
</body>
</html>