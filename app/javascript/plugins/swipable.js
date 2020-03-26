function resetCarousel() {
  const first = document.querySelector('#first')
  const second = document.querySelector('#second')
  const third = document.querySelector('#third')
  const fourth = document.querySelector('#fourth')
  const fifth = document.querySelector('#fifth')
  const sixth = document.querySelector('#sixth')
  const seventh = document.querySelector('#seventh')

  const nodes = [first, second, third, fourth, fifth, sixth, seventh]

  nodes.forEach(node => {
    removeClass(node)
  })

  first.classList.add('hideLeft')
  second.classList.add('prevLeftSecond')
  third.classList.add('prev')
  fourth.classList.add('selected')
  fifth.classList.add('next')
  sixth.classList.add('nextRightSecond')
  seventh.classList.add('hideRight')
}

function removeClass(node) {
  node.className = '';
}

export function moveToSelected(element) {
  if (element == "next") {
    var selected = $(".selected").next();
  } else if (element == "prev") {
    var selected = $(".selected").prev();
  } else {
    var selected = element;
  }

  var next = $(selected).next();
  var prev = $(selected).prev();
  var prevSecond = $(prev).prev();
  var nextSecond = $(next).next();

  $(selected)
    .removeClass()
    .addClass("selected");

  $(prev)
    .removeClass()
    .addClass("prev");

  $(next)
    .removeClass()
    .addClass("next");

  $(nextSecond)
    .removeClass()
    .addClass("nextRightSecond");

  $(prevSecond)
    .removeClass()
    .addClass("prevLeftSecond");

  $(nextSecond)
    .nextAll()
    .removeClass()
    .addClass("hideRight");

  $(prevSecond)
    .prevAll()
    .removeClass()
    .addClass("hideLeft");
}

// Keyboard events
$(document).keydown(function(e) {
  switch (e.which) {
    case 37: // left
      moveToSelected("prev");
      break;

    case 39: // right
      moveToSelected("next");
      break;

    default:
      return;
  }
  e.preventDefault();
});

$("#carousel div").click(function() {
  moveToSelected($(this));
});

$("#prev").click(function() {
  moveToSelected("prev");
});

$("#next").click(function() {
  moveToSelected("next");
});

setInterval(() => {
  const seventh = document.querySelector('#seventh')
  if (seventh && seventh.classList.contains('selected')) {
    resetCarousel()
  } else {
    moveToSelected("next");
  }
  console.log('move')
}, 2000)
