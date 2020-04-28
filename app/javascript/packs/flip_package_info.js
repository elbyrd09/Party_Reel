const flipPackageInfo = () => {
  // console.log('flipPackageInfo')
  document.querySelectorAll('.package-card').forEach (card =>
    card.querySelectorAll('.package-toggle').forEach (title =>
      title.addEventListener('click', (e)=>{
        card.childNodes[1].classList.toggle('hidden');
        card.childNodes[3].classList.toggle('hidden');
      }
  )))
};

export { flipPackageInfo };
