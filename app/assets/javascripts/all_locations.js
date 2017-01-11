function placeMakers(dataFromServer, markers) {
  markers = handler.addMarkers(dataFromServer);
  handler.bounds.extendWith(markers);
  handler.fitMapToBounds();
}

function showLocations(dataFromServer) {
  if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
      // Add our position to the collection of markers
      // dataFromServer[dataFromServer.length] = {
      //   lat: position.coords.latitude,
      //   lng: position.coords.longitude,
      //   infowindow: "You!"
      // };
      placeMakers(dataFromServer, markers);
    });
  } else {
      alert("Geolocation is not available.");
      placeMakers(dataFromServer, markers)
  }
}

function createGmaps(dataFromServer) {
  handler = Gmaps.build('Google');
  handler.buildMap({
      provider: {},
      internal: {id: 'all_locations'}
    },
    function() {
      showLocations(dataFromServer);
      markers = handler.addMarkers(dataFromServer);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
    }
  );
};

function loadAndCreateGmaps() {
  // Only load map data if we have a map on the page
  if ($('#all_locations').length > 0) {

    $.ajax({
      dataType: 'json',
      url: '/apartments/map_all_locations',
      method: 'GET',
      success: function(dataFromServer) {
        createGmaps(dataFromServer);
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert("Getting map data failed: " + errorThrown);
      }
    });
  }
};

// Create the map when the page loads the first time
$(document).on('ready', loadAndCreateGmaps);
//Create the map when the contents is loaded using turbolinks
// To be 'turbolinks:load' in Rails 5
$(document).on('page:load', loadAndCreateGmaps);
// To be 'turbolinks:load' in Rails 4
$(document).on('turbolinks:load',loadAndCreateGmaps);
