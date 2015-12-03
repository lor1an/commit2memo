<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>commit2memo</title>
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_parameter" content="X-CSRF-TOKEN" />
<link rel="icon" type="image/x-icon" href="static/img/favicon.ico" />
<link rel="shortcut icon" type="image/x-icon"
	href="static/img/favicon.ico" />
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
<style>
.error {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #a94442;
	background-color: #f2dede;
	border-color: #ebccd1;
}

.msg {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #31708f;
	background-color: #d9edf7;
	border-color: #bce8f1;
}

#login-box {
	width: 300px;
	padding: 20px;
	margin: 100px auto;
	background: #fff;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border: 1px solid #000;
}

.b {
	margin-right: 0;
	margin-left: 0;
	background-color: #fff;
	border-color: #ddd;
	border-width: 1px;
	border-radius: 4px 4px 0 0;
	-webkit-box-shadow: none;
	box-shadow: none;
}
</style>
</head>
<body onload='document.loginForm.username.focus();'>

	<div class="container">
		<div class="row">
			<form class="form-signin">
				<h2 class="form-signin-heading">Please sign in:</h2>
				<label for="inputUsername" class="sr-only">Username</label> <input
					type="text" id="inputUsername" class="form-control"
					placeholder="Username" required="true" autofocus="true"> <label
					for="inputPassword" class="sr-only">Password</label> <input
					type="password" id="inputPassword" class="form-control"
					placeholder="Password" required="true">
				<button class="btn btn-lg btn-primary btn-block login" type="submit">Sign
					in</button>
			</form>
		</div>
	</div>

	<div id="login-box">

		<h2>Login with Username and Password</h2>

		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>

		<form name='loginForm'
			action="<c:url value='j_spring_security_check' />" method='POST'>

			<table>
				<tr>
					<td>User:</td>
					<td><input type='text' name='username' value=''></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type='password' name='password' /></td>
				</tr>
				<tr>
					<td colspan='2'><input name="submit" type="submit"
						value="submit" /></td>
				</tr>
			</table>

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />

		</form>
	</div>
	<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
	<script>
        $('.logout').click(function(e) {
            e.preventDefault();
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            $.ajax({
                url : 'http://localhost:10080/commit2memo/j_spring_security_logout',
                type : 'POST',
                data : token,
                beforeSend : function(xhr) {
                    xhr.setRequestHeader(header, token);
                },
                success : function(data) {
                    window.location = "http://localhost:10080/commit2memo/login";
                },
                error : function(data) {
                    console.log(data);
                }
            });
        });

        $('.login').click(function(e) {
            e.preventDefault();
            console.log();
            var token = $("meta[name='_csrf']").attr("content");
            var header;
            console.log(token);
            console.log(header);
            var inUser = $('#inputUsername').val();
            var inPass = $('#inputPassword').val();
            $.ajax({
                url : 'http://localhost:10080/commit2memo/j_spring_security_check',
                type : 'POST',
                data : {"j_username": inUser, "j_password": inPass},
                beforeSend : function(xhr) {
                    xhr.setRequestHeader(header, token);
                },
                error : function(data) {
                    console.log(data);
                }
            });
        });
    </script>
</body>
</html>