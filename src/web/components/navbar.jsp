<%-- components/navbar.jsp --%>
<%-- Include this in any page with: <jsp:include page="components/navbar.jsp"/> --%>

<nav class="navbar" id="navbar">
  <div class="nav-container">
    <a href="index.jsp" class="nav-logo">
      <span class="logo-icon"><i class="fa-solid fa-book-open"></i></span>
      <span class="logo-text">Librarium</span>
    </a>
    <ul class="nav-links" id="navLinks">
      <li><a href="index.jsp" class="nav-link">Home</a></li>
      <li><a href="books.jsp" class="nav-link">Explore Books</a></li>
      <li><a href="about.jsp" class="nav-link">About</a></li>
      <li><a href="login.jsp" class="nav-link">Login</a></li>
      <li><a href="register.jsp" class="nav-btn">Register</a></li>
    </ul>
    <button class="hamburger" id="hamburger" aria-label="Toggle menu">
      <span></span><span></span><span></span>
    </button>
  </div>
</nav>
