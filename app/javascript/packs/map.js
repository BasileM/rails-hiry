// app/javascript/packs/map.js
import GMaps from 'gmaps/gmaps.js';
import { onPlaceChanged } from '../components/autocomplete';




function update_map (map_id) {
  const mapElement = document.getElementById(map_id);
  console.log(mapElement);
  if (mapElement) { // don't try to build a map if there's no div#map to inject in
    console.log(`#${map_id}`);
    const map = new GMaps({ el: `#${map_id}`, lat: 0, lng: 0 });
    console.log(map);
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

//onPlaceChanged();

export { update_map };
