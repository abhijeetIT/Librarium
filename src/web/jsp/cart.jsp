<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>My Cart – Librarium</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css"/>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700;900&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>
<body>

<jsp:include page="components/navbar.jsp"/>

<div class="page-wrap">
  <div class="container">

    <div class="page-header">
      <h2 class="page-title">My Cart</h2>
      <span class="page-sub">
        <c:choose>
          <c:when test="${not empty cart}">${cart.size()} item(s)</c:when>
          <c:otherwise>Empty</c:otherwise>
        </c:choose>
      </span>
    </div>

    <c:choose>
      <c:when test="${not empty cart}">
        <div class="cart-layout">

          <!-- ── Cart items list -->
          <div class="cart-items">
            <c:forEach var="item" items="${cart}">
              <div class="cart-row">
                <div class="cart-img">
                  <img src="${pageContext.request.contextPath}/${item.imageUrl}"
                       alt="${item.title}"
                       onerror="this.style.display='none';this.nextElementSibling.style.display='flex';"/>
                  <div class="cart-img-fallback" style="display:none;">
                    <i class="fa-solid fa-book"></i>
                  </div>
                </div>
                <div class="cart-info">
                  <h4 class="cart-item-title">${item.title}</h4>
                  <p class="cart-item-author">${item.author}</p>
                  <p class="cart-item-price">&#8377; <fmt:formatNumber value="${item.price}" pattern="#,##0.00"/></p>
                  <div class="cart-qty-row">
                    <span class="qty-label">Qty: ${item.quantity}</span>
                    <span class="cart-subtotal">= &#8377; <fmt:formatNumber value="${item.subtotal}" pattern="#,##0.00"/></span>
                  </div>
                </div>
                <!-- Remove button -->
                <form action="${pageContext.request.contextPath}/cart" method="post" class="cart-remove-form">
                  <input type="hidden" name="action"  value="remove"/>
                  <input type="hidden" name="bookId"  value="${item.bookId}"/>
                  <button type="submit" class="remove-btn" title="Remove">
                    <i class="fa-solid fa-trash-can"></i>
                  </button>
                </form>
              </div>
            </c:forEach>
          </div>

          <!-- ── Order summary -->
          <div class="cart-summary">
            <h3>Order Summary</h3>
            <div class="summary-row">
              <span>Subtotal</span>
              <span>&#8377; <fmt:formatNumber value="${cartTotal}" pattern="#,##0.00"/></span>
            </div>
            <div class="summary-row">
              <span>Delivery</span>
              <span class="free-tag">FREE</span>
            </div>
            <div class="summary-divider"></div>
            <div class="summary-row total-row">
              <span>Total</span>
              <span>&#8377; <fmt:formatNumber value="${cartTotal}" pattern="#,##0.00"/></span>
            </div>
            <a href="${pageContext.request.contextPath}/checkout" class="checkout-btn">
              Proceed to Checkout <i class="fa-solid fa-arrow-right"></i>
            </a>
            <a href="${pageContext.request.contextPath}/books" class="continue-link">
              ← Continue Shopping
            </a>
          </div>

        </div>
      </c:when>

      <c:otherwise>
        <div class="cart-empty">
          <i class="fa-solid fa-cart-shopping"></i>
          <h3>Your cart is empty</h3>
          <p>Looks like you haven't added anything yet.</p>
          <a href="${pageContext.request.contextPath}/books" class="btn btn-primary">Browse Books</a>
        </div>
      </c:otherwise>
    </c:choose>

  </div>
</div>

<jsp:include page="components/footer.jsp"/>
<script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>
