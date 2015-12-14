$('.login').click(function(e) {
	e.preventDefault();
	$.ajax({
		url : 'http://localhost:10080/commit2memo/j_spring_security_check',
		type : 'POST',
		data : {
			"username" : $('#inputUsername').val(),
			"password" : $('#inputPassword').val()
		},
		beforeSend : function(xhr) {
			xhr.setRequestHeader("X-Ajax-call", "true");
		},
		success : function(data) {
			window.location = "http://localhost:10080/commit2memo/cardPage";
		},
		error : function(data) {
			console.log(data);
		}
	});
});
$('.logout').click(function(e) {
	e.preventDefault();
	$.ajax({
		url : 'http://localhost:10080/commit2memo/j_spring_security_logout',
		type : 'POST',
		success : function(data) {
			window.location = "http://localhost:10080/commit2memo/login";
		},
		error : function(data) {
			console.log(data);
		}
	});
});
$('.register').click(function(e) {
    e.preventDefault();
    $.ajax({
        url : 'http://localhost:10080/commit2memo/user',
        type : 'POST',
        contentType : "application/json",
        data : JSON.stringify({
            "username" : $('#inputUsername').val(),
            "password" : $('#inputPassword').val()
        }),
        success : function(data) {
            window.location = "http://localhost:10080/commit2memo/login";
        },
        error : function(data) {
            console.log(data);
        }
    });
});