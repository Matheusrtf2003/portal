// Definindo a função initMap globalmente
window.initMap = function() {
    const mapOptions = {
      center: { lat: -23.55052, lng: -46.633308 },
      zoom: 10,
    };
    const mapElement = document.getElementById('map');
    const map = new google.maps.Map(mapElement, mapOptions);
  
    // Aqui você pode adicionar marcadores ao mapa
  };
  