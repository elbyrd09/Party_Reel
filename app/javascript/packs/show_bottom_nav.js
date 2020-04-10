const showBottomNav = () => {
  document.querySelector('.bottom-nav-avatar').addEventListener('click', (e)=>{
  document.querySelectorAll('.bottom-nav-icon').forEach (icon =>
    icon.classList.toggle("bottom-nav-icon-show"));
  })
}

export { showBottomNav };
