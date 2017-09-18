var LOCATION = {};

$.extend(LOCATION, {
  googlePlaces: {
    initAutocomplete: function(bounds) {
      bounds = bounds || null;

      var input = document.getElementById('activity_location'),
        searchBox = new google.maps.places.SearchBox(input, {
        bounds: bounds });

      searchBox.addListener('places_changed', function() {
        var places = searchBox.getPlaces();

        if (places.length == 0) {
          return;
        } else {
          document.getElementById("activity_latitude").value = places[0].geometry.location.lat();
          document.getElementById("activity_longitude").value = places[0].geometry.location.lng();
          // TODO: Reset values to zero if entering something not found after entering something found
        }
      });
    }
  },

  geolocate: {
    init: function(searchBox) {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
          var geolocation = {
            lat: position.coords.latitude,
            lng: position.coords.longitude
          };
          var circle = new google.maps.Circle({
            center: geolocation,
            radius: position.coords.accuracy
          });

          bounds = circle.getBounds();
          LOCATION.googlePlaces.initAutocomplete(bounds);
        });
      } else {
        LOCATION.googlePlaces.initAutocomplete(bounds);
      }
    }
  }
});
