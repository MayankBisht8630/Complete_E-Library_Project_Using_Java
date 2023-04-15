package com.tech.blog.entities;

public class Comment 
{
    private int id;
    private String name;
    private String comment;
    private int postId;

    public Comment() {
    }

    public Comment(int id, String name, String comment, int postId) {
        this.id = id;
        this.name = name;
        this.comment = comment;
        this.postId = postId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public Comment(String name, String comment, int postId) {
        this.name = name;
        this.comment = comment;
        this.postId = postId;
    }
    
    
}
