$(function(){
	//滚动条滚动时导航栏跟随
		$(window).scroll(function(){
			if($(document).scrollTop() > $(".header").height()){	
				$(".header").css({
					"position":"fixed",
					"top":"0px"
				});
			}
			if($(document).scrollTop() == 0){
				$(".header").css("position","static");
			}
		})

		$(".backTop").click(function(){
			var speed = 300;
			$("body").animate({scrollTop:0},speed);
		})

})