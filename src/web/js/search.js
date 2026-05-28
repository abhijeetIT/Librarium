/* ====================================================
   LIBRARIUM – search.js
   ==================================================== */

// Navbar scroll + hamburger (shared behaviour)
const navbar = document.getElementById('navbar');
if (navbar) window.addEventListener('scroll', () => navbar.classList.toggle('scrolled', window.scrollY > 10));

const hamburger = document.getElementById('hamburger');
const navLinks  = document.getElementById('navLinks');
if (hamburger && navLinks) {
  hamburger.addEventListener('click', () => { hamburger.classList.toggle('open'); navLinks.classList.toggle('open'); });
}

const profileToggle   = document.getElementById('profileToggle');
const profileDropdown = document.getElementById('profileDropdown');
if (profileToggle && profileDropdown) {
  profileToggle.addEventListener('click', e => { e.stopPropagation(); profileToggle.classList.toggle('open'); profileDropdown.classList.toggle('open'); });
  document.addEventListener('click', () => { profileToggle.classList.remove('open'); profileDropdown.classList.remove('open'); });
}
