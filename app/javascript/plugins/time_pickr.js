
const toggleDateInputs = () => {
  const startDateInput = document.getElementById('booking_start_time');
  const endDateInput = document.getElementById('booking_end_time');

  if (startDateInput) {
  console.log("hello")
    const unavailableTimes = JSON.parse(document.querySelector('#photographer-booking-hours').dataset.unavailable)
    endDateInput.disabled = true

    flatpickr(startDateInput, {
      enableTime: true,
      noCalendar: true,
      dateFormat: "H:i",
      time_24hr: true
    });

    console.log('im in the file')

    startDateInput.addEventListener("change", (e) => {
      if (startDateInput != "") {
        endDateInput.disabled = false
      }
      flatpickr(endDateInput, {
        enableTime: true,
        noCalendar: true,
        dateFormat: "H:i",
        time_24hr: true
        });
      })
    };
};

export { toggleDateInputs }
