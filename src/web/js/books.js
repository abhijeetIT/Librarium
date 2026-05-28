/* ====================================================
   LIBRARIUM – books.js
   ==================================================== */

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

// Fade in book cards
const cards = document.querySelectorAll('.book-card');
if ('IntersectionObserver' in window) {
  const io = new IntersectionObserver(entries => {
    entries.forEach((e, i) => {
      if (e.isIntersecting) {
        e.target.style.animationDelay = `${i * 0.06}s`;
        e.target.style.animation = 'fadeUp 0.35s ease both';
        io.unobserve(e.target);
      }
    });
  }, { threshold: 0.1 });
  cards.forEach(c => { c.style.opacity = '0'; io.observe(c); });
}
