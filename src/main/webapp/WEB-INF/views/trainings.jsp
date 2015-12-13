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
	<script src="static/js/auth.js"></script>
	<script src="static/js/jquery.json2html.js"></script>
	<script src="static/js/json2html.js"></script>
	<script type="text/javascript">
        var cards;
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
        var percent;
        var initLength;
        var succbarW = 0;
        var failbarW = 0;
        $(document).on("click", ".flip", function(e) {
            $(this).find('.card').toggleClass('flipped');
        });

        $(document).ready(function() {
            initRepeatTab();
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

        $(document).on("click", ".mem_button", function(e) {
            var shift = 1;
            var card = cards[curIndex];
            if ($(this).attr("id") == "know") {
                card.know = card.know - 1;
            } else {
                card.know = card.know + 1;
            }
            if (removeCard(card.know)) {
                shift = 0;
            }
            if (cards.length > 0) {
                $('.flip').find('.card').removeClass('flipped');
                curIndex = (curIndex + shift) % (cards.length);
                setTimeout(function() {
                    nextCard(curIndex);
                    $('#counter').text(curIndex + 1 + " of " + cards.length);
                }, 100);
            } else {
                setTimeout(function() {
                    $('.flip').empty();
                    $('#counter').empty();
                    $("#again_know").empty();
                    $("#neww").removeClass("disabled");
                    $.get('static/pages/flip.html', function(data) {
                        $(data).find(".training, #fin_msg").appendTo(".flip");
                    })
                }, 500);
            }
        });

        function removeCard(know) {
            if (know <= 0) {
                cards.splice(curIndex, 1);
                succbarW += percent;
                $('#succbar').css('width', succbarW + '%').attr('aria-valuenow', succbarW);
                return true;
            } else if (know >= 4) {
                cards.splice(curIndex, 1);
                failbarW += percent;
                $('#failbar').css('width', failbarW + '%').attr('aria-valuenow', failbarW);
                return true;
            }
            return false;
        }

        $(document).on("click", ".trtab", function(e) {
            if (!$(this).hasClass("disabled")) {
                if ($(this).attr("id") === "repeat" && !$(this).hasClass("active")) {
                    $(".flip").empty();
                    $("#again_know").empty();
                    $('.trtab').toggleClass("active");
                    initRepeatTab();
                } else if ($(this).attr("id") === "neww" && !$(this).hasClass("active")) {
                    $(".flip").empty();
                    $("#again_know").empty();
                    $("#memo_stat").empty();
                    $('.trtab').toggleClass("active");
                    initNewWordTab();
                }
            }
        });

        function initRepeatTab() {
            addDecks();
            $.get('static/pages/flip.html', function(data) {
                $(data).find(".training, #startLes").appendTo(".flip");
            }).done(function() {
                //$("#wordCount").html(cards.length);
            });
        };

        $(document).on("click", "#startTraining", function(e) {
            $(".flip").empty();
            $.ajax({
                url : 'http://localhost:10080/commit2memo/decks/1/cards',
                type : 'GET',
                success : function(data) {
                    cards = data;
                    percent = 100 / cards.length;
                    initLength = cards.length;
                    $.get('static/pages/flip.html', function(data) {
                        $(data).find(".training, .card").appendTo(".flip");
                        $(data).find(".training, .btn-group-justified").appendTo("#again_know");
                        $(data).find(".training, #memo_stat").appendTo("#memo_stat");
                        $('#infobar').css('width', '100%');
                        $('#counter').text("1 of " + cards.length);
                    }).done(function() {
                        $("#wordCount").html(cards.length);
                        nextCard(curIndex);
                        $("#neww").addClass("disabled");
                        for (var i = 0; i < cards.length; i++) {
                            cards[i].know = 2;
                        }
                    });
                    
                },
                error : function(data) {
                    console.log(data);
                }
            });
        });

        function initNewWordTab() {
            addDecks();
            $.get('static/pages/flip.html', function(data) {
                $(data).find(".training, #startNew").appendTo(".flip");

            }).done(function() {
                $("#wordCount").html(cards.length);
            });
        };
    </script>
</body>
</html>