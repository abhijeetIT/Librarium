package model;

import java.sql.Timestamp;

public class Order {

    private int       id;
    private int       userId;
    private int       bookId;
    private String    bookTitle;
    private int       quantity;
    private double    totalPrice;
    private String    address;
    private String    phone;
    private String    paymentMode;   // "COD" | "UPI" | "CARD"
    private String    status;        // "PLACED" | "SHIPPED" | "DELIVERED"
    private Timestamp orderedAt;

    //for admin panel only
    private String userName;
    private String userEmail;

    public Order() {}

    // getters and setters
    public int       getId()           { return id; }
    public void      setId(int id)     { this.id = id; }

    public int       getUserId()              { return userId; }
    public void      setUserId(int userId)    { this.userId = userId; }

    public int       getBookId()              { return bookId; }
    public void      setBookId(int bookId)    { this.bookId = bookId; }

    public String    getBookTitle()                   { return bookTitle; }
    public void      setBookTitle(String bookTitle)   { this.bookTitle = bookTitle; }

    public int       getQuantity()                { return quantity; }
    public void      setQuantity(int quantity)    { this.quantity = quantity; }

    public double    getTotalPrice()                    { return totalPrice; }
    public void      setTotalPrice(double totalPrice)   { this.totalPrice = totalPrice; }

    public String    getAddress()                 { return address; }
    public void      setAddress(String address)   { this.address = address; }

    public String    getPhone()               { return phone; }
    public void      setPhone(String phone)   { this.phone = phone; }

    public String    getPaymentMode()                     { return paymentMode; }
    public void      setPaymentMode(String paymentMode)   { this.paymentMode = paymentMode; }

    public String    getStatus()                { return status; }
    public void      setStatus(String status)   { this.status = status; }

    public Timestamp getOrderedAt()                   { return orderedAt; }
    public void      setOrderedAt(Timestamp orderedAt){ this.orderedAt = orderedAt; }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }
}
