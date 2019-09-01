import places from 'places.js';

const initAutocomplete = () => {
  const addressInput1 = document.getElementById('travel_arrival_place');
  if (addressInput1) {
    places({ container: addressInput1 });
  };
  const addressInput2 = document.getElementById('travel_departure_place');
  if (addressInput2) {
    places({ container: addressInput2 });
  };
  const addressInput3 = document.getElementById('travel_pick_up_place');
  if (addressInput3) {
    places({ container: addressInput3 });
  };
  const addressInput4 = document.getElementById('to');
  if (addressInput4) {
    places({ container: addressInput4 });
  };
  const addressInput5 = document.getElementById('from');
  if (addressInput5) {
    places({ container: addressInput5 });
  };
};

export { initAutocomplete };
