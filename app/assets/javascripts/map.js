function initialize() {
  var map = new google.maps.LatLng(<%= @lat %>,<%= @lng %>);
  var panoramaOptions = {
    position: map,
    pov: {
      heading: 90,
      pitch: 0
    },
    zoom: 0
  };
  var myPano = new google.maps.StreetViewPanorama(
      document.getElementById('map-canvas'),
      panoramaOptions);
  myPano.setVisible(true);
}

google.maps.event.addDomListener(window, 'load', initialize);