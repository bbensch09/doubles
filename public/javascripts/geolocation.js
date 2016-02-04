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
        checkForMore();
        initJTinder();
      })
      .fail(function(xhr, error, unknown){
        // console.error(error);
      });
    };
    error = function(errorMessage) {
      // _enter_zipcode partial goes inside html
      // make ajax call to get zipcode partial
      $.ajax({
        url: '/profile/add-zipcode',
        type: 'GET',
        success: function(data) {
          if (data != "true") {
            $('.modal-content').html(data);
            $('#feedModal').modal({
                keyboard: false,
                backdrop: 'static'
              });
            $('#feedModal').modal('show');
          }
          else {
            checkForMore();
            initJTinder();
          }
        },
        error: function(data) {
          console.error(data);
        },
      });
    };
    window.navigator.geolocation.getCurrentPosition(success, error, {
      maximumAge: Infinity,
      timeout: 5000
    });
  }
};
