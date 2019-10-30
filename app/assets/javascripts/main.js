document.addEventListener('DOMContentLoaded', () => {
  const button = document.getElementById('check-out-button');
  const modal = document.getElementById('payment-modal');
  const close = document.getElementById('modal-close');

  button.onclick = function() {
    modal.style.display = 'flex';
  }
  close.onclick = function() {
    modal.style.display = 'none';
  }
})