$(function() {
	var wedo = 37.4021194;
	var kyoungdo = 127.10701819999997;

	if ($('#wedo').val() != null) {
		wedo = $('#wedo').val();
	}
	if ($('#kyoungdo').val() != null) {
		kyoungdo = $('#kyoungdo').val();
	}

	var map, places, iw;
	var markers = [];
	var autocomplete;

	// 현재 위치에서 위도/경도 뽑기
	function getLocation_cord() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(successCallback,
					errorCallback);
		} else {
			$("#map").html("Geolocation is not supported by this browser.");
			alert('단말기에서 현재 위치를 사용할 수 없습니다.');
		}
	}

	function successCallback(wp_position) {
		var myLatlng = new google.maps.LatLng(wp_position.coords.latitude,
				wp_position.coords.longitude);
		var myOptions = {
			zoom : 14,
			center : myLatlng,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		map = new google.maps.Map(document.getElementById('map_canvas'),
				myOptions);
		places = new google.maps.places.PlacesService(map);
		google.maps.event.addListener(map, 'tilesloaded', tilesLoaded);
		autocomplete = new google.maps.places.Autocomplete(document
				.getElementById('autocomplete'));
		google.maps.event.addListener(autocomplete, 'place_changed',
				function() {
					showSelectedPlace();
				});
	}

	function errorCallback(wp_position_error) {
		var myLatlng = new google.maps.LatLng(wedo, kyoungdo);
		var myOptions = {
			zoom : 14,
			center : myLatlng,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		map = new google.maps.Map(document.getElementById('map_canvas'),
				myOptions);
		places = new google.maps.places.PlacesService(map);
		google.maps.event.addListener(map, 'tilesloaded', tilesLoaded);
		autocomplete = new google.maps.places.Autocomplete(document
				.getElementById('autocomplete'));
		google.maps.event.addListener(autocomplete, 'place_changed',
				function() {
					showSelectedPlace();
				});
	}

	function tilesLoaded() {
		google.maps.event.clearListeners(map, 'tilesloaded');
		google.maps.event.addListener(map, 'zoom_changed', search);
		google.maps.event.addListener(map, 'dragend', search);
		search();
	}

	function showSelectedPlace() {
		clearResults();
		clearMarkers();
		var place = autocomplete.getPlace();
		$('#wk').val(place.geometry.location);
		//alert($('#wk').val());
		map.panTo(place.geometry.location);
		markers[0] = new google.maps.Marker({
			position : place.geometry.location,
			map : map
		});
		iw = new google.maps.InfoWindow({
			content : getIWContent(place)
		});
		iw.open(map, markers[0]);
	}
	
	if($('#wk').val() == ""||$('#wk').val() == null){
		$('#wk').val("("+wedo+", "+kyoungdo+")");
	}

	function search() {
		var type;
		// alert(document.controls.type.length);
		// for (var i = 0; i < document.controls.type.length; i++) {
		// if (document.controls.type[i].checked) {
		// type = document.controls.type[i].value;
		// }
		// }
		autocomplete.setBounds(map.getBounds());
		var search = {
			bounds : map.getBounds()
		};
		if (type != 'establishment') {
			search.types = [ type ];
		}
		places.search(search, function(results, status) {
			if (status == google.maps.places.PlacesServiceStatus.OK) {
				clearResults();
				clearMarkers();
				for (var i = 0; i < results.length; i++) {
					markers[i] = new google.maps.Marker({
						position : results[i].geometry.location,
						animation : google.maps.Animation.DROP
					});
					google.maps.event.addListener(markers[i], 'click',
							getDetails(results[i], i));
					// setTimeout(dropMarker(i), i * 100);
					// addResult(results[i], i);
				}
			}
		});
	}

	function clearMarkers() {
		for (var i = 0; i < markers.length; i++) {
			if (markers[i]) {
				markers[i].setMap(null);
				markers[i] == null;
			}
		}
	}

	/*
	 * function dropMarker(i) { return function () { markers[i].setMap(map); } }
	 */

	/*
	 * function addResult(result, i) { var results =
	 * document.getElementById('results'); var tr =
	 * document.createElement('tr'); tr.style.backgroundColor = (i % 2 == 0 ?
	 * '#F0F0F0' : '#FFFFFF'); tr.onclick = function () {
	 * google.maps.event.trigger(markers[i], 'click'); }; var iconTd =
	 * document.createElement('td'); var nameTd = document.createElement('td');
	 * var icon = document.createElement('img'); icon.src =
	 * result.icon.replace('http:', ''); icon.setAttribute('class',
	 * 'placeIcon'); var name = document.createTextNode(result.name);
	 * iconTd.appendChild(icon); nameTd.appendChild(name);
	 * tr.appendChild(iconTd); tr.appendChild(nameTd); results.appendChild(tr); }
	 */

	function clearResults() {
		var results = document.getElementById('results');
		while (results.childNodes[0]) {
			results.removeChild(results.childNodes[0]);
		}
	}

	function getDetails(result, i) {
		return function() {
			places.getDetails({
				reference : result.reference
			}, showInfoWindow(i));
		}
	}

	function showInfoWindow(i) {
		return function(place, status) {
			if (iw) {
				iw.close();
				iw = null;
			}
			if (status == google.maps.places.PlacesServiceStatus.OK) {
				iw = new google.maps.InfoWindow({
					content : getIWContent(place)
				});
				iw.open(map, markers[i]);
			}
		}
	}

	function getIWContent(place) {
		var content = '<table style="border:0"><tr><td style="border:0;">';
		content += '<img class="placeIcon" src="' + place.icon + '"></td>';
		content += '<td style="border:0;"><b><a href="' + place.url + '">'
				+ place.name + '</a></b>';
		content += '</td></tr></table>';
		return content;
	}
	google.maps.event.addDomListener(window, 'load', getLocation_cord);
});