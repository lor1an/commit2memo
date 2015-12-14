var decksUrl = "http://localhost:10080/commit2memo/decks";
var searchWord;
$('.search').click(function() {
    var checkbox = "<span class='input-group-addon'><input type='checkbox' class='checkb' aria-label='...'></span>";
    var i = 0;
    var transform = {
        "tag" : "div",
        "id" : "word",
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
            "id" : "def",
            "class" : "def",
            "html" : "<span style='font-style: italic;' >   \${funcLabel}</span>"
        } ]
    };

    var transform2 = {
        "tag" : "div",
        "id" : "",
        "class" : "sndf",
        "children" : [ {
            "tag" : "div",
            "class" : "senseNumber input-group",
            "html" : "<div class='senseValue'><span style='font-weight: bold;' >(\${senseNumber})</span> \${value} \${synonymous} \${verbalIllustration} \${usageNote}</div>"
        } ]
    };

    searchWord = $('#search_field').val();
    var url = "http://localhost:10080/commit2memo/entryList/";
    $.get(url + searchWord, function(data) {
        var json = data.entryList;

        if (!$('#list').is(':empty')) {
            $('#list').empty();
        }

        for (var j = 0; j < json.length; j++) {
            transform.id = "word" + j;
            transform.children[2].id = "def" + j;
            $('#list').json2html(json[j], transform);
        }
        i = 0;
        for (var j = 0; j < json.length; j++) {
            for (var k = 0; k < json[j].def.sndf.length; k++) {
                transform2.id = "sndf" + k;
                $('#def' + j).json2html(json[j].def.sndf[k], transform2);
            }
        }
        $("span:contains('//')").css("display", "none");
        $("span:contains('()')").css("display", "none");
        $.get('static/pages/buttons.html', function(data) {
            $(data).find(".brut, .btn-group-justified").appendTo(".word");
        });
        $('.senseNumber').append(checkbox);

    }).fail(function() {
        console.log("error");
    });

});

$(document).on("click", ".btn-group-justified", function(e) {
    var deckId = parseInt($("#selectDeck").children(":selected").attr("id").substring(4));
    var wordId = parseInt($(this).parent('.word').attr("id").substring(4));
    var defId = $(this).prev().attr("id");
    var checked = $('#' + defId + ' .checkb:checked');
    var sndfIds = [];
    if (checked.length == 0) {
        $('#' + defId + ' .checkb').each(function() {
            sndfIds.push(parseInt($(this).closest('.sndf').attr("id").substring(4)));
        });
    } else {
        checked.each(function() {
            sndfIds.push($(this).closest('.sndf').attr("id").substring(4));
        });
    }
    var card = {
        "searchWord" : searchWord,
        "wordId" : wordId,
        "sensesId" : sndfIds,
        "deckId" : deckId
    };
    console.log(card);
    console.log(JSON.stringify(card));
    e.preventDefault();
    $.ajax({
        url : decksUrl + "/" + deckId,
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
});

$(document).ready(function() {
    addDecks();
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

$(document).on("click", ".checkb", function(e) {
    var id = $(this).closest('.def').attr("id");
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

$(document).on("click", ".senseValue", function(e) {
    var check = $(this).parent().find(".checkb")[0];
    $(check).trigger("click");
});