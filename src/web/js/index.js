/* ====================================================
   LIBRARIUM – index.js
   Author: College Project
   ==================================================== */

/* ---------- Navbar Scroll Effect ---------- */
const navbar = document.getElementById('navbar');
window.addEventListener('scroll', () => {
  if (window.scrollY > 20) {
    navbar.classList.add('scrolled');
  } else {
    navbar.classList.remove('scrolled');
  }
});

/* ---------- Active Nav Link on Scroll ---------- */
const sections = document.querySelectorAll('section[id]');
const navLinks = document.querySelectorAll('.nav-link');

const observerOptions = { threshold: 0.4 };
const sectionObserver = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      const id = entry.target.getAttribute('id');
      navLinks.forEach(link => {
        link.classList.remove('active');
        if (link.getAttribute('href') === `#${id}`) {
          link.classList.add('active');
        }
      });
    }
  });
}, observerOptions);

sections.forEach(sec => sectionObserver.observe(sec));

/* ---------- Mobile Hamburger Menu ---------- */
const hamburger = document.getElementById('hamburger');
const navLinksMenu = document.getElementById('navLinks');

hamburger.addEventListener('click', () => {
  hamburger.classList.toggle('open');
  navLinksMenu.classList.toggle('open');
});

// Close menu when a nav link is clicked
navLinksMenu.querySelectorAll('a').forEach(link => {
  link.addEventListener('click', () => {
    hamburger.classList.remove('open');
    navLinksMenu.classList.remove('open');
  });
});

/* ---------- Cart System ---------- */
let cartCount = 0;
const cartCountEl = document.getElementById('cartCount');

function addToCart(button, bookTitle) {
  cartCount++;
  cartCountEl.textContent = cartCount;

  // Button feedback
  const originalHTML = button.innerHTML;
  button.innerHTML = '<i class="fa-solid fa-check"></i> Added!';
  button.classList.add('added');
  button.disabled = true;

  setTimeout(() => {
    button.innerHTML = originalHTML;
    button.classList.remove('added');
    button.disabled = false;
  }, 2000);

  // Show toast
  showToast(`"${bookTitle}" added to cart!`);

  // Bounce cart icon
  const cartFloat = document.getElementById('cartFloat');
  cartFloat.style.transform = 'scale(1.25)';
  setTimeout(() => {
    cartFloat.style.transform = '';
  }, 200);
}

/* ---------- Toast Notification ---------- */
function showToast(message) {
  const toast = document.getElementById('toast');
  const toastMsg = document.getElementById('toastMsg');
  toastMsg.textContent = message;
  toast.classList.add('show');
  setTimeout(() => toast.classList.remove('show'), 2800);
}

/* ---------- Newsletter Subscribe ---------- */
function subscribeNewsletter() {
  const emailInput = document.getElementById('nlEmail');
  const email = emailInput.value.trim();

  if (!email || !isValidEmail(email)) {
    showToast('Please enter a valid email address!');
    return;
  }

  showToast(`Subscribed with ${email} ✓`);
  emailInput.value = '';
}

function isValidEmail(email) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}

// Allow Enter key on newsletter input
document.getElementById('nlEmail').addEventListener('keydown', (e) => {
  if (e.key === 'Enter') subscribeNewsletter();
});

/* ---------- Scroll Reveal Animation ---------- */
const revealElements = document.querySelectorAll('.book-card, .cat-card, .about-feature');

const revealObserver = new IntersectionObserver((entries) => {
  entries.forEach((entry, i) => {
    if (entry.isIntersecting) {
      entry.target.style.animationDelay = `${i * 0.08}s`;
      entry.target.style.animation = 'fadeUp 0.6s ease both';
      revealObserver.unobserve(entry.target);
    }
  });
}, { threshold: 0.1 });

revealElements.forEach(el => {
  el.style.opacity = '0';
  revealObserver.observe(el);
});

/* ---------- Wishlist Toggle ---------- */
document.querySelectorAll('.wishlist-btn').forEach(btn => {
  btn.addEventListener('click', (e) => {
    e.stopPropagation();
    const icon = btn.querySelector('i');
    if (icon.classList.contains('fa-regular')) {
      icon.classList.replace('fa-regular', 'fa-solid');
      btn.style.color = '#e74c3c';
      showToast('Added to wishlist!');
    } else {
      icon.classList.replace('fa-solid', 'fa-regular');
      btn.style.color = '';
      showToast('Removed from wishlist.');
    }
  });
});

/* ---------- Smooth scroll for anchor links ---------- */
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
  anchor.addEventListener('click', (e) => {
    const target = document.querySelector(anchor.getAttribute('href'));
    if (target) {
      e.preventDefault();
      const offset = 80;
      const top = target.getBoundingClientRect().top + window.scrollY - offset;
      window.scrollTo({ top, behavior: 'smooth' });
    }
  });
});

/* ---------- Category Card Click ---------- */
document.querySelectorAll('.cat-card').forEach(card => {
  card.addEventListener('click', () => {
    const genre = card.querySelector('span').textContent;
    showToast(`Browsing "${genre}" books...`);
    setTimeout(() => {
      document.querySelector('#books').scrollIntoView({ behavior: 'smooth', block: 'start' });
    }, 800);
  });
});

console.log('%c📚 Librarium – College Project', 'color:#e8562a;font-size:18px;font-weight:bold;');
console.log('%cJSP/Servlet Frontend Ready', 'color:#6b7280;font-size:13px;');