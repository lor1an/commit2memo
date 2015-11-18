<!doctype html>
<html>
<head>
<title>Hello AngularJS</title>
<link
	href="static/css/angular-bootstrap.css"
	rel="stylesheet">
<style type="text/css">
[ng\:cloak], [ng-cloak], .ng-cloak {
	display: none !important;
}
</style>
</head>

	<div class="alert alert-danger" ng-show="error">
	There was a problem logging in. Please try again.
</div>
<form role="form" ng-submit="login()">
	<div class="form-group">
		<label for="username">Username:</label> <input type="text"
			class="form-control" id="username" name="username" ng-model="credentials.username"/>
	</div>
	<div class="form-group">
		<label for="password">Password:</label> <input type="password"
			class="form-control" id="password" name="password" ng-model="credentials.password"/>
	</div>
	<button type="submit" class="btn btn-primary">Submit</button>
</form>

</html>