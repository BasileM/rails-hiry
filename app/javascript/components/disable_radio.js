// If man selected
const radioButtonMonsieur = document.getElementById('renter_gender_monsieur');
if (radioButtonMonsieur) {
  radioButtonMonsieur.addEventListener('click', (event) => {
    const labelMadame = document.querySelector('#renter_gender_madame').nextSibling
    labelMadame.classList.add('text-gray');
  });
}

// If woman selected
const radioButtonMadame = document.getElementById('renter_gender_madame');
if (radioButtonMadame) {
  radioButtonMadame.addEventListener('click', (event) => {
    const labelMonsieur = document.querySelector('#renter_gender_monsieur').nextSibling
    labelMonsieur.classList.add('text-gray');
  });
}

// If married is selected
const radioButtonMaried = document.getElementById('renter_marital_status_marié');
if (radioButtonMaried) {
  radioButtonMaried.addEventListener('click', (event) => {
    const labelSingle = document.querySelector('#renter_marital_status_célibataire').nextSibling
    const labelDivorced = document.querySelector('#renter_marital_status_divorcé').nextSibling
    labelSingle.classList.add('text-gray');
    labelDivorced.classList.add('text-gray');
  });
}

// If single is selected
const radioButtonSingle = document.getElementById('renter_marital_status_célibataire');
if (radioButtonSingle) {
  radioButtonSingle.addEventListener('click', (event) => {
    const labelMaried = document.querySelector('#renter_marital_status_marié').nextSibling
    const labelDivorced = document.querySelector('#renter_marital_status_divorcé').nextSibling
    labelMaried.classList.add('text-gray');
    labelDivorced.classList.add('text-gray');
  });
}

// If divorced is selected
const radioButtonDivorced = document.getElementById('renter_marital_status_divorcé');
if (radioButtonDivorced) {
  radioButtonDivorced.addEventListener('click', (event) => {
    const labelSingle = document.querySelector('#renter_marital_status_célibataire').nextSibling
    const labelMaried = document.querySelector('#renter_marital_status_marié').nextSibling
    labelSingle.classList.add('text-gray');
    labelMaried.classList.add('text-gray');
  });
}
