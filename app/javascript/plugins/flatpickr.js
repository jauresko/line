import flatpickr from "flatpickr"
import "flatpickr/dist/themes/airbnb.css" // A path to the theme CSS
// import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

// flatpickr("#travel_departure_date", {
//   altInput: true,
//   plugins: [new rangePlugin({ input: "#travel_arrival_date" })]
// })
flatpickr(".datepickr", {
  altInput: true
})
