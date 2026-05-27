<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Login – Librarium</title>
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
      <h2>Welcome Back,<br/>Reader!</h2>
      <p>Login to access your bookshelf, track your orders, and explore thousands of titles curated just for you.</p>
      <div class="auth-perks">
        <div class="perk"><i class="fa-solid fa-circle-check"></i> Access your order history</div>
        <div class="perk"><i class="fa-solid fa-circle-check"></i> Save books to your wishlist</div>
        <div class="perk"><i class="fa-solid fa-circle-check"></i> Faster checkout experience</div>
      </div>
    </div>
  </div>

  <!-- ── Right form panel ── -->
  <div class="auth-right">
    <div class="auth-card">

      <div class="auth-card-header">
        <div class="auth-card-icon"><i class="fa-solid fa-right-to-bracket"></i></div>
        <h3>Sign In</h3>
        <p>Enter your credentials to continue</p>
      </div>

      <%-- Error from LoginServlet: request.setAttribute("error", "...") --%>
      <c:if test="${not empty error}">
        <div class="auth-alert auth-alert-error">
          <i class="fa-solid fa-circle-exclamation"></i> ${error}
        </div>
      </c:if>

      <%-- Success after register redirect: request.setAttribute("success", "...") --%>
      <c:if test="${not empty success}">
        <div class="auth-alert auth-alert-success">
          <i class="fa-solid fa-circle-check"></i> ${success}
        </div>
      </c:if>

      <form action="${pageContext.request.contextPath}/login"
            method="post"
            class="auth-form"
            id="loginForm"
            novalidate>

        <!-- Email -->
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

        <!-- Password -->
        <div class="form-group">
          <label for="password">
            <i class="fa-solid fa-lock"></i> Password
          </label>
          <div class="input-password-wrap">
            <input type="password"
                   id="password"
                   name="password"
                   placeholder="Enter your password"
                   autocomplete="current-password"
                   required/>
            <button type="button"
                    class="toggle-pass"
                    onclick="togglePassword('password','eyeLogin')"
                    title="Show/hide password">
              <i class="fa-regular fa-eye" id="eyeLogin"></i>
            </button>
          </div>
          <span class="field-error" id="passErr"></span>
        </div>

        <button type="submit" class="auth-submit-btn" id="loginBtn">
          <i class="fa-solid fa-right-to-bracket"></i> Login
        </button>

      </form>

      <p class="auth-switch">
        Don't have an account?
        <a href="${pageContext.request.contextPath}/register">Create one here</a>
      </p>

    </div>
  </div>

</div>

<script src="${pageContext.request.contextPath}/js/auth.js"></script>
</body>
</html>
