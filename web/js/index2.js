$(function(){

	$(".tabselect").click(function(){
		$(this).nextAll().removeClass("highlight");
		$(this).prevAll().removeClass("highlight");
		$(this).addClass("highlight");
		if($(this).html()=="房屋出租"){
			$(".rentblock").show();
			$(".rentblock").nextAll().hide();
		}else if($(this).html()=="房屋出售"){
			$(".saleblock").show();
			$(".saleblock").prev().hide();
			$(".saleblock").nextAll().hide();
		}else if($(this).html()=="房屋求租"){
			$(".rentneedblock").show();
			$(".rentneedblock").prevAll().hide();
			$(".rentneedblock").next().hide();
		}
	})

	$(".rank").click(function(){
		$(this).prevAll().removeClass("hlight");
		$(this).nextAll().removeClass("hlight");
		$(this).addClass("hlight");
	})
})