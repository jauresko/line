import "bootstrap";
import { initAutocomplete } from "../plugins/init_autocomplete";
import '../plugins/flatpickr'
import {previewImageOnFileSelect} from "../plugins/photo_preview"
import "../plugins/scroll";
import {animationJs} from "../plugins/animation_card";
import "../plugins/modal_trigger";


initAutocomplete();
previewImageOnFileSelect();
animationJs();

