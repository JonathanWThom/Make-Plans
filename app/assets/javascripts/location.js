var LOCATION = {};

$.extend(LOCATION, {
  getLocation: {
    user_id: null,

    init: function(user_id) {
      this.user_id = user_id;
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(this.setPosition);
      }
    },

    setPosition: function(position) {
      var user_id = LOCATION.getLocation.user_id;
      var latitude = position.coords.latitude,
        longitude = position.coords.longitude;
      $.post(`/users/${user_id}/set_user_location`, { location: { latitude: latitude, longitude: longitude } });
    }
  },

  googlePlaces: {
    initAutocomplete: function(bounds) {
      bounds = bounds || null;
      console.log(bounds);
      var input = document.getElementById('activity_location'),
        searchBox = new google.maps.places.SearchBox(input, {
        bounds: bounds });

      searchBox.addListener('places_changed', function() {
        var places = searchBox.getPlaces();

        if (places.length == 0) {
          return;
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
