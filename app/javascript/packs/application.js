import "bootstrap";
import { initAutocomplete } from "../plugins/init_autocomplete";
import '../plugins/flatpickr'
import {previewImageOnFileSelect} from "../plugins/photo_preview"
import "../plugins/scroll";
import {navSlide} from "../plugins/navbar";


initAutocomplete();
previewImageOnFileSelect();
navSlide();
