import "bootstrap";
import "../plugins/flatpickr"
import { hideFloorFieldIfHousingTypeIsHouse } from '../components/housing';
import { update_map } from '../packs/map';

flatpickr(".datepicker", {

});

hideFloorFieldIfHousingTypeIsHouse();


if (document.getElementById("index_page")) {
 document.addEventListener("DOMContentLoaded", () => {
  const mini_maps = document.querySelectorAll(".mini_map");
    mini_maps.forEach((mini_map) => {
      update_map(`${mini_map.id}`);
    });
  });
}
