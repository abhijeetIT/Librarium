/* ====================================================
   LIBRARIUM – auth.js
   Client-side validation for login.jsp & register.jsp
   ==================================================== */

/* ---------- Password show/hide toggle ---------- */
function togglePassword(inputId, iconId) {
  const input = document.getElementById(inputId);
  const icon  = document.getElementById(iconId);
  if (!input || !icon) return;

  if (input.type === 'password') {
    input.type = 'text';
    icon.classList.replace('fa-eye', 'fa-eye-slash');
  } else {
    input.type = 'password';
    icon.classList.replace('fa-eye-slash', 'fa-eye');
  }
}

/* ---------- Helper: show / clear field error ---------- */
function showError(fieldId, errId, msg) {
  const field = document.getElementById(fieldId);
  const err   = document.getElementById(errId);
  if (field) field.classList.add('invalid');
  if (err)   err.textContent = msg;
}

function clearError(fieldId, errId) {
  const field = document.getElementById(fieldId);
  const err   = document.getElementById(errId);
  if (field) field.classList.remove('invalid');
  if (err)   err.textContent = '';
}

/* ---------- Live clear on input ---------- */
function attachLiveClear(fieldId, errId) {
  const field = document.getElementById(fieldId);
  if (!field) return;
  field.addEventListener('input', () => clearError(fieldId, errId));
}

/* ======================================================
   LOGIN FORM VALIDATION
   ====================================================== */
const loginForm = document.getElementById('loginForm');
if (loginForm) {

  attachLiveClear('email',    'emailErr');
  attachLiveClear('password', 'passErr');

  loginForm.addEventListener('submit', function (e) {
    let valid = true;

    const email    = document.getElementById('email').value.trim();
    const password = document.getElementById('password').value;

    clearError('email',    'emailErr');
    clearError('password', 'passErr');

    // Email
    if (!email) {
      showError('email', 'emailErr', 'Email is required.');
      valid = false;
    } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
      showError('email', 'emailErr', 'Enter a valid email address.');
      valid = false;
    }

    // Password
    if (!password) {
      showError('password', 'passErr', 'Password is required.');
      valid = false;
    }

    if (!valid) {
      e.preventDefault();
      return;
    }

    // Loading state
    const btn = document.getElementById('loginBtn');
    if (btn) {
      btn.classList.add('loading');
      btn.innerHTML = '<i class="fa-solid fa-spinner fa-spin"></i> Signing in...';
    }
  });
}

/* ======================================================
   REGISTER FORM VALIDATION
   ====================================================== */
const registerForm = document.getElementById('registerForm');
if (registerForm) {

  attachLiveClear('name',            'nameErr');
  attachLiveClear('email',           'emailErr');
  attachLiveClear('phone',           'phoneErr');
  attachLiveClear('address',         'addressErr');
  attachLiveClear('password',        'passErr');
  attachLiveClear('confirmPassword', 'confirmErr');

  registerForm.addEventListener('submit', function (e) {
    let valid = true;

    const name     = document.getElementById('name').value.trim();
    const email    = document.getElementById('email').value.trim();
    const phone    = document.getElementById('phone').value.trim();
    const address  = document.getElementById('address').value.trim();
    const password = document.getElementById('password').value;
    const confirm  = document.getElementById('confirmPassword').value;

    // Clear all
    ['name','email','phone','address','password','confirmPassword'].forEach(id => {
      const errId = id === 'confirmPassword' ? 'confirmErr'
                  : id === 'password'        ? 'passErr'
                  : id + 'Err';
      clearError(id, errId);
    });

    // Name
    if (!name) {
      showError('name', 'nameErr', 'Full name is required.');
      valid = false;
    } else if (name.length < 2) {
      showError('name', 'nameErr', 'Name must be at least 2 characters.');
      valid = false;
    }

    // Email
    if (!email) {
      showError('email', 'emailErr', 'Email is required.');
      valid = false;
    } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
      showError('email', 'emailErr', 'Enter a valid email address.');
      valid = false;
    }

    // Phone
    if (!phone) {
      showError('phone', 'phoneErr', 'Phone number is required.');
      valid = false;
    } else if (!/^[0-9+\s\-]{7,15}$/.test(phone)) {
      showError('phone', 'phoneErr', 'Enter a valid phone number.');
      valid = false;
    }

    // Address
    if (!address) {
      showError('address', 'addressErr', 'Address is required.');
      valid = false;
    }

    // Password
    if (!password) {
      showError('password', 'passErr', 'Password is required.');
      valid = false;
    } else if (password.length < 6) {
      showError('password', 'passErr', 'Password must be at least 6 characters.');
      valid = false;
    }

    // Confirm password
    if (!confirm) {
      showError('confirmPassword', 'confirmErr', 'Please confirm your password.');
      valid = false;
    } else if (password !== confirm) {
      showError('confirmPassword', 'confirmErr', 'Passwords do not match.');
      valid = false;
    }

    if (!valid) {
      e.preventDefault();
      return;
    }

    // Loading state
    const btn = document.getElementById('registerBtn');
    if (btn) {
      btn.classList.add('loading');
      btn.innerHTML = '<i class="fa-solid fa-spinner fa-spin"></i> Creating account...';
    }
  });
}
