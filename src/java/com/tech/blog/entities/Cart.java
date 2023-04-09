package com.tech.blog.entities;

public class Cart 
{
    private int cid;
    private int bid;
    private int uid;
    private String book_name;
    private String author;
    private int quantity;

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Cart() 
    {
        
    }

    public Cart(int cid, int bid, int uid, String book_name, String author, int quantity) {
        this.cid = cid;
        this.bid = bid;
        this.uid = uid;
        this.book_name = book_name;
        this.author = author;
        this.quantity = quantity;
    }
    
    
}
