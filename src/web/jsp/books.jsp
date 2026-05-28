<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Books – Librarium</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/books.css"/>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600;700;900&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>
<body>

<jsp:include page="components/navbar.jsp"/>

<%--
  BooksServlet must set:
    request.setAttribute("featuredBooks", List<Book>)   — top 5 books
    request.setAttribute("authors",       List<String>) — distinct authors
    request.setAttribute("activePage",    "books")
--%>

<!-- ── FEATURED BOOKS (top 5) ── -->
<section class="books-section" id="featured">
  <div class="container">
    <div class="section-header">
      <h2 class="section-title">Featured Books</h2>
      <p class="section-sub">Top picks from our collection</p>
    </div>

    <div class="books-grid">
      <c:forEach var="book" items="${featuredBooks}">
        <div class="book-card">
          <div class="book-img-wrap">
            <img src="${pageContext.request.contextPath}/${book.imageUrl}"
                 alt="${book.title}"
                 class="book-img"
                 onerror="this.style.display='none';this.nextElementSibling.style.display='flex';"/>
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
              <form action="${pageContext.request.contextPath}/cart" method="post" style="display:inline;">
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

      <c:if test="${empty featuredBooks}">
        <p class="no-data">No featured books available.</p>
      </c:if>
    </div>
  </div>
</section>

<!-- ── AUTHORS ── -->
<section class="books-section bg-alt" id="authors">
  <div class="container">
    <div class="section-header">
      <h2 class="section-title">Our Authors</h2>
      <p class="section-sub">Browse books by author</p>
    </div>

    <div class="author-list">
      <c:forEach var="author" items="${authors}">
        <a href="${pageContext.request.contextPath}/search?q=${author}&type=author"
           class="author-row">
          <div class="author-row-icon"><i class="fa-solid fa-user-pen"></i></div>
          <span>${author}</span>
          <i class="fa-solid fa-arrow-right author-row-arrow"></i>
        </a>
      </c:forEach>

      <c:if test="${empty authors}">
        <p class="no-data">No authors found.</p>
      </c:if>
    </div>
  </div>
</section>

<jsp:include page="components/footer.jsp"/>

<script src="${pageContext.request.contextPath}/js/books.js"></script>
</body>
</html>
