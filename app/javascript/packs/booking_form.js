const getBookingTime = () => {
  document.querySelector('#starttime').addEventListener('change', (e)=>{
    let starttime = e.target.value
    document.querySelector('#booking_start_time').value = starttime
    document.querySelector('#quote-start-time').innerText = starttime
  })
  document.querySelector('#endtime').addEventListener('change', (e)=>{
    let endtime = e.target.value
    document.querySelector('#booking_end_time').value = endtime
    document.querySelector('#quote-end-time').innerText = endtime
  })

}

export { getBookingTime };
