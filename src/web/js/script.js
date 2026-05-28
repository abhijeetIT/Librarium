/* ====================================================
   LIBRARIUM – script.js  (index page)
   ==================================================== */

// Navbar scroll shadow
const navbar = document.getElementById('navbar');
if (navbar) {
  window.addEventListener('scroll', () => {
    navbar.classList.toggle('scrolled', window.scrollY > 10);
  });
}

// Hamburger toggle
const hamburger = document.getElementById('hamburger');
const navLinks  = document.getElementById('navLinks');
if (hamburger && navLinks) {
  hamburger.addEventListener('click', () => {
    hamburger.classList.toggle('open');
    navLinks.classList.toggle('open');
  });
  navLinks.querySelectorAll('a').forEach(a => {
    a.addEventListener('click', () => {
      hamburger.classList.remove('open');
      navLinks.classList.remove('open');
    });
  });
}

// Profile dropdown
const profileToggle   = document.getElementById('profileToggle');
const profileDropdown = document.getElementById('profileDropdown');
if (profileToggle && profileDropdown) {
  profileToggle.addEventListener('click', (e) => {
    e.stopPropagation();
    profileToggle.classList.toggle('open');
    profileDropdown.classList.toggle('open');
  });
  document.addEventListener('click', () => {
    profileToggle.classList.remove('open');
    profileDropdown.classList.remove('open');
  });
}

// Fade-in on scroll for cat pills and author cards
const revealItems = document.querySelectorAll('.cat-pill, .author-card');
if ('IntersectionObserver' in window) {
  const io = new IntersectionObserver((entries) => {
    entries.forEach((entry, i) => {
      if (entry.isIntersecting) {
        entry.target.style.animationDelay = `${i * 0.04}s`;
        entry.target.style.animation = 'fadeUp 0.35s ease both';
        io.unobserve(entry.target);
      }
    });
  }, { threshold: 0.1 });
  revealItems.forEach(el => { el.style.opacity = '0'; io.observe(el); });
}
