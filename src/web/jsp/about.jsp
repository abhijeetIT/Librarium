<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>About – Librarium</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/about.css"/>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600;700;900&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>
<body>

<jsp:include page="components/navbar.jsp"/>

<!-- ── HERO BANNER ── -->
<section class="about-hero">
  <div class="container">
    <span class="section-badge">College Project</span>
    <h1 class="about-hero-title">About <span class="highlight">Librarium</span></h1>
    <p class="about-hero-sub">An online bookstore built as a full-stack Java Web Application for academic purposes.</p>
  </div>
</section>

<!-- ── WHAT IS LIBRARIUM ── -->
<section class="about-section">
  <div class="container about-two-col">
    <div class="about-text-block">
      <h2>What is Librarium?</h2>
      <p>
        <strong>Librarium</strong> is a full-stack online bookstore web application developed as a
        college project using <strong>Java Servlets, JSP (JavaServer Pages), and MySQL</strong>.
        The name "Librarium" is inspired by the Latin word for library — reflecting our goal of
        making books accessible to every reader.
      </p>
      <p>
        The application allows users to browse books by category and author, search across the
        entire catalogue, add books to a shopping cart, place orders, and manage their profile —
        all through a clean, responsive web interface.
      </p>
    </div>
    <div class="about-icon-block">
      <div class="about-big-icon">
        <i class="fa-solid fa-book-open-reader"></i>
      </div>
    </div>
  </div>
</section>

<!-- ── HOW IT WORKS ── -->
<section class="about-section bg-alt">
  <div class="container">
    <div class="section-header">
      <h2 class="section-title">How It Works</h2>
      <p class="section-sub">A simple end-to-end flow from browsing to ordering</p>
    </div>
    <div class="how-grid">
      <div class="how-card">
        <div class="how-icon"><i class="fa-solid fa-user-plus"></i></div>
        <h3>1. Register</h3>
        <p>Create a free account with your name, email, phone, and address.</p>
      </div>
      <div class="how-card">
        <div class="how-icon"><i class="fa-solid fa-magnifying-glass"></i></div>
        <h3>2. Browse & Search</h3>
        <p>Explore books by category or author, or search by title, author, or genre.</p>
      </div>
      <div class="how-card">
        <div class="how-icon"><i class="fa-solid fa-cart-plus"></i></div>
        <h3>3. Add to Cart</h3>
        <p>Select your books and add them to your session-based shopping cart.</p>
      </div>
      <div class="how-card">
        <div class="how-icon"><i class="fa-solid fa-bag-shopping"></i></div>
        <h3>4. Checkout</h3>
        <p>Confirm your delivery address, choose a payment mode, and place your order.</p>
      </div>
      <div class="how-card">
        <div class="how-icon"><i class="fa-solid fa-box"></i></div>
        <h3>5. Order Saved</h3>
        <p>Your order is stored in the database and linked to your account.</p>
      </div>
      <div class="how-card">
        <div class="how-icon"><i class="fa-solid fa-circle-user"></i></div>
        <h3>6. Manage Profile</h3>
        <p>View your order history and update your personal information anytime.</p>
      </div>
    </div>
  </div>
</section>

<!-- ── TECH STACK ── -->
<section class="about-section">
  <div class="container">
    <div class="section-header">
      <h2 class="section-title">Tech Stack</h2>
      <p class="section-sub">Technologies used to build this project</p>
    </div>
    <div class="tech-grid">
      <div class="tech-card">
        <i class="fa-brands fa-java"></i>
        <span>Java Servlets</span>
      </div>
      <div class="tech-card">
        <i class="fa-solid fa-file-code"></i>
        <span>JSP / JSTL</span>
      </div>
      <div class="tech-card">
        <i class="fa-solid fa-database"></i>
        <span>MySQL</span>
      </div>
      <div class="tech-card">
        <i class="fa-brands fa-html5"></i>
        <span>HTML5 / CSS3</span>
      </div>
      <div class="tech-card">
        <i class="fa-brands fa-js"></i>
        <span>JavaScript</span>
      </div>
      <div class="tech-card">
        <i class="fa-solid fa-server"></i>
        <span>Apache Tomcat 9</span>
      </div>
    </div>
  </div>
</section>

<!-- ── FEATURES ── -->
<section class="about-section bg-alt">
  <div class="container">
    <div class="section-header">
      <h2 class="section-title">Features</h2>
      <p class="section-sub">What this project covers</p>
    </div>
    <div class="features-list">
      <div class="feature-item"><i class="fa-solid fa-circle-check"></i> User Registration and Login with session management</div>
      <div class="feature-item"><i class="fa-solid fa-circle-check"></i> Search books by title, author, or category</div>
      <div class="feature-item"><i class="fa-solid fa-circle-check"></i> Browse books by genre and author</div>
      <div class="feature-item"><i class="fa-solid fa-circle-check"></i> Session-based shopping cart with add/remove</div>
      <div class="feature-item"><i class="fa-solid fa-circle-check"></i> Checkout with delivery address and payment selection</div>
      <div class="feature-item"><i class="fa-solid fa-circle-check"></i> Order stored in database with one-to-many user relation</div>
      <div class="feature-item"><i class="fa-solid fa-circle-check"></i> Order confirmation page with order summary</div>
      <div class="feature-item"><i class="fa-solid fa-circle-check"></i> Profile page — edit name, phone, address</div>
      <div class="feature-item"><i class="fa-solid fa-circle-check"></i> Order history per user</div>
      <div class="feature-item"><i class="fa-solid fa-circle-check"></i> Delete account feature</div>
      <div class="feature-item"><i class="fa-solid fa-circle-check"></i> Responsive design — mobile and desktop</div>
      <div class="feature-item"><i class="fa-solid fa-circle-check"></i> Cart item count badge in navbar</div>
      <div class="feature-item"><i class="fa-solid fa-circle-check"></i> Reusable navbar and footer via JSP include</div>
    </div>
  </div>
</section>

<!-- ── TEAM ── -->
<section class="about-section">
  <div class="container">
    <div class="section-header">
      <h2 class="section-title">The Team</h2>
      <p class="section-sub">Built with passion as a college project</p>
    </div>
    <div class="team-grid">

      <!-- Developer -->
      <div class="team-card">
        <div class="team-avatar"><i class="fa-solid fa-code"></i></div>
        <h3 class="team-name">Abhijeet Jha</h3>
        <p class="team-role">Backend & Frontend Developer</p>
        <p class="team-desc">Handled Servlet logic, database design, JSP pages, session management, and overall project architecture.</p>
        <div class="team-links">
          <a href="http://www.linkedin.com/in/abhijeet-jha19" target="_blank" class="team-link linkedin">
            <i class="fa-brands fa-linkedin"></i> LinkedIn
          </a>
          <a href="https://github.com/abhijeetIT" target="_blank" class="team-link github">
            <i class="fa-brands fa-github"></i> GitHub
          </a>
          <a href="mailto:abhijeetj4324@gmail.com" class="team-link email">
            <i class="fa-solid fa-envelope"></i> Email
          </a>
        </div>
      </div>

      <!-- Frontend Collaborator -->
      <div class="team-card">
        <div class="team-avatar collab"><i class="fa-solid fa-palette"></i></div>
        <h3 class="team-name">Sabuj</h3>
        <p class="team-role">Frontend Collaborator</p>
        <p class="team-desc">Contributed to the frontend design, UI layout, and visual styling of the Librarium web interface.</p>
        <div class="team-links">
          <a href="https://github.com/sabuj750" target="_blank" class="team-link github">
            <i class="fa-brands fa-github"></i> GitHub
          </a>
        </div>
      </div>

    </div>
  </div>
</section>

<!-- ── COLLEGE NOTE ── -->
<section class="about-section college-note-section">
  <div class="container">
    <div class="college-note">
      <i class="fa-solid fa-graduation-cap"></i>
      <div>
        <h3>Academic Project</h3>
        <p>
          Librarium is developed purely for <strong>educational purposes</strong> as part of a
          college curriculum on Java Web Development. It demonstrates core concepts of
          <strong>MVC architecture</strong>, <strong>JDBC database connectivity</strong>,
          <strong>HTTP session management</strong>, and <strong>responsive UI design</strong>
          using standard Java EE technologies.
        </p>
      </div>
    </div>
  </div>
</section>

<jsp:include page="components/footer.jsp"/>
<script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>
