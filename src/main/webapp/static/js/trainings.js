var decksUrl = "http://localhost:10080/commit2memo/decks";
var cardsUrl = "http://localhost:10080/commit2memo/cards/";
var cards;
var curIndex = 0;
var curDeckId;
var percent;
var initLength;
var succbarW = 0;
var failbarW = 0;

$(document).ready(function() {
    if ($(".repeatCount").val() > 0) {
        initTab("repeat");
    }
});

$(document).on("click", ".trtab", function(e) {

    if (!($(this).hasClass("disabled") || $(this).hasClass("active"))) {
        $(".flip").empty();
        $("#again_know").empty();
        $('.trtab').toggleClass("active");
        if ($('span.na').text() > 0) {
            initTab($(this).attr("id").substring(4));
        }
        $('.trtab .badge').toggleClass("na");
    }
});

function initTab(value) {
    addDecks("/" + value).done(function() {
        $.get('static/pages/flip.html', function(data) {
            $(data).find(".training, #start_" + value).appendTo(".flip");
        }).done(function() {
            addCardCounter(value + "Count/");
        });
    });
};

function addDecks(value) {
    var url = decksUrl + value;
    return $.get(url, function(data) {
        var transform = {
            "tag" : "option",
            "id" : "deck\${deckId}",
            "html" : "\${name}"
        };
        $('#selectDeck').empty();
        $('#selectDeck').json2html(data, transform);
        curDeckId = parseInt($("#selectDeck").children(":selected").attr("id").substring(4));
    }).fail(function() {
        console.log("error");
    });
};

function addCardCounter(value) {
    var url = cardsUrl + value + curDeckId;
    $.get(url, function(data) {
        $("#wordCount").text(data)
    })
};

$(document).on("click", ".start", function(e) {
    $(".flip").empty();
    initTraining($(this).attr("id") + "/");
});

function initTraining(value) {
    var url = cardsUrl + value + curDeckId;
    $.ajax({
        url : url,
        type : 'GET',
        success : function(data) {
            cards = data;
            console.log(data);
            percent = 100 / cards.length;
            initLength = cards.length;
            $.get('static/pages/flip.html', function(data) {
                $(data).find(".training, .card").appendTo(".flip");
                $(data).find(".training, .btn-group-justified").appendTo("#again_know");
                $(data).find(".training, #memo_stat").appendTo("#memo_stat");
                $('#infobar').css('width', '100%');
                $('#counter').text("1 of " + cards.length);
            }).done(function() {
                nextCard(curIndex);
                $(".trtab").toggleClass("disabled");
                $(".trtab .active").toggleClass("disabled");
                for (var i = 0; i < cards.length; i++) {
                    cards[i].know = 2;
                }
            });
        },
        error : function(data) {
            console.log(data);
        }
    });
};

function nextCard(index) {
    $('#front').empty();
    $('#front').text(cards[index].entry.entryWord);
    $('#back').empty();
    console.log()
    $('#back').json2html(cards[index].entry, transform);
    $('#def').empty();
    for (var i = 0; i < cards[index].entry.def.sndf.length; i++) {
        $('#def').json2html(cards[index].entry.def.sndf[i], transform2);
    }
}

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
            succbarW = 0;
            failbarW = 0;
            $('.flip').empty();
            $('#counter').empty();
            $("#again_know").empty();
            $(".trtab").removeClass("disabled");
            $.get('static/pages/flip.html', function(data) {
                $(data).find(".training, #fin_msg").appendTo(".flip");
            })
            $.get(cardsUrl + $('.trtab.active .badge').attr("id"), function(data) {
                $('.trtab.active .badge').html(data);
            });
        }, 500);
    }
});

function removeCard(know) {
    if (know <= 0) {
        var card = cards[curIndex];
        delete card.know;
        card.memorize = true;
        cards.splice(curIndex, 1);
        sendCard(card);
        succbarW += percent;
        $('#succbar').css('width', succbarW + '%').attr('aria-valuenow', succbarW);
        return true;
    } else if (know >= 4) {
        var card = cards[curIndex];
        card.memorize = false;
        delete card.know;
        cards.splice(curIndex, 1);
        sendCard(card);
        failbarW += percent;
        $('#failbar').css('width', failbarW + '%').attr('aria-valuenow', failbarW);
        return true;
    }
    return false;
}

function sendCard(card) {
    var url = cardsUrl + curDeckId;
    $.ajax({
        url : url,
        type : 'PUT',
        contentType : "application/json",
        data : JSON.stringify(card),
        success : function(data) {
            console.log("success");
        },
        error : function(data) {
            console.log(data);
        }
    });
};

$(document).on("change", "#selectDeck", function(e) {
    curDeckId = parseInt($("#selectDeck").children(":selected").attr("id").substring(4));
    var value = $(".trtab.active").attr("id").substring(4);
    if ($("#wordCount").length > 0) {
        addCardCounter(value + "Count/");
    } else {
        $(".flip").empty();
        $("#again_know").empty();
        $("#memo_stat").empty();
        initTab(value);
    }
});

$(document).on("click", ".flip", function(e) {
    $(this).find('.card').toggleClass('flipped');
});

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