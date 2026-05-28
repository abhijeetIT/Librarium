<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>My Profile – Librarium</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css"/>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700;900&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>
<body>

<jsp:include page="components/navbar.jsp"/>

<div class="page-wrap">
  <div class="container">

    <div class="page-header">
      <h2 class="page-title">My Profile</h2>
    </div>

    <c:if test="${not empty success}">
      <div class="auth-alert auth-alert-success"><i class="fa-solid fa-circle-check"></i> ${success}</div>
    </c:if>
    <c:if test="${not empty error}">
      <div class="auth-alert auth-alert-error"><i class="fa-solid fa-circle-exclamation"></i> ${error}</div>
    </c:if>

    <div class="profile-layout">

      <!-- ── Left: Personal Info + Edit -->
      <div class="profile-left">
        <div class="profile-avatar">
          <i class="fa-solid fa-circle-user"></i>
          <div>
            <h3>${sessionScope.loggedInUser.name}</h3>
            <p>${sessionScope.loggedInUser.email}</p>
          </div>
        </div>

        <form action="${pageContext.request.contextPath}/profile" method="post" class="profile-form">
          <input type="hidden" name="action" value="update"/>

          <div class="form-group">
            <label>Full Name</label>
            <input type="text" name="name" value="${sessionScope.loggedInUser.name}" required/>
          </div>

          <div class="form-group">
            <label>Email</label>
            <input type="email" value="${sessionScope.loggedInUser.email}" disabled
                   title="Email cannot be changed"/>
          </div>

          <div class="form-group">
            <label>Phone</label>
            <input type="tel" name="phone" value="${sessionScope.loggedInUser.phone}"
                   placeholder="+91 00000 00000"/>
          </div>

          <div class="form-group">
            <label>Address</label>
            <textarea name="address" rows="3"
                      placeholder="Your delivery address">${sessionScope.loggedInUser.address}</textarea>
          </div>

          <button type="submit" class="profile-save-btn">
            <i class="fa-solid fa-floppy-disk"></i> Save Changes
          </button>
        </form>

        <!-- Delete account -->
        <form action="${pageContext.request.contextPath}/profile" method="post"
              onsubmit="return confirm('Are you sure? This will permanently delete your account.');">
          <input type="hidden" name="action" value="delete"/>
          <button type="submit" class="delete-btn">
            <i class="fa-solid fa-trash"></i> Delete Account
          </button>
        </form>
      </div>

      <!-- ── Right: Order history -->
      <div class="profile-right">
        <h3 class="orders-heading">My Orders</h3>

        <c:choose>
          <c:when test="${not empty orders}">
            <div class="orders-list">
              <c:forEach var="order" items="${orders}">
                <div class="order-row">
                  <div class="order-row-left">
                    <span class="order-id">#${order.id}</span>
                    <div>
                      <p class="order-book-title">${order.bookTitle}</p>
                      <p class="order-meta">
                        Qty: ${order.quantity} &nbsp;|&nbsp;
                        ${order.paymentMode} &nbsp;|&nbsp;
                        <fmt:formatDate value="${order.orderedAt}" pattern="dd MMM yyyy"/>
                      </p>
                    </div>
                  </div>
                  <div class="order-row-right">
                    <span class="order-price">&#8377; <fmt:formatNumber value="${order.totalPrice}" pattern="#,##0.00"/></span>
                    <span class="order-status status-${order.status.toLowerCase()}">${order.status}</span>
                  </div>
                </div>
              </c:forEach>
            </div>
          </c:when>
          <c:otherwise>
            <div class="orders-empty">
              <i class="fa-solid fa-box-open"></i>
              <p>No orders yet.</p>
              <a href="${pageContext.request.contextPath}/books" class="btn btn-primary">Shop Now</a>
            </div>
          </c:otherwise>
        </c:choose>
      </div>

    </div>
  </div>
</div>

<jsp:include page="components/footer.jsp"/>
<script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>
