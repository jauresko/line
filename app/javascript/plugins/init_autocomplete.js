import places from 'places.js';

const initAutocomplete = () => {
  const addressInput1 = document.getElementById('travel_arrival_place');
  if (addressInput1) {
    places({ container: addressInput1 });
  };
  const addressInput2 = document.getElementById('travel_pick_up_place');
  if (addressInput1) {
    places({ container: addressInput2 });
  };
};

export { initAutocomplete };
