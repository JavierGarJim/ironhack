
if ("geolocation" in navigator) {
	getUserLocation();
}
else {

}

function getUserLocation() {
	console.log('Getting location...');

	navigator.geolocation.getCurrentPosition(onLocation, onError, options);
}

function onLocation(position) {
	console.log("SUCCESS!!");
	console.log(position);

	$(".js-lat-value").text(position.coords.latitude);
	$(".js-lng-value").text(position.coords.longitude);

	displayMap(position.coords.latitude, position.coords.longitude);
}

function onError(error) {
	console.log("ERROR", error);
}

var options = {
  enableHighAccuracy: true 
};

function displayMap(lat, lng) {
	var urlRoot = "https://maps.googleapis.com/maps/api/staticmap?center=";
  	var urlParams = "&zoom=15&size=400x300";
  	var url = urlRoot + lat + "," + lng + urlParams;
  	var map = document.getElementById('map');
  
  	$(".js-map").text("");

  	map.setAttribute("src", url);
  
  	console.log(url);
}