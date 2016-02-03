var geolocator = function(){
  if (window.navigator.geolocation) {
    var error, success;
    success = function(position) {
      var lat, lng, data;
      lat = position.coords.latitude;
      lng = position.coords.longitude;
      data = {lat: lat, lng: lng};
      $.ajax({
        url:"/update_profile",
        method: "PUT",
        data: data
      })
      .done(function(response){
        initJTinder();
      })
      .fail(function(xhr, error, unknown){
        console.error(error);
      });
    };
    error = function(errorMessage) {
      // _enter_zipcode partial goes inside html
      $('.modal-body').html(errorMessage);
      $('#feedModal').modal('show');
    };
    window.navigator.geolocation.getCurrentPosition(success, error, {
      maximumAge: Infinity,
      timeout: 5000
    });
  }
};
