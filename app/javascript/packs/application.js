import "bootstrap";
import "../plugins/flatpickr"
import { hideFloorFieldIfHousingTypeIsHouse } from '../components/housing';

flatpickr(".datepicker", {

});

hideFloorFieldIfHousingTypeIsHouse();
