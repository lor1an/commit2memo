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
            console.log("failure");
            $('#head').hide();
            $('#alert').show();
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
    if (valEm($('#inputEmail').val()) && valUs($('#inputUsername').val()) && valPas($('#inputPassword').val())) {
        $.ajax({
            url : 'http://localhost:10080/commit2memo/client',
            type : 'POST',
            contentType : "application/json",
            data : JSON.stringify({
                "email" : $('#inputEmail').val(),
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
    }else{
        console.log("fail");
    }

});

$(document).on("focusout", "#inputEmail", function() {
    valEm($(this).val());

});

$(document).on("focusout", "#inputUsername", function() {
    valUs($(this).val());

});

$(document).on("focusout", "#inputPassword", function() {
    valPas($(this).val());
});

function valEm(v) {
    if (v.length === 0 || !validateEmail(v)) {
        $("#alE3").hide();
        $("#alE2").hide();
        $("#alE1").show();
        $("#eForm").removeClass("has-success");
        $("#eForm").addClass("has-error");
        $("#sucE").hide();
        $("#failE").show();
        return false;
    } else {
        var url = "http://localhost:10080/commit2memo/checkEmail?email=" + v;
        return $.get(url, function() {
            $("#alE1").hide();
            $("#alE2").hide();
            $("#alE3").show();
            $("#eForm").removeClass("has-error");
            $("#eForm").addClass("has-success");
            $("#sucE").show();
            $("#failE").hide();
            return true;
        }).fail(function() {
            $("#alE3").hide();
            $("#alE1").hide();
            $("#alE2").show();
            $("#eForm").removeClass("has-success");
            $("#eForm").addClass("has-error");
            $("#sucE").hide();
            $("#failE").show();
            return false;
        })
    }
}

function valUs(v) {
    if (v.length === 0 || !validateUsername(v)) {
        $("#alU3").hide();
        $("#alU2").hide();
        $("#alU1").show();
        $("#uForm").removeClass("has-success");
        $("#uForm").addClass("has-error");
        $("#sucU").hide();
        $("#failU").show();
        return false;
    } else {
        var url = "http://localhost:10080/commit2memo/checkUsername?username=" + v;
        return $.get(url, function() {
            $("#alU1").hide();
            $("#alU2").hide();
            $("#alU3").show();
            $("#uForm").removeClass("has-error");
            $("#uForm").addClass("has-success");
            $("#failU").hide();
            $("#sucU").show();
            return true;
        }).fail(function() {
            $("#alU3").hide();
            $("#alU1").hide();
            $("#alU2").show();
            $("#uForm").removeClass("has-success");
            $("#uForm").addClass("has-error");
            $("#sucU").hide();
            $("#failU").show();
            return false;
        })
    }
}

function valPas(v) {
    if (v.length === 0 || !validatePassword(v)) {
        $("#alP1").hide();
        $("#alP2").show();
        $("#pForm").removeClass("has-success");
        $("#pForm").addClass("has-error");
        $("#sucP").hide();
        $("#failP").show();
        return false;
    } else {
        $("#alP2").hide();
        $("#alP1").show();
        $("#pForm").removeClass("has-error");
        $("#pForm").addClass("has-success");
        $("#failP").hide();
        $("#sucP").show();
        return true;
    }
}
function validateEmail(email) {
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
};

function validateUsername(username) {
    return username.length > 3;
}

function validatePassword(password) {
    return password.length > 3;
}
