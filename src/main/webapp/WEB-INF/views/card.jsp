
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Commit 2 memo</title>
<meta name="generator" content="Bootply" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description"
	content="Uses a fixed left sidebar, that attaches after scrolling past a large top header. Scrollspy menu." />
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">


<style type="text/css">
/*
A Bootstrap 3.1 affix sidebar template
from http://bootply.com

This CSS code should follow the 'bootstrap.css'
in your HTML file.

license: MIT
author: bootply.com
*/
body {
	padding-top: 50px;
}

#masthead {
	min-height: 250px;
}

#masthead h1 {
	font-size: 30px;
	line-height: 1;
	padding-top: 20px;
}

#masthead .well {
	margin-top: 8%;
}

@media screen and (min-width: 768px) {
	#masthead h1 {
		font-size: 50px;
	}
}

.navbar-bright {
	background-color: #111155;
	color: #fff;
}

.affix-top, .affix {
	position: static;
}

@media ( min-width : 979px) {
	#sidebar.affix-top {
		position: static;
		margin-top: 30px;
		width: 228px;
	}
	#sidebar.affix {
		position: fixed;
		top: 70px;
		width: 228px;
	}
}

#sidebar li.active {
	border: 0 #eee solid;
	border-right-width: 5px;
}
</style>
</head>

<body ng-app="myApp" class="ng-cloak">

	<nav class="navbar navbar-default navbar-fixed-top" role="banner">
		<div class="container">
			<div class="navbar-header">
				<a href="/" class="navbar-brand">2memo</a>
			</div>
			<nav class="collapse navbar-collapse" role="navigation">
				<ul class="nav navbar-nav">
					<li><a href="profile">My profile</a></li>
					<li><a href="about">About</a></li>
					<li><a href="logout">Logout</a></li>
				</ul>
			</nav>
		</div>
	</nav>

	<div class="container">
		<div class="row">
			<div class="col-md-3" id="leftCol">
				<ul class="nav nav-stacked row-fluid" style="position: fixed; top: 80px;"
					id="sidebar">
					<li><a href="trainings">Trainings</a></li>
					<li><a href="decks">Decks</a></li>
					<li><a href="card">Add card</a></li>
					<li><a href="cards">All cards</a></li>
				</ul>
			</div>
			<div class="row">


				<div class="col-sm-6 " style="">
					<div class="thumbnail">
						<div class="input-group">
							<input type="text" id="search_field" class="form-control"
								placeholder="Search for..." /> <span class="input-group-btn">
								<button class="btn btn-primary search" type="button">Search</button>
							</span>

						</div>

						<div id="list"></div>


						<div class="caption">
							<div>
								<div class="btn-group btn-group-justified" role="group">
									<div class="btn-group" role="group">
										<button type="button" class="btn btn-success">
											<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
											Add card
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>


	<script src="static/js/angular-bootstrap.js" type="text/javascript"></script>
	<script src="static/js/hello.js"></script>
	<script src="static/js/app.js"></script>
	<script src="static/js/user_service.js"></script>
	<script src="static/js/user_controller.js"></script>
	<script src="//underscorejs.org/underscore-min.js"></script>
	<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="static/js/jquery.json2html.js"></script>
	<script src="static/js/json2html.js"></script>

	<div id="chart"></div>

	<script>
	
		$('.search').click(function() {
			var i = 0;
			function incr(){
				i +=1;
				return i;
			}
			var inc = incr();
			var transform = {"tag":"div","class":"word","children":[
			              											{"tag":"div","class":"entryWord","html":"\${entryWord}"},
			              {"tag":"div","class":"sound","html":"\${sound.wav}"},
			              {"tag":"div","class":"pronunciation","html":"\${pronunciation}"},
			              {"tag":"div","class":"funcLabel","html":"\${funcLabel}"},
			              {"tag":"div","class":"def", "id": "def" + inc}
			              
			              
			  ]};
			
			var transform2 = {"tag":"div","class":"sndf","id": "sndf" + inc, "children":[
			              											{"tag":"div","class":"senseNumber","html":"\${senseNumber}"},
			              {"tag":"div","class":"value","html":"\${value}"},
			              {"tag":"div","class":"synonymous","html":"\${synonymous}"},
			              {"tag":"div","class":"usageNote","html":"\${usageNote}"},
			              {"tag":"div","class":"verbalIllustration","html":"\${verbalIllustration}"}
			              
			              
			  ]};
			
			var word = $('#search_field').val();
		 	var url = "http://localhost:10080/commit2memo/entryList/";
		 	
			$.get(url + word, function(data) {

				var json = data.entryList;
				
				for(var j =0; j < json.length; j++){
					$('#list').json2html(json[j], transform);
					transform.children[4].id = "def" + incr(); 
				}
				i = 0;
			  	for(var j =0; j < json.length; j++){
					var inc = incr();
					var k_inc = 0;
					for(var k =0; k < json[j].def.sndf.length; k++){
						transform2.id = "sndf"+inc.toString()	 + k_inc;
					 	$('#def' + inc).json2html(json[j].def.sndf[k], transform2); 
						k_inc++;
					}
				}  

			}).fail(function() {
				console.log("error");
			}); 

		});
	</script>
</body>
</html>