import places from 'places.js';

const initAutocomplete = () => {
  const addressInput1 = document.getElementById('travel1_address');
  if (addressInput1) {
    places({ container: addressInput1 });
  }
  const addressInput2 = document.getElementById('travel2_address');
  if (addressInput2) {
    places({ container: addressInput2 });
  }
};

export { initAutocomplete };
