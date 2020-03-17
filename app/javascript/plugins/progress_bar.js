const progress = () => {
  if (/\/events\/\d+\/packages\/\d+/.test(window.location)) {
    $('.progress .circle:nth-of-type(3)').addClass('active')
    $('.progress .circle:nth-of-type(2)').addClass('done')
    $('.progress .circle:nth-of-type(1)').addClass('done')
  } else if (/\/events\/\d+\/packages/.test(window.location)) {
    $('.progress .circle:nth-of-type(2)').addClass('active')
    $('.progress .circle:nth-of-type(1)').addClass('done')
  } else if (/\/events\/\d+/.test(window.location)){
    $('.progress .circle:nth-of-type(1)').addClass('active');
  } else if (/\/payments\/new/.test(window.location)) {
    $('.progress .circle:nth-of-type(5)').addClass('active');
    $('.progress .circle:nth-of-type(4)').addClass('done');
    $('.progress .circle:nth-of-type(3)').addClass('done');
    $('.progress .circle:nth-of-type(2)').addClass('done')
    $('.progress .circle:nth-of-type(1)').addClass('done')
  } else if (/\/bookings\/\d+/.test(window.location)){
    $('.progress .circle:nth-of-type(4)').addClass('active');
    $('.progress .circle:nth-of-type(3)').addClass('done');
    $('.progress .circle:nth-of-type(2)').addClass('done')
    $('.progress .circle:nth-of-type(1)').addClass('done')
  }
}


export { progress }

  // var i = 1;
  // $('.progress .circle').removeClass().addClass('circle');
  // $('.progress .bar').removeClass().addClass('bar');
  // setInterval(function() {
  //   $('.progress .circle:nth-of-type(' + i + ')').addClass('active');

  //   $('.progress .circle:nth-of-type(' + (i-1) + ')').removeClass('active').addClass('done');

  //   $('.progress .circle:nth-of-type(' + (i-1) + ') .label').html('&#10003;');

  //   $('.progress .bar:nth-of-type(' + (i-1) + ')').addClass('active');

  //   $('.progress .bar:nth-of-type(' + (i-2) + ')').removeClass('active').addClass('done');

  //   i++;

  //   if (i==0) {
  //     $('.progress .bar').removeClass().addClass('bar');
  //     $('.progress div.circle').removeClass().addClass('circle');
  //     i = 1;
  //   }
  // }, 1000);

