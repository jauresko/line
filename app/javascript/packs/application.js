import "bootstrap";
import '../plugins/send_or_buy_display'
import { initAutocomplete } from "../plugins/init_autocomplete";
import '../plugins/flatpickr'
import {previewImageOnFileSelect} from "../plugins/photo_preview"
import {scrollLastMessageIntoView} from "../plugins/scroll"

initAutocomplete();
previewImageOnFileSelect();

