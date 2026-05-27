<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Librarium – Discover Your Next Favorite Book</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css" />
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600;700;900&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>
<body>

  <!-- ===================== NAVBAR ===================== -->
  <jsp:include page="components/navbar.jsp"/>

  <!-- ===================== HERO ===================== -->
  <section class="hero" id="home">
    <div class="hero-bg-shapes">
      <div class="shape shape-1"></div>
      <div class="shape shape-2"></div>
      <div class="shape shape-3"></div>
    </div>
    <div class="hero-content">
      <h1 class="hero-title">Discover Your Next<br/><span class="highlight">Favorite Book</span></h1>
      <p class="hero-subtitle">Explore thousands of titles across every genre — from timeless classics to today's bestsellers. Your reading journey starts here.</p>
      <div class="hero-actions">
        <a href="#books"    class="btn btn-primary"><i class="fa-solid fa-compass"></i> Explore Books</a>
        <a href="login.jsp" class="btn btn-outline"><i class="fa-solid fa-user"></i> Login</a>
      </div>
    </div>
    <div class="hero-visual">
      <div class="book-stack">
        <div class="book-card-hero b1">
          <div class="book-cover" style="background:linear-gradient(135deg,#f6a623,#f05e23);">
            <i class="fa-solid fa-dragon"></i><span>Fantasy</span>
          </div>
        </div>
        <div class="book-card-hero b2">
          <div class="book-cover" style="background:linear-gradient(135deg,#6a3de8,#c850c0);">
            <i class="fa-solid fa-rocket"></i><span>Sci-Fi</span>
          </div>
        </div>
        <div class="book-card-hero b3">
          <div class="book-cover" style="background:linear-gradient(135deg,#11998e,#38ef7d);">
            <i class="fa-solid fa-leaf"></i><span>Nature</span>
          </div>
        </div>
        <div class="book-card-hero b4">
          <div class="book-cover main-cover" style="background:linear-gradient(135deg,#1a1a2e,#16213e);">
            <i class="fa-solid fa-book-open-reader"></i><span>Read More</span>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- ===================== BOOKS (Backend driven) ===================== -->
  <section class="featured-books" id="books">
    <div class="container">
      <div class="section-header">
        <h2 class="section-title">Our Books</h2>
        <p class="section-sub">Browse our full collection</p>
      </div>

      <!-- ======================================================
           JSP / JSTL loop — Servlet sets request attribute "books"
           Each book object must have: imageUrl, title, author, price, id
           ====================================================== -->
      <div class="books-grid">

        <c:forEach var="book" items="${books}">
          <div class="book-card">
            <div class="book-img-wrap">
              <img src="${pageContext.request.contextPath}/${book.imageUrl}"
                   alt="${book.title}"
                   class="book-img"
                   onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';"/>
              <div class="book-img-placeholder" style="display:none;">
                <i class="fa-solid fa-book"></i>
              </div>
            </div>
            <div class="book-info">
              <div class="book-genre-tag">${book.category}</div>
              <h3 class="book-title">${book.title}</h3>
              <p class="book-author"><i class="fa-solid fa-pen-nib"></i> ${book.author}</p>
              <div class="book-footer">
                <span class="book-price">&#8377; ${book.price}</span>
                <form action="${pageContext.request.contextPath}/CartServlet" method="post" style="display:inline;">
                  <input type="hidden" name="bookId"    value="${book.id}"/>
                  <input type="hidden" name="bookTitle" value="${book.title}"/>
                  <button type="submit" class="add-cart-btn">
                    <i class="fa-solid fa-cart-plus"></i> Add to Cart
                  </button>
                </form>
              </div>
            </div>
          </div>
        </c:forEach>

        <%-- Show message if no books found --%>
        <c:if test="${empty books}">
          <div class="no-books">
            <i class="fa-solid fa-box-open"></i>
            <p>No books available right now. Check back soon!</p>
          </div>
        </c:if>

      </div>
    </div>
  </section>

  <!-- ===================== ABOUT ===================== -->
  <section class="about" id="about">
    <div class="container about-inner">
      <div class="about-visual">
        <div class="about-icon-wrap">
          <i class="fa-solid fa-book-open-reader"></i>
        </div>
      </div>
      <div class="about-content">
        <span class="section-badge">About Us</span>
        <h2 class="section-title left">Welcome to <span class="highlight">Librarium</span></h2>
        <p class="about-text">Librarium is your premier online bookstore, carefully curated for readers who believe in the transformative power of books. Whether you're searching for timeless classics or modern titles, we have a shelf for every reader.</p>
        <p class="about-text">Founded with a passion for literature, we strive to make quality books accessible to everyone — from students and professionals to casual readers and lifelong learners.</p>
        <div class="about-features">
          <div class="about-feature">
            <span class="feature-icon"><i class="fa-solid fa-truck-fast"></i></span>
            <div><strong>Free Delivery</strong><small>On orders above &#8377;499</small></div>
          </div>
          <div class="about-feature">
            <span class="feature-icon"><i class="fa-solid fa-shield-halved"></i></span>
            <div><strong>Secure Payment</strong><small>100% safe checkout</small></div>
          </div>
          <div class="about-feature">
            <span class="feature-icon"><i class="fa-solid fa-rotate-left"></i></span>
            <div><strong>Easy Returns</strong><small>7-day return policy</small></div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- ===================== FOOTER ===================== -->
  <jsp:include page="components/footer.jsp"/>

  <!-- Toast Notification -->
  <div class="toast" id="toast">
    <i class="fa-solid fa-circle-check"></i>
    <span id="toastMsg">Added to cart!</span>
  </div>

  <!-- Floating Cart -->
  <div class="cart-float" id="cartFloat" onclick="window.location='cart.jsp'">
    <i class="fa-solid fa-cart-shopping"></i>
    <span class="cart-count" id="cartCount">0</span>
  </div>

  <script src="${pageContext.request.contextPath}/js/index.js"></script>
</body>
</html>