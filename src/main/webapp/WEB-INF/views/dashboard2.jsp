
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Bootply snippet - Bootstrap Bootstrap 3 Affix Sidebar</title>
<meta name="generator" content="Bootply" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description"
	content="Uses a fixed left sidebar, that attaches after scrolling past a large top header. Scrollspy menu." />
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"
	rel="stylesheet">


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

<body>

	<nav class="navbar navbar-default navbar-fixed-top" role="banner">
		<div class="container">
			<div class="navbar-header">
				<button class="navbar-toggle" type="button" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a href="/" class="navbar-brand">Bootply</a>
			</div>
			<nav class="collapse navbar-collapse" role="navigation">
				<ul class="nav navbar-nav">
					<li><a href="#sec">Get Started</a></li>
					<li><a href="#sec">Edit</a></li>
					<li><a href="#sec">Visualize</a></li>
					<li><a href="#sec">Prototype</a></li>
				</ul>
			</nav>
		</div>
	</nav>

	<div id="masthead">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<h1>
						Bootstrap Sidebar
						<p class="lead">With Affix and Scrollspy</p>
					</h1>
				</div>
				<div class="col-md-5">
					<div class="well well-lg">
						<div class="row">
							<div class="col-sm-6">
								<img src="//placehold.it/180x100" class="img-responsive">
							</div>
							<div class="col-sm-6">Some text here</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/container-->
	</div>
	<!--/masthead-->

	<!--main-->
	<div class="container">
		<div class="row">
			<!--left-->
			<div class="col-md-3" id="leftCol">
				<ul class="nav nav-stacked" id="sidebar">
					<li><a href="#sec0">Section 0</a></li>
					<li><a href="#sec1">Section 1</a></li>
					<li><a href="#sec2">Section 2</a></li>
					<li><a href="#sec3">Section 3</a></li>
					<li><a href="#sec4">Section 4</a></li>
				</ul>
			</div>
			<!--/left-->

			<!--right-->
			<div class="col-md-9">
				<h2 id="sec0">Content</h2>
				<p>At Bootply we like to build simple Bootstrap templates that
					utilize the code Bootstap CSS without a lot of customization. Sure
					you can find a lot of Bootstrap themes and inspiration, but these
					templates tend to be heavy on customization.</p>

				<hr>
				<p>Rem aperiam, eaque ipsa quae ab illo inventore veritatis et
					quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam
					voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed
					quia cor magni dolores eos qui ratione voluptatem sequi nesciunt.
					Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet,
					consectetur, adipisci velit, sed quia non numquam eius modi tempora
					incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut
					enim ad minima veniam, quis nostrum exercitationem ullam corporis
					suscipit laboriosam, nisi ut. Rem aperiam, eaque ipsa quae ab illo
					inventore veritatis et quasi architecto beatae vitae dicta sunt
					explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur
					aut odit aut fugit, sed quia cor magni dolores eos qui ratione
					voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem
					ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia
					non numquam eius modi tempora incidunt ut labore et dolore magnam
					aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum
					exercitationem ullam corporis suscipit laboriosam, nisi ut!</p>

				<h2 id="sec1">Content</h2>
				<p>Rem aperiam, eaque ipsa quae ab illo inventore veritatis et
					quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam
					voluptatem quia voluptas sit aspernatur aut odit aut.</p>
				<div class="row">
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3>Hello.</h3>
							</div>
							<div class="panel-body">Lorem ipsum dolor sit amet,
								consectetur adipiscing elit. Duis pharetra varius quam sit amet
								vulputate. Quisque mauris augue, molestie tincidunt condimentum
								vitae, gravida a libero. Aenean sit amet felis dolor, in
								sagittis nisi. Sed ac orci quis tortor imperdiet venenatis. Duis
								elementum auctor accumsan. Aliquam in felis sit amet augue.</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3>Hello.</h3>
							</div>
							<div class="panel-body">Lorem ipsum dolor sit amet,
								consectetur adipiscing elit. Duis pharetra varius quam sit amet
								vulputate. Quisque mauris augue, molestie tincidunt condimentum
								vitae, gravida a libero. Aenean sit amet felis dolor, in
								sagittis nisi. Sed ac orci quis tortor imperdiet venenatis. Duis
								elementum auctor accumsan. Aliquam in felis sit amet augue.</div>
						</div>
					</div>
				</div>

				<hr>

				<h2 id="sec2">Section 2</h2>
				<p>Rem aperiam, eaque ipsa quae ab illo inventore veritatis et
					quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam
					voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed
					quia cor magni dolores eos qui ratione voluptatem sequi nesciunt.
					Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet,
					consectetur, adipisci velit, sed quia non numquam eius modi tempora
					incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut
					enim ad minima veniam, quis nostrum exercitationem ullam corporis
					suscipit laboriosam, nisi ut!</p>
				<div class="row">
					<div class="col-md-4">
						<img src="//placehold.it/300x300" class="img-responsive">
					</div>
					<div class="col-md-4">
						<img src="//placehold.it/300x300" class="img-responsive">
					</div>
					<div class="col-md-4">
						<img src="//placehold.it/300x300" class="img-responsive">
					</div>
				</div>

				<hr>

				<h2 id="sec3">Section 3</h2>
				<p>Images are responsive sed @mdo but sum are more fun peratis
					unde omnis iste natus error sit voluptatem accusantium doloremque
					laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore
					veritatis et quasi architecto beatae vitae dicta sunt explicabo.
					Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit
					aut fugit, sed quia cor magni dolores eos qui ratione voluptatem
					sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia
					dolor sit amet, consectetur, adipisci velit, sed quia non numquam
					eius modi tempora incidunt ut labore et dolore magnam aliquam
					quaerat voluptatem. Ut enim ad minima veniam, quis nostrum
					exercitationem ullam corporis suscipit laboriosam, nisi ut..</p>
				<p>Fos qui ratione voluptatem sequi nesciunt. Neque porro
					quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur,
					adipisci velit, sed quia non numquam eius modi tempora incidunt ut
					labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad
					minima veniam, quis nostrum exercitationem ullam corporis suscipit
					laboriosam, nisi ut..</p>


				<h2 id="sec4">Section 4</h2>
				<p>Sed ut perspiciatis unde omnis iste natus error sit
					voluptatem accusantium doloremque laudantium, totam rem aperiam,
					eaque ipsa quae ab illo inventore veritatis et quasi architecto
					beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia
					voluptas sit aspernatur aut odit aut fugit, sed quia cor magni
					dolores eos qui ratione voluptatem sequi nesciunt. Neque porro
					quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur,
					adipisci velit, sed quia non numquam eius modi tempora incidunt ut
					labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad
					minima veniam, quis nostrum exercitationem ullam corporis suscipit
					laboriosam, nisi ut.</p>

				<hr>
				<h4>
					<a href="http://www.bootply.com/Gygh9swISB">Edit on Bootply</a>
				</h4>
				<hr>

			</div>
			<!--/right-->
		</div>
		<!--/row-->
	</div>
	<!--/container-->




	<script type='text/javascript'
		src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>


	<script type='text/javascript'
		src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>








	<script type='text/javascript'>
		$(document)
				.ready(
						function() {

							/* activate sidebar */
							$('#sidebar').affix({
								offset : {
									top : 235
								}
							});

							/* activate scrollspy menu */
							var $body = $(document.body);
							var navHeight = $('.navbar').outerHeight(true) + 10;

							$body.scrollspy({
								target : '#leftCol',
								offset : navHeight
							});

							/* smooth scrolling sections */
							$('a[href*=#]:not([href=#])')
									.click(
											function() {
												if (location.pathname.replace(
														/^\//, '') == this.pathname
														.replace(/^\//, '')
														&& location.hostname == this.hostname) {
													var target = $(this.hash);
													target = target.length ? target
															: $('[name='
																	+ this.hash
																			.slice(1)
																	+ ']');
													if (target.length) {
														$('html,body')
																.animate(
																		{
																			scrollTop : target
																					.offset().top - 50
																		}, 1000);
														return false;
													}
												}
											});

						});
	</script>

	<style>
.ad {
	position: absolute;
	bottom: 70px;
	right: 48px;
	z-index: 992;
	background-color: #f3f3f3;
	position: fixed;
	width: 155px;
	padding: 1px;
}

.ad-btn-hide {
	position: absolute;
	top: -10px;
	left: -12px;
	background: #fefefe;
	background: rgba(240, 240, 240, 0.9);
	border: 0;
	border-radius: 26px;
	cursor: pointer;
	padding: 2px;
	height: 25px;
	width: 25px;
	font-size: 14px;
	vertical-align: top;
	outline: 0;
}

.carbon-img {
	float: left;
	padding: 10px;
}

.carbon-text {
	color: #888;
	display: inline-block;
	font-family: Verdana;
	font-size: 11px;
	font-weight: 400;
	height: 60px;
	margin-left: 9px;
	width: 142px;
	padding-top: 10px;
}

.carbon-text:hover {
	color: #666;
}

.carbon-poweredby {
	color: #6A6A6A;
	float: left;
	font-family: Verdana;
	font-size: 11px;
	font-weight: 400;
	margin-left: 10px;
	margin-top: 13px;
	text-align: center;
}
</style>
	<div class="ad collapse in">
		<button class="ad-btn-hide" data-toggle="collapse" data-target=".ad">&times;</button>
	</div>

</body>
</html>