import flatpickr from "flatpickr"
import "flatpickr/dist/themes/material_blue.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"
import moment from "moment"

window.moment = moment;

flatpickr("#rental_start_date", {
  altInput: true,
  onChange: function(selectedDates, startDate, instance) {
    let duration;

    // calcule si c'est sur 1 ou 3 ans
    const furnished = document.getElementById("rental_furnished").value;

    if (furnished == "Meublé") {
      duration = 1;
    } else {
      duration = 3;
    }

    // calcule le jour de l'année suivante
    const endDate = moment(startDate).add(duration, "years").format('YYYY-MM-DD');

    // met a jour le end date
    document.querySelector("#rental_end_date")._flatpickr.setDate(endDate);
  },
});

flatpickr("#rental_end_date", {
});


