# 📚 Librarium – Online Book Store

Librarium is a modern Java-based online bookstore web application built using **JSP, Servlets, JDBC, MySQL, HTML, CSS, and JavaScript**.

The platform allows users to browse books, search by category/author/title, manage cart items, place orders, and manage their profiles.

---

# 🚀 Features

## 👤 Authentication

* User Registration
* User Login
* Session-based Authentication
* Logout Functionality

---

## 📖 Book Management

* Browse all books
* Featured books section
* Multiple categories:

    * Fiction
    * Science Fiction
    * Mathematics
    * NCERT
    * History
    * Philosophy
    * Self-help
    * Biography

---

## 🔍 Smart Search System

Users can search books by:

* Book Title
* Author Name
* Category

### Example Searches

* `Dune`
* `Rabindranath Tagore`
* `Science Fiction`
* `Mathematics`

---

## 🛒 Cart System

### Flow

Add to Cart → POST `/cart?action=add`
↓
Book added to Session `List<CartItem>`
↓
Navbar cart badge updates

View Cart → GET `/cart`
↓
Displays:

* Cart items
* Quantity
* Total price
* Remove buttons

Remove Item → POST `/cart?action=remove`

---

## 💳 Checkout System

Checkout → GET `/checkout`
↓
Pre-filled user details

Place Order → POST `/checkout`
↓
Order saved into database
↓
Cart cleared
↓
Redirect to confirmation page

---

## 📦 Order System

* Order history
* Order confirmation page
* Order status
* COD payment support

---

## 👤 User Profile

### Features

* View profile
* Edit profile
* Delete account
* View previous orders

---

# 🧠 Search Architecture

## Global Search

Navbar Search Bar:
GET `/search?q=Dune`

↓

`SearchServlet.doGet()`

↓

```sql
WHERE title LIKE '%Dune%'
OR author LIKE '%Dune%'
OR category LIKE '%Dune%'
```

↓

Results rendered in:
`search.jsp`

---

## Category Search

GET `/search?q=Fiction&type=category`

↓

```sql
WHERE LOWER(category) = LOWER('Fiction')
```

---

## Author Search

GET `/search?q=Paulo Coelho&type=author`

↓

```sql
WHERE author LIKE '%Paulo Coelho%'
```

---

# 🏗️ Tech Stack

## Backend

* Java
* JSP
* Servlets
* JDBC
* MySQL

## Frontend

* HTML5
* CSS3
* JavaScript
* JSTL

## Server

* Apache Tomcat 9

---

# 📂 Project Structure

```text
Librarium/
│
├── src/
│   ├── controller/
│   ├── dao/
│   ├── model/
│   └── util/
│
├── webapp/
│   ├── css/
│   ├── js/
│   ├── jsp/
│   ├── components/
│   └── images/
```

---

# 📄 Important JSP Pages

* `index.jsp`
* `login.jsp`
* `register.jsp`
* `search.jsp`
* `cart.jsp`
* `checkout.jsp`
* `order-confirm.jsp`
* `profile.jsp`

---

# ⚙️ Main Servlets

* `HomeServlet`
* `LoginServlet`
* `RegisterServlet`
* `SearchServlet`
* `CartServlet`
* `CheckoutServlet`
* `OrderServlet`
* `ProfileServlet`

---

# 🗄️ DAO Classes

* `BookDAO`
* `UserDAO`
* `CartDAO`
* `OrderDAO`

---

# 🧩 Database Schema

## Users Table

```sql
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    phone VARCHAR(20),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

---

## Books Table

```sql
CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(255),
    category VARCHAR(100),
    price DOUBLE,
    image_url VARCHAR(500),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

---

## Orders Table

```sql
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    book_title VARCHAR(255),
    quantity INT NOT NULL DEFAULT 1,
    total_price DOUBLE NOT NULL,
    address TEXT,
    phone VARCHAR(20),
    payment_mode VARCHAR(20) DEFAULT 'COD',
    status VARCHAR(20) DEFAULT 'PLACED',
    ordered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE CASCADE
);
```

---

# 📘 Sample SQL Insert Books

```sql
INSERT INTO books(title, author, category, price, image_url)
VALUES
('NCERT Mathematics Class 9', 'NCERT', 'Mathematics', 299, 'images/math9.jpg'),

('NCERT Science Class 10', 'NCERT', 'Science', 349, 'images/science10.jpg'),

('Dune', 'Frank Herbert', 'Science Fiction', 599, 'images/dune.jpg'),

('Gitanjali', 'Rabindranath Tagore', 'Poetry', 249, 'images/gitanjali.jpg'),

('The Alchemist', 'Paulo Coelho', 'Fiction', 399, 'images/alchemist.jpg');
```

---

# 🎨 Frontend Features

* Responsive Design
* Modern Book Cards
* Hover Animations
* Toast Notifications
* Dynamic Navbar
* Floating Cart Button
* Pagination UI
* Search Result Layout
* Mobile Friendly UI

---

# 🤝 Collaboration

## Frontend Collaboration

GitHub:
https://github.com/sabuj750

---

# 👨‍💻 Developer

## Abhijeet Jha

LinkedIn:
http://www.linkedin.com/in/abhijeet-jha19

Email:
[abhijeetj4324@gmail.com](mailto:abhijeetj4324@gmail.com)

---

# 📌 Future Improvements

* Admin Panel
* Payment Gateway Integration
* Wishlist System
* Book Reviews & Ratings
* PDF Preview
* Recommendation Engine
* JWT Authentication
* Spring Boot Migration

---

# ⭐ Conclusion

Librarium is a full-stack Java web application demonstrating:

* MVC Architecture
* JDBC Connectivity
* Session Management
* Dynamic JSP Rendering
* Search & Filter System
* E-commerce Cart Flow
* CRUD Operations

Designed for learning modern Java backend development with real-world project structure.
