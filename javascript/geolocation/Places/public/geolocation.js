var map;

if ("geolocation" in navigator) {
  navigator.geolocation.getCurrentPosition(onLocation, onError);
}

function onLocation(position) {
  // We can't just directly feed the position into our google map
  // The objects are formatted differently, google maps is looking for
  // an object with "lat" and "lng" keys.
  var myPosition = {
    lat: position.coords.latitude,
    lng: position.coords.longitude
  };

  createMap(myPosition);
  setupAutocomplete();
}

function onError(err) {
  console.log("What are you using, IE 7??", err);
}

function createMap(position) {
  map = new google.maps.Map($('#map')[0], {
    center: position,
    zoom: 17
  });

  for (var i = 0; i < localStorage.length; i++) {
    var place = localStorage.getObj(i);

    createMarker(place);
  }
}

function createMarker(place) {
  var marker = new google.maps.Marker({
    position: place.geometry.location,
    map: map
  });
  var infowindow = new google.maps.InfoWindow({
    content: place.formatted_address
  });
  marker.addListener('click', function() {
    infowindow.open(map, marker);
  });
}

function setupAutocomplete() {
  var input = $('#get-places')[0];
  var autocomplete = new google.maps.places.Autocomplete(input);
  autocomplete.addListener('place_changed', function() {
    var place = autocomplete.getPlace();
    if (place.geometry.location) {
      map.setCenter(place.geometry.location);
      map.setZoom(17);
      
      localStorage.setObj(localStorage.length, place);

      createMarker(place);
    } else {
      alert("The place has no location...?")
    }
  });
}

Storage.prototype.setObj = function(key, obj) {
    return this.setItem(key, JSON.stringify(obj));
}

Storage.prototype.getObj = function(key) {
    return JSON.parse(this.getItem(key));
}
