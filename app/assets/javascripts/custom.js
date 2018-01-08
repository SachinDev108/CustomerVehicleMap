$(document).on("click", ".show-detail", function(e) {
	$(this).next('tr').toggle();
});

var componentForm = {
  administrative_area_level_1: 'short_name',
  locality: 'long_name',
  city: 'long_name',
  postal_code: 'short_name'
};

$(function() {
  $("#geo-input")
    .geocomplete()
    .bind("geocode:result", function(event, result){
      $('#customer_lat').val(result.geometry.location.lat())
      $('#customer_lng').val(result.geometry.location.lng())
      for (var i = 0; i < result.address_components.length; i++) {
        var addressType = result.address_components[i].types[0];
        if (componentForm[addressType]) {
          var val = result.address_components[i][componentForm[addressType]];
          document.getElementById(addressType).value = val;
        }
      }
    });
}); 
