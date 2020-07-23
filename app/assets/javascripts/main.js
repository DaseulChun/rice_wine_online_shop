document.addEventListener('DOMContentLoaded', () => {
  const button = document.getElementById('check-out-button');
  const modal = document.getElementById('payment-modal');
  const close = document.getElementById('modal-close');
  const modalBackground = document.querySelector('.modal-background');

  button.onclick = function() {
    modal.style.display = 'flex';
  }

  close.onclick = function() {
    modal.style.display = 'none';
  }
  
  modalBackground.onclick = function() {
    modal.style.display = 'none';
  }
})

const toggleDrawer = () => {
  document.getElementById('drawer').classList.toggle('is-visible');

  document.getElementById('diagonal-1').classList.toggle('is-open');
  document.getElementById('horizontal').classList.toggle('is-open');
  document.getElementById('diagonal-2').classList.toggle('is-open');
} 


const changeLogo = () => {  
  const logoImage = document.querySelector('.navbar__logo-image');
  
  if (document.body.scrollTop > 1 || document.documentElement.scrollTop > 1) {
    logoImage.classList.add('navbar__logo-image--scroll-down');
  } else {
    logoImage.classList.remove('navbar__logo-image--scroll-down');
  }
}
window.onscroll = changeLogo;