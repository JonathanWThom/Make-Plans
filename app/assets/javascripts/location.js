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
    initAutocomplete: function() {
      var input = document.getElementById('activity_location'),
        bellingham = new google.maps.LatLng(48.7519, 122.4787),
        other = new google.maps.LatLng(48.7419, 122.4787),
        bounds = new google.maps.LatLngBounds(bellingham, other),
        searchBox = new google.maps.places.SearchBox(input, {
          bounds: bounds });
      /// set bounds to user location
      searchBox.addListener('places_changed', function() {
        var places = searchBox.getPlaces();

        if (places.length == 0) {
          return;
        }
      });
    }
  }
});
