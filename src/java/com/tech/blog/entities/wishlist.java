package com.tech.blog.entities;

public class wishlist 
{
    int Sno;
    String bookname;
    String authorname;

    public wishlist(int Sno, String bookname, String authorname) {
        this.Sno = Sno;
        this.bookname = bookname;
        this.authorname = authorname;
    }

    public wishlist() {
    }

    public int getSno() {
        return Sno;
    }

    public void setSno(int Sno) {
        this.Sno = Sno;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public String getAuthorname() {
        return authorname;
    }

    public void setAuthorname(String authorname) {
        this.authorname = authorname;
    }

    public wishlist(String bookname, String authorname) {
        this.bookname = bookname;
        this.authorname = authorname;
    }
    
    
}
