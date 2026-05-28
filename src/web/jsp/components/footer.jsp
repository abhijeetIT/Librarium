<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<footer class="footer">
  <div class="container footer-inner">
    <div class="footer-brand">
      <a href="${pageContext.request.contextPath}/home" class="nav-logo">
        <span class="logo-icon"><i class="fa-solid fa-book-open"></i></span>
        <span class="logo-text">Librarium</span>
      </a>
      <p>Your one-stop destination for books of every kind.</p>
    </div>
    <div class="footer-links">
      <a href="${pageContext.request.contextPath}/home">Home</a>
      <a href="${pageContext.request.contextPath}/books">Books</a>
      <a href="${pageContext.request.contextPath}/about">About</a>
    </div>
    <div class="footer-contact">
      <span><i class="fa-solid fa-envelope"></i> hello@librarium.in</span>
      <span><i class="fa-solid fa-phone"></i> +91 00000 00000</span>
    </div>
  </div>
  <div class="footer-bottom">
    <p>&copy; 2026 <strong>Librarium</strong>. All rights reserved.</p>
  </div>
</footer>
