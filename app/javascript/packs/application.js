import "bootstrap";
import "jquery";
import flatpickr from "flatpickr";
import { moveToSelected } from 'plugins/swipable.js';
import { progress } from "../plugins/progress_bar";
import { showBottomNav } from 'packs/show_bottom_nav.js';
import { flipPackageInfo } from 'packs/flip_package_info.js';
import { navOnScroll } from 'packs/pg_top_nav.js';


navOnScroll();

progress();

// moveToSelected();


// import { getBookingTime } from 'packs/booking_form.js';
// getBookingTime();

// import { toggleDateInputs } from 'plugins/time_pickr.js';
// toggleDateInputs();

showBottomNav();

flipPackageInfo();


// document.addEventListener('turbolinks:load', () => {
// })
