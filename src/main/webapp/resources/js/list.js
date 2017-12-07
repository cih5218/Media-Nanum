var latitude="";
var longitude="";
	
function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else {
    	alert('단말기에서 현재 위치를 사용할 수 없습니다.');
    }
}

function showPosition(position) {
	latitude = position.coords.latitude;
	longitude =  position.coords.longitude;   
}

//title 가져오기
$(function(){
	getLocation();
    $(".head-category-white>ul>li>a").click(function(){
          $(".head-category-white>ul>li>a").removeClass('container-list-selected');
          $(this).addClass('container-list-selected');
          var selectTitle = $(".container-list-selected").attr('title');
          $(".head-category-white>ul>li>a").attr('href','board_list.nn?title='+selectTitle);
    });
   });

//카테고리 클릭
$(function() {
   $('.category-top>ul>li').click(function(){
      $(".category-top>ul>li").removeClass('category-top-selected');
        $(this).addClass('category-top-selected');
        var category = $(".category-top-selected").attr('value');
        var selectTitle = $(".text-center>h1:first").attr('title');
        var selectsearch = $(".text-center>h1:nth-child(2)").attr('title');
        var selectareacity = $(".text-center>h1:nth-child(3)").attr('title'); //도시 이름
        var selectareagoo = $(".text-center>h1:last").attr('title'); // 지역 이름
        if(category == "street"){        	
            $(".category-top>ul>li>a").attr('href','board_list.nn?title='+selectTitle+'&category='+category+'&search='+selectsearch+'&cityName='+selectareacity+'&gooName='+selectareagoo+'&latitude='+latitude+'&longitude='+longitude+'&loc=true');
        }else{
            $(".category-top>ul>li>a").attr('href','board_list.nn?title='+selectTitle+'&category='+category+'&search='+selectsearch+'&cityName='+selectareacity+'&gooName='+selectareagoo+'&latitude='+latitude+'&longitude='+longitude);
        }
   });
});

//지역 검색 하기
$(function() {
   var cityName;
   var gooName;
   var selectTitle = $(".text-center>h1:first").attr('title');
   var category = $(".category-top-selected").attr('value');
   $('#city-name>li>a').click(function(){
      $("#city-name>li>a").removeClass('city-top-selected');
        $(this).addClass('city-top-selected');
        cityName = $(".city-top-selected").text();
   });
    $('.search-goo>li>a').click(function(){
        $(".search-goo>li>a").removeClass('goo-top-selected');
        $(this).addClass('goo-top-selected');
        gooName = $(".goo-top-selected").text();
   });
    $('#checkpage>a').click(function(){
       $("#checkpage>a").attr('href','board_list.nn?title='+selectTitle+"&category="+category+"&cityName="+cityName+"&gooName="+gooName+'&latitude='+latitude+'&longitude='+longitude);
    });
    $('.btn-category').click(function(){
        var tagSearch = $(this).attr('title');
        $('.btn-category').attr('href','board_list.nn?search='+tagSearch+'&latitude='+latitude+'&longitude='+longitude);
    });
    
    
    
    
    
});