<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Librarium – Online Bookstore</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600;700;900&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>
<body>

<jsp:include page="components/navbar.jsp"/>

<!-- ── HERO ── -->
<section class="hero" id="home">
  <div class="hero-content">
    <h1 class="hero-title">Discover Your Next<br/><span class="highlight">Favorite Book</span></h1>
    <p class="hero-subtitle">Thousands of titles across every genre. Find yours today.</p>
    <div class="hero-actions">
      <a href="${pageContext.request.contextPath}/books" class="btn btn-primary"><i class="fa-solid fa-compass"></i> Browse Books</a>
      <a href="${pageContext.request.contextPath}/login" class="btn btn-outline"><i class="fa-solid fa-user"></i> Login</a>
    </div>
  </div>
  <div class="hero-visual">
    <div class="book-stack">
      <div class="book-card-hero b1"><div class="book-cover" style="background:linear-gradient(135deg,#f6a623,#f05e23);"><i class="fa-solid fa-dragon"></i><span>Fantasy</span></div></div>
      <div class="book-card-hero b2"><div class="book-cover" style="background:linear-gradient(135deg,#6a3de8,#c850c0);"><i class="fa-solid fa-rocket"></i><span>Sci-Fi</span></div></div>
      <div class="book-card-hero b3"><div class="book-cover" style="background:linear-gradient(135deg,#11998e,#38ef7d);"><i class="fa-solid fa-leaf"></i><span>Nature</span></div></div>
      <div class="book-card-hero b4"><div class="book-cover main-cover" style="background:linear-gradient(135deg,#1a1a2e,#16213e);"><i class="fa-solid fa-book-open-reader"></i><span>Read More</span></div></div>
    </div>
  </div>
</section>

<!-- ── CATEGORIES (from backend) ── -->
<%--
  Servlet: request.setAttribute("categories", List<String>)
  e.g. ["Fiction","Mystery","Sci-Fi","Romance","History","Self-Help"]
--%>
<section class="index-section" id="categories">
  <div class="container">
    <div class="section-header">
      <h2 class="section-title">Browse by Category</h2>
      <p class="section-sub">Click a category to explore all books</p>
    </div>

    <div class="cat-grid">
      <c:forEach var="cat" items="${categories}">
        <a href="${pageContext.request.contextPath}/search?q=${cat}&type=category"
           class="cat-pill">
          <i class="fa-solid fa-tag"></i> ${cat}
        </a>
      </c:forEach>

      <%-- Fallback if no backend data yet --%>
      <c:if test="${empty categories}">
        <span class="no-data">No categories found.</span>
      </c:if>
    </div>
  </div>
</section>

<!-- ── AUTHORS (from backend) ── -->
<%--
  Servlet: request.setAttribute("authors", List<String>)
  e.g. ["Paulo Coelho","James Clear","Yuval Noah Harari",...]
--%>
<section class="index-section bg-alt" id="authors">
  <div class="container">
    <div class="section-header">
      <h2 class="section-title">Popular Authors</h2>
      <p class="section-sub">Explore books by your favourite writer</p>
    </div>

    <div class="author-grid">
      <c:forEach var="author" items="${authors}">
        <a href="${pageContext.request.contextPath}/search?q=${author}&type=author"
           class="author-card">
          <div class="author-avatar">
            <i class="fa-solid fa-user-pen"></i>
          </div>
          <span class="author-name">${author}</span>
        </a>
      </c:forEach>

      <c:if test="${empty authors}">
        <span class="no-data">No authors found.</span>
      </c:if>
    </div>
  </div>
</section>

<jsp:include page="components/footer.jsp"/>

<script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>
