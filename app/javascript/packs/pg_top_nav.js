const navOnScroll = () => {
  const navbar = document.querySelector('.custom-nav');

  if(navbar) {
    window.addEventListener('scroll', () => {
      console.log(window.scrollY + ',' + window.innerHeight)
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('nav-custom-disable');
      } else {
        navbar.classList.remove('nav-custom-disable');
      }
    });
  }
}
export { navOnScroll };

//  const initUpdateNavbarOnScroll = () => {
//   const navbar = document.querySelector('.navbar-lewagon');
//   if (navbar) {
//     window.addEventListener('scroll', () => {
//       if (window.scrollY >= window.innerHeight) {
//         navbar.classList.add('navbar-lewagon-white');
//       } else {
//         navbar.classList.remove('navbar-lewagon-white');
//       }
//     });
//   }
// }


