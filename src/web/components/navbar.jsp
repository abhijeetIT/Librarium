<%-- components/navbar.jsp --%>
<%-- Include with: <jsp:include page="components/navbar.jsp"/> --%>

<nav class="navbar" id="navbar">
  <div class="nav-container">
    <a href="${pageContext.request.contextPath}/home" class="nav-logo">
      <span class="logo-icon"><i class="fa-solid fa-book-open"></i></span>
      <span class="logo-text">Librarium</span>
    </a>
    <ul class="nav-links" id="navLinks">
      <li><a href="${pageContext.request.contextPath}/home"     class="nav-link">Home</a></li>
      <li><a href="${pageContext.request.contextPath}/books"    class="nav-link">Explore Books</a></li>
      <li><a href="${pageContext.request.contextPath}/about"    class="nav-link">About</a></li>
      <li><a href="${pageContext.request.contextPath}/login"    class="nav-link">Login</a></li>
      <li><a href="${pageContext.request.contextPath}/register" class="nav-btn">Register</a></li>
    </ul>
    <button class="hamburger" id="hamburger" aria-label="Toggle menu">
      <span></span><span></span><span></span>
    </button>
  </div>
</nav>
