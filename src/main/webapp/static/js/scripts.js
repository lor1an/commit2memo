var data = {};
$(document).ready(function(){
	$.ajax({url: '/highlighthor/allPages',
		  method: "GET",
		  success: function(response) {
			  data = JSON.parse(response);
			  data = _.uniq(data, function(el) {
				  return el._source.url;
			  });
			  var options = $("#pages");
			  $.each(data, function() {
			      options.append($("<option />").val(this._source.url).text(this._source.title));
			  });
			  $("#choosePage").removeAttr("disabled");
			  $("#choosePage").on("click", onChoosePage);
			  
			  $("#selectPage").removeAttr("disabled");
			  $("#selectPage").on("click", onSelectPage);
	}});
});

var onSelectPage = function(event) {
	var url = $("#pages").val();
	var src = $("#elapsedTimeOnPage").attr("src");
	src = src.replace(/url:%22([^']*)%22/, 'url:%22' + encodeURIComponent(url) + '%22');
	$("#elapsedTimeOnPage").attr("src", src);
	
	src = $("#clicksOnPage").attr("src");
	src = src.replace(/url:%22([^']*)%22/, 'url:%22' + encodeURIComponent(url) + '%22');
	$("#clicksOnPage").attr("src", src);
};

var onChoosePage = function(event) {
	var url = $("#pages").val();
	var imageUrl = _.find(data, function(el) { return el._source.url === url; });
	var canvas = $("#heatmap");
	var img = new Image();
	img.onload = function() {
	  canvas.css('background-image', 'url(' + imageUrl._source.image + ')');
	  canvas.css('width', this.width);
	  canvas.css('height', this.height);
	  prepareForHeatmap(url);
	}
	img.src = imageUrl._source.image;
};

var prepareForHeatmap = function(url) {
	var canvas = document.getElementsByTagName('canvas')[0];
    var heatmap = createWebGLHeatmap({canvas: canvas, intensityToAlpha:true});

    document.body.appendChild(heatmap.canvas);

    var paintAtCoord = function(x, y){
        var count = 0;
        while(count < 200){
            var xoff = Math.random()*2-1;
            var yoff = Math.random()*2-1;
            var l = xoff*xoff + yoff*yoff;
            if(l > 1){
                continue;
            }
            var ls = Math.sqrt(l);
            xoff/=ls; yoff/=ls;
            xoff*=1-l; yoff*=1-l;
            count += 1;
            heatmap.addPoint(x+xoff*50, y+yoff*50, 30, 2/300);
        }
    }
    
    $.ajax({url: '/highlighthor/allPoints',
		  method: "POST",
		  data: url, 
		  dataType: "text",
		  success: function(response) {
			  var points = JSON.parse(response);
			  _.each(points.hits.hits, function(el) {
		            _.each(el._source.points, function (point) {
		                paintAtCoord(point.x, point.y);
		            });
		      });
		  },
		  error: function(response) {
			  console.log(response);
		  }
    });

    var raf = window.requestAnimationFrame || window.mozRequestAnimationFrame ||
                             window.webkitRequestAnimationFrame || window.msRequestAnimationFrame;

    var update = function(){
        heatmap.update(); // adds the buffered points
        heatmap.display(); // adds the buffered points
        raf(update);
    }
    raf(update);
	
};