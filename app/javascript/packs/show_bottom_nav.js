const showBottomNav = () => {
  let bottom_nav = document.querySelector('.bottom-nav-avatar');
  if (bottom_nav) {
    bottom_nav.addEventListener('click', (e)=>{
      document.querySelectorAll('.bottom-nav-icon').forEach (icon =>
      icon.classList.toggle("bottom-nav-icon-show"));
    })
  }
}

export { showBottomNav };
