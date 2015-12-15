
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>commit2memo</title>
<link rel="icon" type="image/x-icon" href="static/img/favicon.ico" />
<link rel="shortcut icon" type="image/x-icon" href="static/img/favicon.ico" />
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="static/css/styles.css">
</head>
<style>
tr:hover {
	background: white;
}

.table {
	margin-top: 10px;
}

.table>thead>tr>th, .table>tbody>tr>th, .table>tfoot>tr>th, .table>thead>tr>td,
	.table>tbody>tr>td, .table>tfoot>tr>td {
	border-top: 1px solid rgb(204, 204, 204);
	border-bottom: 1px solid rgb(204, 204, 204);
	border-left: 1px solid rgb(204, 204, 204);
	border-right: 1px solid rgb(204, 204, 204);
	vertical-align: middle
}

.card:hover {
	background: #E4E4E4;
	color: #000000;
	cursor: pointer;
}

.high{
    background: #E4E4E4;
}
.delButton {
	padding-left: 10px;
    margin-right: 26px;
}

.cb {
	width: 36px;
    background-color: rgb(238, 238, 238);
}
.input-group-addon:last-child{
    background-color: rgb(238, 238, 238);
}
</style>
<body>
    <div class="navbar-wrapper">
        <div class="container"></div>
        <div class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button class="navbar-toggle" data-toggle="collapse" type="button" data-target=".navbar-collapse">
                        <span class='glyphicon glyphicon-menu-hamburger' aria-hidden='true'></span> <span
                            class="sr-only">Toggle navigation</span>
                    </button>
                    <a href="/" class="navbar-brand">commit2memo</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="activeTab"><a href="">Memorizing</a></li>
                        <li><a href="profile">My profile</a> <span class="icon-envelope"></span></li>
                        <li><a href="about">About</a></li>
                        <li><a href="" class="logout">Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div id="leftCol" class="col-md-3 sidebar">
                <ul class="nav nav-pills nav-stacked">
                    <li role="presentation"><a href="trainings">Trainings<span class="badge repeatCount">0</span></a></li>
                    <li role="presentation"><a href="decksPage">Decks</a></li>
                    <li role="presentation"><a href="cardPage">Add card</a></li>
                    <li role="presentation" class="active"><a href="cards">All cards</a></li>
                </ul>
            </div>
        </div>
        <div class="col-sm-6 worker">
            <div class="thumbnail">
                <div class="" style="display: flex; padding-top: 5px;">
                    <div style="width: 80%;">
                        <select id="selectDeck" class="form-control">
                        </select>
                    </div>
                    <div class="delButton">
                        <button id="deleteButton" type="button" class="btn btn-danger disabled switch">
                            <span class="glyphicon glyphicon-minus" aria-hidden="true"></span> Delete cards
                        </button>
                    </div>
                </div>
                <div class="list">
                    <table class="table ">
                        <tbody id="cardsList" class="cardsList">
                        </tbody>
                    </table>
                </div>
                <div id="memo_stat"></div>
                <div class="flip"></div>
                <div id="again_know"></div>
            </div>
        </div>
    </div>
    <script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script src="static/js/jquery.json2html.js"></script>
    <script src="static/js/json2html.js"></script>
    <script src="static/js/auth.js"></script>
    <script src="static/js/scripts.js"></script>
    <script src="static/js/cards.js"></script>
</body>
</html>