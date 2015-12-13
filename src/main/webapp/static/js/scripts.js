$(document).ready(function() {
    var url = "http://localhost:10080/commit2memo/cards/repeatCount";
    $.get(url, function(data) {
        console.log(data);
        $(".repeatCount").html(data);
    });
});