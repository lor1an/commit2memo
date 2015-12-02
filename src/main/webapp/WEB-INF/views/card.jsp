
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

div:empty {
   display: none;
}


audio[src=""]{
	display: none;
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

.entryWord{
}
</style>
</head>

<body ng-app="myApp" class="ng-cloak">
	<div>John</div>
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
						  {"tag":"div","class":"entryWord","html":"<span style='font-weight: bold;' >\${entryWord}</span ><span >	/\${pronunciation}/</span>"},			                                                        
			              {"tag":"audio controls","src":"\${sound.wav}", "type":"audio/mpeg", "html":"\${sound.wav}"},
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
		 	var json1 = [{
		 	 	"entryWord": "food",
		 	 	"sound": {
		 	 		"wav": "http://media.merriam-webster.com/soundc11/f/food0001.wav"
		 	 	},
		 	 	"pronunciation": "ˈfüd",
		 	 	"funcLabel": "noun",
		 	 	"def": {
		 	 		"sndf": [{
		 	 			"senseNumber": "1 a",
		 	 			"value": ":material consisting essentially of protein, carbohydrate, and fat used in the body of an organism to sustain growth, repair, and vital processes and to furnish energy",
		 	 			"synonymous": null,
		 	 			"usageNote": null,
		 	 			"verbalIllustration": null
		 	 		}, {
		 	 			"senseNumber": "1 a",
		 	 			"value": ":such food together with supplementary substances (as minerals, vitamins, and condiments)",
		 	 			"synonymous": null,
		 	 			"usageNote": null,
		 	 			"verbalIllustration": null
		 	 		}, {
		 	 			"senseNumber": "b",
		 	 			"value": ":inorganic substances absorbed by plants in gaseous form or in water solution",
		 	 			"synonymous": null,
		 	 			"usageNote": null,
		 	 			"verbalIllustration": null
		 	 		}, {
		 	 			"senseNumber": "2",
		 	 			"value": ":nutriment in solid form",
		 	 			"synonymous": null,
		 	 			"usageNote": null,
		 	 			"verbalIllustration": null
		 	 		}, {
		 	 			"senseNumber": "3",
		 	 			"value": ":something that nourishes, sustains, or supplies ",
		 	 			"synonymous": null,
		 	 			"usageNote": null,
		 	 			"verbalIllustration": "(f. e.:food for thought)"
		 	 		}]
		 	 	}
		 	 }, {
		 	 	"entryWord": "food chain",
		 	 	"sound": null,
		 	 	"pronunciation": null,
		 	 	"funcLabel": "noun",
		 	 	"def": {
		 	 		"sndf": [{
		 	 			"senseNumber": "1",
		 	 			"value": ":an arrangement of the organisms of an ecological community according to the order of predation in which each uses the next usually lower member as a food source",
		 	 			"synonymous": null,
		 	 			"usageNote": null,
		 	 			"verbalIllustration": null
		 	 		}, {
		 	 			"senseNumber": "2",
		 	 			"value": ":a hierarchy based on power or importance ",
		 	 			"synonymous": null,
		 	 			"usageNote": null,
		 	 			"verbalIllustration": "(f. e.:at the top of the corporate food chain)"
		 	 		}]
		 	 	}
		 	 }, {
		 	 	"entryWord": "food court",
		 	 	"sound": null,
		 	 	"pronunciation": null,
		 	 	"funcLabel": "noun",
		 	 	"def": {
		 	 		"sndf": [{
		 	 			"senseNumber": null,
		 	 			"value": ":an area within a building (as a shopping mall) set apart for food concessions",
		 	 			"synonymous": null,
		 	 			"usageNote": null,
		 	 			"verbalIllustration": null
		 	 		}]
		 	 	}
		 	 }, {
		 	 	"entryWord": "food poisoning",
		 	 	"sound": null,
		 	 	"pronunciation": null,
		 	 	"funcLabel": "noun",
		 	 	"def": {
		 	 		"sndf": [{
		 	 			"senseNumber": null,
		 	 			"value": ":an acute gastrointestinal disorder caused by bacteria or their toxic products or by chemical residues in food",
		 	 			"synonymous": null,
		 	 			"usageNote": null,
		 	 			"verbalIllustration": null
		 	 		}]
		 	 	}
		 	 }, {
		 	 	"entryWord": "food processor",
		 	 	"sound": null,
		 	 	"pronunciation": null,
		 	 	"funcLabel": "noun",
		 	 	"def": {
		 	 		"sndf": [{
		 	 			"senseNumber": null,
		 	 			"value": ":an electric kitchen appliance with a set of interchangeable blades revolving inside a container",
		 	 			"synonymous": null,
		 	 			"usageNote": null,
		 	 			"verbalIllustration": null
		 	 		}]
		 	 	}
		 	 }, {
		 	 	"entryWord": "food pyramid",
		 	 	"sound": null,
		 	 	"pronunciation": null,
		 	 	"funcLabel": "noun",
		 	 	"def": {
		 	 		"sndf": [{
		 	 			"senseNumber": null,
		 	 			"value": ":an ecological hierarchy of food relationships in which a chief predator is at the top, each level preys on the next lower level, and usually green plants are at the bottom",
		 	 			"synonymous": null,
		 	 			"usageNote": null,
		 	 			"verbalIllustration": null
		 	 		}]
		 	 	}
		 	 }, {
		 	 	"entryWord": "food stamp",
		 	 	"sound": null,
		 	 	"pronunciation": null,
		 	 	"funcLabel": "noun",
		 	 	"def": {
		 	 		"sndf": [{
		 	 			"senseNumber": null,
		 	 			"value": ":a government-issued coupon that is sold or given to low-income persons and is redeemable for food",
		 	 			"synonymous": null,
		 	 			"usageNote": null,
		 	 			"verbalIllustration": null
		 	 		}]
		 	 	}
		 	 }, {
		 	 	"entryWord": "food vacuole",
		 	 	"sound": null,
		 	 	"pronunciation": null,
		 	 	"funcLabel": "noun",
		 	 	"def": {
		 	 		"sndf": [{
		 	 			"senseNumber": null,
		 	 			"value": ":a membrane-bound vacuole (as in an amoeba) in which ingested food is digested ",
		 	 			"synonymous": null,
		 	 			"usageNote": null,
		 	 			"verbalIllustration": null
		 	 		}]
		 	 	}
		 	 }, {
		 	 	"entryWord": "food web",
		 	 	"sound": null,
		 	 	"pronunciation": null,
		 	 	"funcLabel": "noun",
		 	 	"def": {
		 	 		"sndf": [{
		 	 			"senseNumber": null,
		 	 			"value": ":the totality of interacting food chains in an ecological community",
		 	 			"synonymous": null,
		 	 			"usageNote": null,
		 	 			"verbalIllustration": null
		 	 		}]
		 	 	}
		 	 }, {
		 	 	"entryWord": "angel food cake",
		 	 	"sound": null,
		 	 	"pronunciation": null,
		 	 	"funcLabel": "noun",
		 	 	"def": {
		 	 		"sndf": [{
		 	 			"senseNumber": null,
		 	 			"value": ":a usually white sponge cake made of flour, sugar, and whites of eggs",
		 	 			"synonymous": null,
		 	 			"usageNote": null,
		 	 			"verbalIllustration": null
		 	 		}]
		 	 	}
		 	 }];
 			$.get(url + word, function(data) {

				var json = data.entryList;
				console.log(JSON.stringify(json));
				for(var j =0; j < json.length; j++){
					$('#list').json2html(json[j], transform, {"replace": true});
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
			  	$( "span:contains('//')" ).css( "display", "none" );
				
			}).fail(function() {
				console.log("error");
			}); 
			
			  

			
		});
	</script>
</body>
</html>