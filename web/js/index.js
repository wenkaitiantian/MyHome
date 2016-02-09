	var carousel = document.getElementById("carousel-image");
	
	function animate(attr){
	
	}

	window.onload = animate(carousel);

	$(function(){
		//鼠标放置在房屋信息处的特效
		var $houseinf = $(".houseInf").children();
		$houseinf.mouseover(function(){
			$(this).css("border","2px solid #c00");
		})
		$houseinf.mouseout(function(){
			$(this).css("border","2px solid #fff");
		})

	})