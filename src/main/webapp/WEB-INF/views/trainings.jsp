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
					<li role="presentation" class="active"><a href="trainings">Trainings</a></li>
					<li role="presentation"><a href="decksPage">Decks</a></li>
					<li role="presentation"><a href="cardPage">Add card</a></li>
					<li role="presentation"><a href="cardsPage">All cards</a></li>
				</ul>
			</div>
			<div class="col-sm-6 worker">
				<div class="thumbnail">
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
					<div class="flip">
						<div id="a" class="card">
							<div class="face front">food</div>
							<div id="flash" class="face back"></div>
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
	<script src="static/js/auth.js"></script>
	<script src="static/js/jquery.json2html.js"></script>
	<script src="static/js/json2html.js"></script>
	<script type="text/javascript">
        var test = {
            "entryList" : [
                    {
                        "id" : "food",
                        "entryWord" : "food",
                        "sound" : {
                            "wav" : "http://media.merriam-webster.com/soundc11/f/food0001.wav"
                        },
                        "pronunciation" : "ˈfüd",
                        "funcLabel" : "noun",
                        "def" : {
                            "sndf" : [
                                    {
                                        "senseNumber" : "1 a",
                                        "value" : ":material consisting essentially of protein, carbohydrate, and fat used in the body of an organism to sustain growth, repair, and vital processes and to furnish energy",
                                        "synonymous" : null,
                                        "usageNote" : null,
                                        "verbalIllustration" : null
                                    },
                                    {
                                        "senseNumber" : "1 a",
                                        "value" : ":such food together with supplementary substances (as minerals, vitamins, and condiments)",
                                        "synonymous" : null,
                                        "usageNote" : null,
                                        "verbalIllustration" : null
                                    },
                                    {
                                        "senseNumber" : "b",
                                        "value" : ":inorganic substances absorbed by plants in gaseous form or in water solution",
                                        "synonymous" : null,
                                        "usageNote" : null,
                                        "verbalIllustration" : null
                                    },
                                    {
                                        "senseNumber" : "2",
                                        "value" : ":nutriment in solid form",
                                        "synonymous" : null,
                                        "usageNote" : null,
                                        "verbalIllustration" : null
                                    },
                                    {
                                        "senseNumber" : "3",
                                        "value" : ":something that nourishes, sustains, or supplies ",
                                        "synonymous" : null,
                                        "usageNote" : null,
                                        "verbalIllustration" : "(f. e.:food for thought)"
                                    } ]
                        }
                    },
                    {
                        "id" : "cat[1]",
                        "entryWord" : "cat",
                        "sound" : {
                            "wav" : "http://media.merriam-webster.com/soundc11/c/cat00001.wav"
                        },
                        "pronunciation" : "ˈkat",
                        "funcLabel" : "noun",
                        "def" : {
                            "sndf" : [ {
                                "senseNumber" : "4 a",
                                "value" : ":",
                                "synonymous" : "syn. to:catboat",
                                "usageNote" : null,
                                "verbalIllustration" : null
                            } ]
                        }
                    },
                    {
                        "id" : "wood[2]",
                        "entryWord" : "wood",
                        "sound" : {
                            "wav" : "http://media.merriam-webster.com/soundc11/w/wood0001.wav"
                        },
                        "pronunciation" : "ˈwu̇d",
                        "funcLabel" : "noun",
                        "def" : {
                            "sndf" : [
                                    {
                                        "senseNumber" : "1 a",
                                        "value" : ":a dense growth of trees usually greater in extent than a grove and smaller than a forest ",
                                        "synonymous" : null,
                                        "usageNote" : "(often used in plural but singular or plural in construction)",
                                        "verbalIllustration" : null
                                    },
                                    {
                                        "senseNumber" : "2 a",
                                        "value" : ":the hard fibrous substance consisting basically of xylem that makes up the greater part of the stems, branches, and roots of trees or shrubs beneath the bark and is found to a limited extent in herbaceous plants",
                                        "synonymous" : null,
                                        "usageNote" : null,
                                        "verbalIllustration" : null
                                    },
                                    {
                                        "senseNumber" : "3 a",
                                        "value" : ":something made of wood",
                                        "synonymous" : null,
                                        "usageNote" : null,
                                        "verbalIllustration" : null
                                    },
                                    {
                                        "senseNumber" : "b",
                                        "value" : ":a golf club having a similar head made of metal",
                                        "synonymous" : null,
                                        "usageNote" : null,
                                        "verbalIllustration" : null
                                    } ]
                        }
                    } ]
        };
        var decksUrl = "http://localhost:10080/commit2memo/decks";
        $('.flip').click(function() {
            $(this).find('.card').toggleClass('flipped');
            return false;
        });
        var transform = {
            "tag" : "div",
            "id" : "word",
            "class" : "word",
            "children" : [ {
                "tag" : "div",
                "html" : "\${pronunciation}"
            }, {
                "tag" : "div",
                "html" : "<audio controls src='\${sound.wav}' type='audio/mpeg'></audio>"
            }, {
                "tag" : "div",
                "id" : "def",
                "class" : "def",
                "html" : "<span style='font-style: italic;' >	\${funcLabel}</span>"
            } ]
        };

        var transform2 = {
            "tag" : "div",
            "id" : "",
            "class" : "sndf",
            "children" : [ {
                "tag" : "div",
                "style" : "style='display: block;'",
                "class" : "senseNumber input-group",
                "html" : "<div class='senseValue'><span style='font-weight: bold;' >(\${senseNumber})</span> \${value} \${synonymous} \${verbalIllustration} \${usageNote}</div>"
            } ]
        };

        $(document).ready(function() {
            addDecks();
            $('#flash').json2html(test.entryList[0], transform);
            for (var i = 0; i < test.entryList[0].def.sndf.length; i++) {
                $('#def').json2html(test.entryList[0].def.sndf[i], transform2);
            }
        });

        function addDecks() {
            var url = decksUrl;
            $.get(url, function(data) {
                var transform = {
                    "tag" : "option",
                    "id" : "deck\${deckId}",
                    "html" : "\${name}"
                };

                $('#selectDeck').empty();
                $('#selectDeck').json2html(data, transform);

            }).fail(function() {
                console.log("error");
            });
        };
    </script>
</body>
</html>