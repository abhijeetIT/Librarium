<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Checkout – Librarium</title>
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
      <h2 class="page-title">Checkout</h2>
      <span class="page-sub">Almost done!</span>
    </div>

    <c:if test="${not empty error}">
      <div class="auth-alert auth-alert-error">
        <i class="fa-solid fa-circle-exclamation"></i> ${error}
      </div>
    </c:if>

    <div class="checkout-layout">

      <!-- ── Delivery & Payment form -->
      <div class="checkout-form-wrap">
        <form action="${pageContext.request.contextPath}/checkout" method="post" id="checkoutForm">

          <div class="form-section">
            <h3 class="form-section-title"><i class="fa-solid fa-location-dot"></i> Delivery Details</h3>

            <div class="form-group">
              <label for="phone">Phone Number</label>
              <input type="tel" id="phone" name="phone"
                     value="${sessionScope.loggedInUser.phone}"
                     placeholder="+91 00000 00000" required/>
            </div>

            <div class="form-group">
              <label for="address">Delivery Address</label>
              <textarea id="address" name="address" rows="3"
                        placeholder="House No, Street, City, State, PIN" required>${sessionScope.loggedInUser.address}</textarea>
            </div>
          </div>

          <div class="form-section">
            <h3 class="form-section-title"><i class="fa-solid fa-credit-card"></i> Payment Mode</h3>

            <div class="payment-options">
              <label class="payment-option">
                <input type="radio" name="paymentMode" value="COD" checked/>
                <span class="payment-label">
                  <i class="fa-solid fa-money-bill-wave"></i> Cash on Delivery
                </span>
              </label>
              <label class="payment-option">
                <input type="radio" name="paymentMode" value="UPI"/>
                <span class="payment-label">
                  <i class="fa-solid fa-mobile-screen"></i> UPI
                </span>
              </label>
              <label class="payment-option">
                <input type="radio" name="paymentMode" value="CARD"/>
                <span class="payment-label">
                  <i class="fa-solid fa-credit-card"></i> Credit / Debit Card
                </span>
              </label>
            </div>
          </div>

          <button type="submit" class="checkout-btn">
            <i class="fa-solid fa-bag-shopping"></i> Place Order
          </button>
        </form>
      </div>

      <!-- ── Order summary sidebar -->
      <div class="cart-summary">
        <h3>Your Order</h3>
        <c:forEach var="item" items="${cart}">
          <div class="checkout-item-row">
            <span class="checkout-item-name">${item.title} <small>x${item.quantity}</small></span>
            <span>&#8377; <fmt:formatNumber value="${item.subtotal}" pattern="#,##0.00"/></span>
          </div>
        </c:forEach>
        <div class="summary-divider"></div>
        <div class="summary-row total-row">
          <span>Total</span>
          <span>&#8377; <fmt:formatNumber value="${cartTotal}" pattern="#,##0.00"/></span>
        </div>
      </div>

    </div>
  </div>
</div>

<jsp:include page="components/footer.jsp"/>
<script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>
