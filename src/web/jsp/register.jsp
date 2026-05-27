<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Register – Librarium</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/auth.css"/>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600;700;900&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>
<body class="auth-page">

<jsp:include page="components/navbar.jsp"/>

<div class="auth-wrapper">

  <!-- ── Left decorative panel ── -->
  <div class="auth-left">
    <div class="auth-left-content">
      <div class="auth-brand-icon"><i class="fa-solid fa-book-open"></i></div>
      <h2>Join<br/>Librarium!</h2>
      <p>Create your free account and unlock a world of books. Start your reading journey today.</p>
      <div class="auth-perks">
        <div class="perk"><i class="fa-solid fa-circle-check"></i> 12,000+ books available</div>
        <div class="perk"><i class="fa-solid fa-circle-check"></i> Free delivery on ₹499+</div>
        <div class="perk"><i class="fa-solid fa-circle-check"></i> Exclusive member deals</div>
        <div class="perk"><i class="fa-solid fa-circle-check"></i> Easy 7-day returns</div>
      </div>
    </div>
  </div>

  <!-- ── Right form panel ── -->
  <div class="auth-right">
    <div class="auth-card auth-card-register">

      <div class="auth-card-header">
        <div class="auth-card-icon"><i class="fa-solid fa-user-plus"></i></div>
        <h3>Create Account</h3>
        <p>Fill in your details to get started</p>
      </div>

      <%-- Error from RegisterServlet: request.setAttribute("error", "...") --%>
      <c:if test="${not empty error}">
        <div class="auth-alert auth-alert-error">
          <i class="fa-solid fa-circle-exclamation"></i> ${error}
        </div>
      </c:if>

      <form action="${pageContext.request.contextPath}/register"
            method="post"
            class="auth-form"
            id="registerForm"
            novalidate>

        <!-- Row: Name -->
        <div class="form-group">
          <label for="name">
            <i class="fa-solid fa-user"></i> Full Name
          </label>
          <input type="text"
                 id="name"
                 name="name"
                 placeholder="Ravi Kumar"
                 value="${not empty param.name ? param.name : ''}"
                 autocomplete="name"
                 required/>
          <span class="field-error" id="nameErr"></span>
        </div>

        <!-- Row: Email -->
        <div class="form-group">
          <label for="email">
            <i class="fa-solid fa-envelope"></i> Email Address
          </label>
          <input type="email"
                 id="email"
                 name="email"
                 placeholder="you@example.com"
                 value="${not empty param.email ? param.email : ''}"
                 autocomplete="email"
                 required/>
          <span class="field-error" id="emailErr"></span>
        </div>

        <!-- Row: Phone -->
        <div class="form-group">
          <label for="phone">
            <i class="fa-solid fa-phone"></i> Phone Number
          </label>
          <input type="tel"
                 id="phone"
                 name="phone"
                 placeholder="+91 98765 43210"
                 value="${not empty param.phone ? param.phone : ''}"
                 autocomplete="tel"
                 required/>
          <span class="field-error" id="phoneErr"></span>
        </div>

        <!-- Row: Address -->
        <div class="form-group">
          <label for="address">
            <i class="fa-solid fa-location-dot"></i> Address
          </label>
          <textarea id="address"
                    name="address"
                    placeholder="42, Book Lane, Kolkata, WB"
                    rows="2"
                    required>${not empty param.address ? param.address : ''}</textarea>
          <span class="field-error" id="addressErr"></span>
        </div>

        <!-- Row: Password -->
        <div class="form-group">
          <label for="password">
            <i class="fa-solid fa-lock"></i> Password
          </label>
          <div class="input-password-wrap">
            <input type="password"
                   id="password"
                   name="password"
                   placeholder="Min. 6 characters"
                   autocomplete="new-password"
                   required/>
            <button type="button"
                    class="toggle-pass"
                    onclick="togglePassword('password','eyePass')"
                    title="Show/hide password">
              <i class="fa-regular fa-eye" id="eyePass"></i>
            </button>
          </div>
          <span class="field-error" id="passErr"></span>
        </div>

        <!-- Row: Confirm Password -->
        <div class="form-group">
          <label for="confirmPassword">
            <i class="fa-solid fa-lock"></i> Confirm Password
          </label>
          <div class="input-password-wrap">
            <input type="password"
                   id="confirmPassword"
                   name="confirmPassword"
                   placeholder="Re-enter your password"
                   autocomplete="new-password"
                   required/>
            <button type="button"
                    class="toggle-pass"
                    onclick="togglePassword('confirmPassword','eyeConfirm')"
                    title="Show/hide password">
              <i class="fa-regular fa-eye" id="eyeConfirm"></i>
            </button>
          </div>
          <span class="field-error" id="confirmErr"></span>
        </div>

        <button type="submit" class="auth-submit-btn" id="registerBtn">
          <i class="fa-solid fa-user-plus"></i> Create Account
        </button>

      </form>

      <p class="auth-switch">
        Already have an account?
        <a href="${pageContext.request.contextPath}/login">Sign in here</a>
      </p>

    </div>
  </div>

</div>

<script src="${pageContext.request.contextPath}/js/auth.js"></script>
</body>
</html>
