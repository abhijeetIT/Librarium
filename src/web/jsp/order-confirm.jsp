<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Order Confirmed – Librarium</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css"/>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700;900&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>
<body>

<jsp:include page="components/navbar.jsp"/>

<div class="page-wrap">
  <div class="container">
    <div class="confirm-wrap">

      <div class="confirm-icon">
        <i class="fa-solid fa-circle-check"></i>
      </div>
      <h2 class="confirm-title">Order Placed!</h2>
      <p class="confirm-sub">Thank you, <strong>${sessionScope.loggedInUser.name}</strong>. Your books are on their way!</p>

      <div class="confirm-card">
        <div class="confirm-row">
          <span><i class="fa-solid fa-location-dot"></i> Delivery To</span>
          <span>${orderAddress}</span>
        </div>
        <div class="confirm-row">
          <span><i class="fa-solid fa-phone"></i> Phone</span>
          <span>${orderPhone}</span>
        </div>
        <div class="confirm-row">
          <span><i class="fa-solid fa-credit-card"></i> Payment</span>
          <span>${orderPayment}</span>
        </div>
        <div class="summary-divider"></div>
        <c:forEach var="item" items="${orderedItems}">
          <div class="confirm-row">
            <span>${item.title} x${item.quantity}</span>
            <span>&#8377; <fmt:formatNumber value="${item.subtotal}" pattern="#,##0.00"/></span>
          </div>
        </c:forEach>
        <div class="summary-divider"></div>
        <div class="confirm-row total-row">
          <span>Total Paid</span>
          <span>&#8377; <fmt:formatNumber value="${orderTotal}" pattern="#,##0.00"/></span>
        </div>
      </div>

      <div class="confirm-actions">
        <a href="${pageContext.request.contextPath}/profile" class="btn btn-outline">View My Orders</a>
        <a href="${pageContext.request.contextPath}/home"    class="btn btn-primary">Continue Shopping</a>
      </div>

    </div>
  </div>
</div>

<jsp:include page="components/footer.jsp"/>
<script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>
