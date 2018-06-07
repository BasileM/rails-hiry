import "bootstrap";
import "../plugins/flatpickr" ;
import { hideFloorFieldIfHousingTypeIsHouse } from '../components/housing';
import { update_map } from '../packs/map';
import '../components/photo_input';
import '../components/flash_clear';
import '../components/disable_radio';

hideFloorFieldIfHousingTypeIsHouse();

if (document.getElementById("index_page")) {
 document.addEventListener("DOMContentLoaded", () => {
  const mini_maps = document.querySelectorAll(".mini_map");
    mini_maps.forEach((map) => {
      update_map(`${map.id}`);
    });
  });
}
