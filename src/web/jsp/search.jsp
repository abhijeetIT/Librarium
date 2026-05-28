<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Search Results – Librarium</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/search.css"/>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600;700;900&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>
<body>

<jsp:include page="components/navbar.jsp"/>

<%--
  SearchServlet must set:
    request.setAttribute("results",   List<Book>)   — list of matching books
    request.setAttribute("query",     String)        — the search term
    request.setAttribute("type",      String)        — "title" | "author" | "category" | "all"
    request.setAttribute("totalCount",Integer)       — total results count
--%>

<div class="search-page">
  <div class="container">

    <!-- Header -->
    <div class="search-header">
      <div class="search-meta">
        <h2>
          <c:choose>
            <c:when test="${not empty query}">
              Results for <span class="query-highlight">"${query}"</span>
            </c:when>
            <c:otherwise>All Books</c:otherwise>
          </c:choose>
        </h2>
        <p class="result-count">
          <c:choose>
            <c:when test="${not empty results}">
              ${totalCount} book<c:if test="${totalCount != 1}">s</c:if> found
            </c:when>
            <c:otherwise>No results</c:otherwise>
          </c:choose>
        </p>
      </div>

      <!-- Inline search bar on results page -->
      <form class="search-refine" action="${pageContext.request.contextPath}/search" method="get">
        <input type="text" name="q" placeholder="Refine search..." value="${query}"/>
        <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
      </form>
    </div>

    <!-- Results grid -->
    <c:choose>
      <c:when test="${not empty results}">
        <div class="search-grid">
          <c:forEach var="book" items="${results}">
            <div class="search-book-card">
              <div class="search-book-img">
                <img src="${pageContext.request.contextPath}/${book.imageUrl}"
                     alt="${book.title}"
                     onerror="this.style.display='none';this.nextElementSibling.style.display='flex';"/>
                <div class="img-fallback" style="display:none;">
                  <i class="fa-solid fa-book"></i>
                </div>
              </div>
              <div class="search-book-info">
                <span class="search-book-cat">${book.category}</span>
                <h3 class="search-book-title">${book.title}</h3>
                <p class="search-book-author"><i class="fa-solid fa-pen-nib"></i> ${book.author}</p>
                <p class="search-book-desc">${book.description}</p>
                <div class="search-book-footer">
                  <span class="search-book-price">&#8377; ${book.price}</span>
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
        </div>
      </c:when>
      <c:otherwise>
        <div class="search-empty">
          <i class="fa-solid fa-magnifying-glass"></i>
          <h3>No results found</h3>
          <p>Try a different title, author, or category.</p>
          <a href="${pageContext.request.contextPath}/home" class="btn btn-outline">Back to Home</a>
        </div>
      </c:otherwise>
    </c:choose>

  </div>
</div>

<jsp:include page="components/footer.jsp"/>

<script src="${pageContext.request.contextPath}/js/search.js"></script>
</body>
</html>
