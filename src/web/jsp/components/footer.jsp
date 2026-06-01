<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<footer class="footer">
  <div class="container footer-grid">

    <!-- Brand -->
    <div class="footer-brand">
      <a href="${pageContext.request.contextPath}/home" class="nav-logo">
        <span class="logo-icon"><i class="fa-solid fa-book-open"></i></span>
        <span class="logo-text">Librarium</span>
      </a>
      <p class="footer-tagline">Your one-stop destination for books of every kind. A college project built with passion.</p>
    </div>

    <!-- Quick Links -->
    <div class="footer-col">
      <h4>Quick Links</h4>
      <ul>
        <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/books">Books</a></li>
        <li><a href="${pageContext.request.contextPath}/about">About</a></li>
        <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
        <li><a href="${pageContext.request.contextPath}/register">Register</a></li>
      </ul>
    </div>

    <!-- Developer -->
    <div class="footer-col">
      <h4>Developer</h4>
      <p class="footer-dev-name"><i class="fa-solid fa-code"></i> Abhijeet Jha</p>
      <ul class="footer-social">
        <li>
          <a href="http://www.linkedin.com/in/abhijeet-jha19" target="_blank">
            <i class="fa-brands fa-linkedin"></i> LinkedIn
          </a>
        </li>
        <li>
          <a href="https://github.com/abhijeetIT" target="_blank">
            <i class="fa-brands fa-github"></i> GitHub
          </a>
        </li>
        <li>
          <a href="mailto:abhijeetj4324@gmail.com">
            <i class="fa-solid fa-envelope"></i> abhijeetj4324@gmail.com
          </a>
        </li>
      </ul>
    </div>

    <!-- Frontend Collaborator -->
    <div class="footer-col">
      <h4>Frontend Collaboration</h4>
      <p class="footer-dev-name"><i class="fa-solid fa-palette"></i> Sabuj</p>
      <ul class="footer-social">
        <li>
          <a href="https://github.com/sabuj750" target="_blank">
            <i class="fa-brands fa-github"></i> GitHub
          </a>
        </li>
      </ul>
    </div>

  </div>

  <div class="footer-bottom">
    <p>
      &copy; 2025 <strong>Librarium</strong>. College Project &nbsp;|&nbsp;
      Built by <a href="http://www.linkedin.com/in/abhijeet-jha19" target="_blank">Abhijeet Jha</a>
      &amp; <a href="https://github.com/sabuj750" target="_blank">Sabuj</a>
    </p>
  </div>
</footer>
