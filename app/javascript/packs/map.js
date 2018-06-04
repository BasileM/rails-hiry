// app/javascript/packs/map.js
import GMaps from 'gmaps/gmaps.js';
import { onPlaceChanged } from '../components/autocomplete';

function update_map (map_id) {
  const mapElement = document.getElementById(map_id);
  if (mapElement) { // Don't try to build a map if there's no div#map to inject in
    const map = new GMaps({
      el: `#${map_id}`,
      lat: 0,
      lng: 0,
      disableDefaultUI: true, // Removes Google Map default UI
      draggable: false, // Prevents the map from being dragged
    });
    const markers = JSON.parse(mapElement.dataset.markers);
    map.addMarkers(markers);
    if (markers.length === 0) {
      map.setZoom(2);
    } else if (markers.length === 1) {
      map.setCenter(markers[0].lat, markers[0].lng);
      map.setZoom(14);
    } else {
      map.fitLatLngBounds(markers);
    }
  }
}

update_map("map");

export { update_map };
