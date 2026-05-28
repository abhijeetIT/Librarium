package model;

public class CartItem {

    private int    bookId;
    private String title;
    private String author;
    private String imageUrl;
    private double price;
    private int    quantity;

    public CartItem() {}

    public CartItem(int bookId, String title, String author,
                    String imageUrl, double price, int quantity) {
        this.bookId   = bookId;
        this.title    = title;
        this.author   = author;
        this.imageUrl = imageUrl;
        this.price    = price;
        this.quantity = quantity;
    }

    // total for this line item
    public double getSubtotal() {
        return price * quantity;
    }

    public int    getBookId()   { return bookId; }
    public void   setBookId(int bookId) { this.bookId = bookId; }

    public String getTitle()    { return title; }
    public void   setTitle(String title) { this.title = title; }

    public String getAuthor()   { return author; }
    public void   setAuthor(String author) { this.author = author; }

    public String getImageUrl() { return imageUrl; }
    public void   setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }

    public double getPrice()    { return price; }
    public void   setPrice(double price) { this.price = price; }

    public int    getQuantity() { return quantity; }
    public void   setQuantity(int quantity) { this.quantity = quantity; }
}
