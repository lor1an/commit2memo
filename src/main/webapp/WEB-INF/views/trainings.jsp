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
					</div>
					<div class="btn-group btn-group-justified" role="group">
						<div class="btn-group" role="group">
							<button id="again" type="button" class="training btn btn-danger">
								<span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
								Again
							</button>
						</div>
						<div class="btn-group" role="group">
							<button id="know" type="button" class="training btn btn-success">
								<span class="glyphicon glyphicon-repeat" aria-hidden="true"></span>
								Know
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
        var cards = [
                {
                    "cardId" : 1,
                    "searchWord" : "cat",
                    "wordId" : 4,
                    "sensesId" : [ 1 ],
                    "entry" : {
                        "id" : "cat[3]",
                        "entryWord" : "cat",
                        "sound" : null,
                        "pronunciation" : null,
                        "funcLabel" : "abbreviation",
                        "def" : {
                            "sndf" : [ {
                                "senseNumber" : "2",
                                "value" : "catalyst",
                                "synonymous" : null,
                                "usageNote" : null,
                                "verbalIllustration" : null
                            } ]
                        }
                    },
                    "wave" : "WAVE_0",
                    "repeatDate" : {
                        "year" : 2015,
                        "month" : "DECEMBER",
                        "dayOfMonth" : 12,
                        "dayOfWeek" : "SATURDAY",
                        "era" : "CE",
                        "dayOfYear" : 346,
                        "leapYear" : false,
                        "chronology" : {
                            "calendarType" : "iso8601",
                            "id" : "ISO"
                        },
                        "monthValue" : 12
                    },
                    "deck" : {
                        "deckId" : 1,
                        "name" : "cats"
                    }
                },
                {
                    "cardId" : 2,
                    "searchWord" : "cat",
                    "wordId" : 1,
                    "sensesId" : [ 0 ],
                    "entry" : {
                        "id" : "cat[2]",
                        "entryWord" : "cat",
                        "sound" : null,
                        "pronunciation" : null,
                        "funcLabel" : "verb",
                        "def" : {
                            "sndf" : [ {
                                "senseNumber" : "intransitive verb",
                                "value" : ":to search for a sexual mate ",
                                "synonymous" : null,
                                "usageNote" : "(often used with around)",
                                "verbalIllustration" : null
                            } ]
                        }
                    },
                    "wave" : "WAVE_0",
                    "repeatDate" : {
                        "year" : 2015,
                        "month" : "DECEMBER",
                        "dayOfMonth" : 12,
                        "dayOfWeek" : "SATURDAY",
                        "era" : "CE",
                        "dayOfYear" : 346,
                        "leapYear" : false,
                        "chronology" : {
                            "calendarType" : "iso8601",
                            "id" : "ISO"
                        },
                        "monthValue" : 12
                    },
                    "deck" : {
                        "deckId" : 1,
                        "name" : "cats"
                    }
                },
                {
                    "cardId" : 3,
                    "searchWord" : "cat",
                    "wordId" : 0,
                    "sensesId" : [ 1, 6 ],
                    "entry" : {
                        "id" : "cat[1]",
                        "entryWord" : "cat",
                        "sound" : {
                            "wav" : "http://media.merriam-webster.com/soundc11/c/cat00001.wav"
                        },
                        "pronunciation" : "ˈkat",
                        "funcLabel" : "noun",
                        "def" : {
                            "sndf" : [
                                    {
                                        "senseNumber" : "b",
                                        "value" : ":any of a family (Felidae) of carnivorous usually solitary and nocturnal mammals (as the domestic cat, lion, tiger, leopard, jaguar, cougar, wildcat, lynx, and cheetah)",
                                        "synonymous" : null,
                                        "usageNote" : null,
                                        "verbalIllustration" : null
                                    }, {
                                        "senseNumber" : "5",
                                        "value" : ":",
                                        "synonymous" : "syn. to:cat-o'-nine-tails",
                                        "usageNote" : null,
                                        "verbalIllustration" : null
                                    } ]
                        }
                    },
                    "wave" : "WAVE_0",
                    "repeatDate" : {
                        "year" : 2015,
                        "month" : "DECEMBER",
                        "dayOfMonth" : 12,
                        "dayOfWeek" : "SATURDAY",
                        "era" : "CE",
                        "dayOfYear" : 346,
                        "leapYear" : false,
                        "chronology" : {
                            "calendarType" : "iso8601",
                            "id" : "ISO"
                        },
                        "monthValue" : 12
                    },
                    "deck" : {
                        "deckId" : 1,
                        "name" : "cats"
                    }
                },
                {
                    "cardId" : 4,
                    "searchWord" : "cat",
                    "wordId" : 0,
                    "sensesId" : [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ],
                    "entry" : {
                        "id" : "cat[1]",
                        "entryWord" : "cat",
                        "sound" : {
                            "wav" : "http://media.merriam-webster.com/soundc11/c/cat00001.wav"
                        },
                        "pronunciation" : "ˈkat",
                        "funcLabel" : "noun",
                        "def" : {
                            "sndf" : [
                                    {
                                        "senseNumber" : "1 a",
                                        "value" : ":a carnivorous mammal (Felis catus) long domesticated as a pet and for catching rats and mice",
                                        "synonymous" : null,
                                        "usageNote" : null,
                                        "verbalIllustration" : null
                                    },
                                    {
                                        "senseNumber" : "b",
                                        "value" : ":any of a family (Felidae) of carnivorous usually solitary and nocturnal mammals (as the domestic cat, lion, tiger, leopard, jaguar, cougar, wildcat, lynx, and cheetah)",
                                        "synonymous" : null,
                                        "usageNote" : null,
                                        "verbalIllustration" : null
                                    },
                                    {
                                        "senseNumber" : "2",
                                        "value" : ":a malicious woman",
                                        "synonymous" : null,
                                        "usageNote" : null,
                                        "verbalIllustration" : null
                                    },
                                    {
                                        "senseNumber" : "3",
                                        "value" : ":a strong tackle used to hoist an anchor to the cathead of a ship",
                                        "synonymous" : null,
                                        "usageNote" : null,
                                        "verbalIllustration" : null
                                    }, {
                                        "senseNumber" : "4 a",
                                        "value" : ":",
                                        "synonymous" : "syn. to:catboat",
                                        "usageNote" : null,
                                        "verbalIllustration" : null
                                    }, {
                                        "senseNumber" : "b",
                                        "value" : ":",
                                        "synonymous" : "syn. to:catamaran",
                                        "usageNote" : null,
                                        "verbalIllustration" : null
                                    }, {
                                        "senseNumber" : "5",
                                        "value" : ":",
                                        "synonymous" : "syn. to:cat-o'-nine-tails",
                                        "usageNote" : null,
                                        "verbalIllustration" : null
                                    }, {
                                        "senseNumber" : "6",
                                        "value" : ":",
                                        "synonymous" : "syn. to:catfish",
                                        "usageNote" : null,
                                        "verbalIllustration" : null
                                    }, {
                                        "senseNumber" : "7 a",
                                        "value" : ":a player or devotee of jazz",
                                        "synonymous" : null,
                                        "usageNote" : null,
                                        "verbalIllustration" : null
                                    }, {
                                        "senseNumber" : "b",
                                        "value" : ":",
                                        "synonymous" : "syn. to:guy",
                                        "usageNote" : null,
                                        "verbalIllustration" : null
                                    } ]
                        }
                    },
                    "wave" : "WAVE_0",
                    "repeatDate" : {
                        "year" : 2015,
                        "month" : "DECEMBER",
                        "dayOfMonth" : 12,
                        "dayOfWeek" : "SATURDAY",
                        "era" : "CE",
                        "dayOfYear" : 346,
                        "leapYear" : false,
                        "chronology" : {
                            "calendarType" : "iso8601",
                            "id" : "ISO"
                        },
                        "monthValue" : 12
                    },
                    "deck" : {
                        "deckId" : 1,
                        "name" : "cats"
                    }
                } ];
        var transform = {
            "tag" : "div",
            "id" : "cardWord",
            "class" : "cardWord",
            "children" : [ {
                "tag" : "div",
                "class" : "pronunc",
                "html" : "\${pronunciation}"
            }, {
                "tag" : "div",
                "style" : "text-align: center",
                "html" : "<audio controls src='\${sound.wav}' type='audio/mpeg'></audio>"
            }, {
                "tag" : "div",
                "id" : "def",
                "class" : "def",
                "html" : "<div style='font-weight: bold; text-align: center' >	\${funcLabel}</div>"
            } ]
        };

        var transform2 = {
            "tag" : "div",
            "id" : "",
            "class" : "sndf",
            "children" : [ {
                "tag" : "div",
                "style" : "display: inherit;",
                "class" : "cardSenseNumber input-group",
                "html" : "<span style='font-weight: bold;' >(\${senseNumber})</span> \${value} \${synonymous} \${verbalIllustration} \${usageNote}"
            } ]
        };

        var decksUrl = "http://localhost:10080/commit2memo/decks";
        var curIndex = 0;
        
        $(document).on("click", ".flip", function(e) {
            $(this).find('.card').toggleClass('flipped');
        });

        $(document).ready(function() {
            addDecks();
            $.get('static/pages/flip.html', function(data) {
                $(".flip").append(data);
            }).done(function() {
                nextCard(curIndex);
            });
            for (var i = 0; i < cards.length; i++) {
                cards[i].know = 1;
            }
        });

        function nextCard(index) {
            $('#front').empty();
            $('#front').text(cards[index].entry.entryWord);
            $('#back').empty();
            $('#back').json2html(cards[index].entry, transform);
            $('#def').empty();
            for (var i = 0; i < cards[index].entry.def.sndf.length; i++) {
                $('#def').json2html(cards[index].entry.def.sndf[i], transform2);
            }
        }
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

        $(document).on("click", ".training", function(e) {
            var shift = 1;
            var card = cards[curIndex];
            if (removeCard(card.know)) {
                shift = 0;
            } else {
                if ($(this).attr("id") == "know") {
                    card.know = card.know - 1;
                    console.log(card.know);
                } else {
                    card.know = card.know + 1;
                    console.log(card.know);
                }
            }
            if (cards.length > 0) {
                curIndex = (curIndex + shift) % (cards.length);
                nextCard(curIndex);
                $('.flip').find('.card').removeClass('flipped');
            } else {
                $('.flip').html(" <span>Congradulations! You have finished your training :)</span>");
                $('.flip').addClass("congrats");
            }
        });

        function removeCard(know) {
            if (know === 0 || know === 3) {
                cards.splice(curIndex, 1);
                return true;
            }
            return false;
        }
    </script>
</body>
</html>