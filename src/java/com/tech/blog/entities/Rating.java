package com.tech.blog.entities;

public class Rating 
{
    private int id;
    private String userName;
    private String review;
    private int postId;  
    private String ratingValue;  

    public Rating() {
    }

    public Rating(int id, String userName, String review, int postId , String ratingValue) {
        this.id = id;
        this.userName = userName;
        this.review = review;
        this.postId = postId;
        this.ratingValue = ratingValue;
    }

    public Rating(String userName, String review, int postId , String ratingValue) {
        this.userName = userName;
        this.review = review;
        this.postId = postId;
        this.ratingValue = ratingValue;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public String getRatingValue() {
        return ratingValue;
    }

    public void setRatingValue(String ratingValue) {
        this.ratingValue = ratingValue;
    }
    
    
}
