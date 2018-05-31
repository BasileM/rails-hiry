// app/javascript/components/housing.js
function hideFloorFieldIfHousingTypeIsHouse() {
  const typeField = document.getElementById('housing_type_of_housing');
  const floorField = document.querySelector('.housing_floor');
  if (typeField) {
    typeField.addEventListener('input', () => {
      if (typeField.value === "Maison") {
        floorField.classList.add('d-none');
      } else {
        floorField.classList.remove('d-none');
      }
    });
  }
}

export { hideFloorFieldIfHousingTypeIsHouse };
