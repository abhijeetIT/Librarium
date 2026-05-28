<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
  Required session attr : loggedInUser (User object) — set by LoginServlet
  Required request attr : activePage   (String)      — set by each Servlet
  Cart count pulled from session       : cartCount    — set by CartServlet
--%>
<nav class="navbar" id="navbar">
  <div class="nav-container">

    <!-- Logo -->
    <a href="${pageContext.request.contextPath}/home" class="nav-logo">
      <span class="logo-icon"><i class="fa-solid fa-book-open"></i></span>
      <span class="logo-text">Librarium</span>
    </a>

    <!-- Search bar -->
    <form class="nav-search" action="${pageContext.request.contextPath}/search" method="get">
      <i class="fa-solid fa-magnifying-glass nav-search-icon"></i>
      <input type="text" name="q" id="navSearchInput"
             placeholder="Search by title, author or category..."
             autocomplete="off"
             value="${not empty param.q ? param.q : ''}"/>
      <button type="submit" class="nav-search-btn">Search</button>
    </form>

    <!-- Links -->
    <ul class="nav-links" id="navLinks">

      <!-- Home only shown when NOT logged in -->
      <c:if test="${empty sessionScope.loggedInUser}">
        <li><a href="${pageContext.request.contextPath}/home"
               class="nav-link ${activePage == 'home' ? 'active' : ''}">Home</a></li>
      </c:if>

      <li><a href="${pageContext.request.contextPath}/books"
             class="nav-link ${activePage == 'books' ? 'active' : ''}">Books</a></li>

      <li><a href="${pageContext.request.contextPath}/about"
             class="nav-link ${activePage == 'about' ? 'active' : ''}">About</a></li>

      <!-- Cart icon (always visible) -->
      <li>
        <a href="${pageContext.request.contextPath}/cart" class="nav-cart-icon ${activePage == 'cart' ? 'active' : ''}">
          <i class="fa-solid fa-cart-shopping"></i>
          <c:if test="${not empty sessionScope.cartCount and sessionScope.cartCount > 0}">
            <span class="cart-badge">${sessionScope.cartCount}</span>
          </c:if>
        </a>
      </li>

      <!-- NOT logged in -->
      <c:if test="${empty sessionScope.loggedInUser}">
        <li><a href="${pageContext.request.contextPath}/login"
               class="nav-link ${activePage == 'login' ? 'active' : ''}">Login</a></li>
        <li><a href="${pageContext.request.contextPath}/register"
               class="nav-btn ${activePage == 'register' ? 'active-btn' : ''}">Register</a></li>
      </c:if>

      <!-- Logged in -->
      <c:if test="${not empty sessionScope.loggedInUser}">
        <li class="nav-profile-wrap">
          <button class="nav-profile-btn" id="profileToggle">
            <i class="fa-solid fa-circle-user"></i>
            <span>${sessionScope.loggedInUser.name}</span>
            <i class="fa-solid fa-chevron-down nav-chevron"></i>
          </button>
          <div class="nav-dropdown" id="profileDropdown">
            <a href="${pageContext.request.contextPath}/profile">
              <i class="fa-solid fa-user"></i> My Profile
            </a>
            <a href="${pageContext.request.contextPath}/profile">
              <i class="fa-solid fa-box"></i> My Orders
            </a>
            <div class="dropdown-divider"></div>
            <a href="${pageContext.request.contextPath}/logout" class="dropdown-logout">
              <i class="fa-solid fa-right-from-bracket"></i> Logout
            </a>
          </div>
        </li>
      </c:if>

    </ul>

    <button class="hamburger" id="hamburger" aria-label="Toggle menu">
      <span></span><span></span><span></span>
    </button>
  </div>

  <!-- Mobile search -->
  <div class="nav-search-mobile" id="mobileSearchBar">
    <form action="${pageContext.request.contextPath}/search" method="get">
      <i class="fa-solid fa-magnifying-glass"></i>
      <input type="text" name="q" placeholder="Search books, authors..."
             value="${not empty param.q ? param.q : ''}"/>
      <button type="submit">Go</button>
    </form>
  </div>
</nav>
