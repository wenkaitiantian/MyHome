$(function(){
	$(".left-menu ul li").click(function(){
		$(".right-menu div").show();
		$(this).css("border-left","1px solid rgb(12,12,12)");
		$(this).prevAll().css("border","none");
		$(this).nextAll().css("border","none");
		$(".right-menu div").html($(this).html());
		if($(this).html()=="我的发布"){
			$(".right-menu iframe").prop("src","user_getPersonal.action");
		}else if($(this).html()=="我的收藏"){
			$(".right-menu iframe").prop("src","collect_getCollectMessage.action");
		}else if($(this).html()=="我的账户"){
			$(".right-menu iframe").prop("src","account.jsp");
		}else{
			$(".right-menu iframe").prop("src","user_getPersonal.action");
		}
	})
})