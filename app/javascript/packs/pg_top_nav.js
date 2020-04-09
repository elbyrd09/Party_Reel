const navOnScroll = () => {
  const navbar = document.querySelector('.custom-nav');
  const userScroll = window.innerHeight * .69
  // multiplies innerHeight of viewport by 69% which is the mark that the user scrolls to
  // on the homepage after the banner image has been passed, which, we then add the 'nav-custom-disbale'
  // class to the navbar which hides and disables it's options, ie. About Us, FAQ, Join the party

  if(navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= userScroll) {
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


