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
        "html" : "<div style='font-weight: bold; text-align: center' >  \${funcLabel}</div>"
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
        // $("#wordCount").html(cards.length);
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