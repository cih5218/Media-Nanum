$(function(){
	var directionsDisplay;
	var directionsService = new google.maps.DirectionsService();
	var map;
	var wedo = 37.4021194;
	var kyoungdo = 127.10701819999997;

	if ($('#wedo').val() != null) {
		wedo = $('#wedo').val();
		//alert(wedo);
	}
	if ($('#kyoungdo').val() != null) {
		kyoungdo = $('#kyoungdo').val();
		//alert(kyoungdo);
	}

	function initialize() {
	  directionsDisplay = new google.maps.DirectionsRenderer();
	  var korea = new google.maps.LatLng(wedo, kyoungdo);
	  var mapOptions = {
		zoom:14,
		mapTypeId: google.maps.MapTypeId.ROADMAP,
		center: korea
	  }
	  map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
	  directionsDisplay.setMap(map);
	  calcRoute();
	}

	function calcRoute() {
	  var start = $('#mylocation_name').val();
	  //var start = "영통구";
	  var end = $('#location_name').val();
	  //var end = "권선구";
	  var mode = "TRANSIT";

	  var request = {
		  origin:start,
		  destination:end,
		  travelMode: eval("google.maps.DirectionsTravelMode."+mode)
	  };
	  directionsService.route(request, function(response, status) {
		//alert(status);  // 확인용 Alert..미사용시 삭제
		if (status == google.maps.DirectionsStatus.OK) {
			directionsDisplay.setDirections(response);
		}
	  });
	}

	google.maps.event.addDomListener(window, 'load', initialize);
});