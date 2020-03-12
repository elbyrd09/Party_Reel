const getBookingTime = () => {
  document.querySelector('#starttime').addEventListener('change', (e)=>{
    let starttime = e.target.value
  console.log(starttime);
    document.querySelector('#booking_start_time').value = starttime
  })
  document.querySelector('#endtime').addEventListener('change', (e)=>{
    let endtime = e.target.value
    document.querySelector('#booking_end_time').value = endtime
  })

}

export { getBookingTime };
