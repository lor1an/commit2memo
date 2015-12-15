var curDeckId;
var decksUrl = "http://localhost:10080/commit2memo/decks";
var cardsUrl = "http://localhost:10080/commit2memo/cards/";
var cards;
var initLength;

$(document).ready(function() {
    addDecks().done(function() {
        curDeckId = parseInt($("#selectDeck").children(":selected").attr("id").substring(4));
        getCardsForDeck().done(function() {
            insertCardsToTable();
        });
    });
});

function addDecks() {
    var url = decksUrl;
    return $.get(url, function(data) {
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

function getCardsForDeck() {
    var url = cardsUrl + curDeckId;
    return $.get(url, function(data) {
        cards = data;
        
        initLength = cards.length;

    }).fail(function() {
        console.log("error");
    });
}

function insertCardsToTable() {
    var checkbox = "<td><div class='cb'><span class='input-group-addon'><input type='checkbox' class='checkb' aria-label='...'></span></div></td>";
    $('#cardsList').empty();
    for (var i = 0; i < cards.length; i++) {
        transform.id = "card" + cards[i].cardId;
        transform.children[1].id = "def" + i;
        $('#cardsList').json2html(cards[i].entry, transform);
    }
    for(var i = 0; i < cards.length; i++){
        for (var j = 0; j < cards[i].entry.def.sndf.length; j++) {
            $('#def' + i).json2html(cards[i].entry.def.sndf[j], transform2);
        }
    }
    
    $('.card').append(checkbox);
    
}

$(document).on("click", ".checkb", function(e) {
    var id = $(this).closest('.card').attr("id");
    var checked = $('#' + id + ' .checkb:checked');
    var unchecked = $('#' + id + ' .checkb:not(:checked)');
    if ($(this).is(":checked")) {
        $(this).closest('.sndf').removeClass("disabledSndf");
        if (checked.length == 1) {
            unchecked.each(function() {
                $(this).closest('.sndf').addClass("disabledSndf");
            });
        }
    } else {
        $(this).closest('.sndf').addClass("disabledSndf");
        if (checked.length == 0) {
            unchecked.each(function() {
                $(this).closest('.sndf').removeClass("disabledSndf");
            });
        }
    }
});
var transform = {
    "tag" : "tr",
    "id" : "card",
    "class" : "card",
    "children" : [ {
        "tag" : "td",
        "class" : "entryWord",
        "html" : "<span style='font-weight: bold;' >\${entryWord}</span>"
    }, {
        "tag" : "td",
        "id" : "def",
        "class" : "def",
    } ]
};

var transform2 = {
    "tag" : "div",
    "id" : "",
    "class" : "sndf",
    "children" : [ {
        "tag" : "div",
        "class" : "cardSenseNumber input-group",
        "html" : "<div class='senseValue'><span style='font-weight: bold;' >(\${senseNumber})</span> \${value} \${synonymous} \${verbalIllustration} \${usageNote}</div>"
    } ]
};
