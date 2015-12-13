$(document).ready(function() {
    var url = "http://localhost:10080/commit2memo/cards/repeatCount";
    $.get(url, function(data) {
        console.log(data);
        $(".repeatCount").html(data);
    });
});

$(document).ready(function() {
    if ($(".newCount").length > 0) {
        var url = "http://localhost:10080/commit2memo/cards/newCount";
        $.get(url, function(data) {
            console.log(data);
            $(".newCount").html(data);
        });
    }
});