$(function(){
	//별점 로직
	var parentIndex;
	var thisIndex;
	$(".nanum-check-list-star>ul>li").mouseover(function(){
		$(this).parent('ul').siblings().find('li').css('color','#eaeaea');
		parentIndex = $(this).parent().index()+1;
		thisIndex = $(this).index()+1;
		
		console.log("큰 별 : "+parentIndex);
		console.log("작은 별 : "+thisIndex);
		for(var i = 0; i < parentIndex ; i++){  //5
			for(var j = 0; j < thisIndex; j++ ){ //2
				console.log(parentIndex + "/" + thisIndex);
				$(this).parent('ul').parent().find('ul').eq(i).find('li').css('color','#19E0DD');
				//$(this).parent('ul').eq(i).find('li').eq(j-1).css('color','#19E0DD');
			}
		}
		
		var score;
		if(thisIndex==2){
			score = 0;
		}else if (thisIndex==1){
			score = 0.5;
		}
		$(this).parent().parent().siblings('input#star').val(parentIndex-score);
	});
	
	
	
	/*$(".nanum-check-list-star>ul>li").click(function(){
		alert(parentIndex + "/" + thisIndex);
	});*/
	
	
	
	/*펼치기 접기*/
	$(".nanum-check-inner-btn>button").click(function(){
		if (!$(this).parent('div').siblings('h5').find('div').hasClass('nanum-check-fade')) {
			$(this).parent('div').siblings('h5').find('div').css({'height':'auto'})
			$(this).html('접어두기');
			$(this).parent('div').siblings('h5').find('div').addClass('nanum-check-fade');
		}else{
			$(this).parent('div').siblings('h5').find('div').css({'height':'0'})
			$(this).html('내용보기');
			$(this).parent('div').siblings('h5').find('div').removeClass('nanum-check-fade');
		}
	});
});