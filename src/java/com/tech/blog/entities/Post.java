package com.tech.blog.entities;

public class Post 
{
    private int pid;
    private String pTitle;
    private String pContent;
    private String pCode;
    private String pPic;
    private int catId;
    private int userId;
    private int pQuantity;
    
    public Post()
    {
        
    }

    public Post(int pid, String pTitle, int userId, int pQuantity) {
        this.pid = pid;
        this.pTitle = pTitle;
        this.userId = userId;
        this.pQuantity = pQuantity;
    }

    public Post(int pid, String pTitle, int pQuantity) {
        this.pid = pid;
        this.pTitle = pTitle;
        this.pQuantity = pQuantity;
    }

    public Post(String pTitle, String pContent, String pCode, String pPic, int catId, int userId, int pQuantity) {
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pPic = pPic;
        this.catId = catId;
        this.userId = userId;
        this.pQuantity = pQuantity;
    }
    
    public Post(int pid, String pTitle, String pPic, int userId, int pQuantity) {
        this.pid = pid;
        this.pTitle = pTitle;
        this.pPic = pPic;
        this.userId = userId;
        this.pQuantity = pQuantity;
    }

    public Post(int pid, String pTitle, String pContent, String pCode, String pPic, int catId , int userId) {
        this.pid = pid;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pPic = pPic;
        this.catId = catId;
        this.userId = userId;
    }

    public Post(String pTitle, String pContent, String pCode, String pPic, int catId , int userId) {
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pPic = pPic;
        this.catId = catId;
        this.userId = userId;
    }

    public Post(int pid, String pTitle, String pContent, String pCode, String pPic, int catId, int userId, int pQuantity) {
        this.pid = pid;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pPic = pPic;
        this.catId = catId;
        this.userId = userId;
        this.pQuantity = pQuantity;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public String getpCode() {
        return pCode;
    }

    public void setpCode(String pCode) {
        this.pCode = pCode;
    }

    public String getpPic() {
        return pPic;
    }

    public void setpPic(String pPic) {
        this.pPic = pPic;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    public int getpQuantity() {
        return pQuantity;
    }

    public void setpQuantity(int pQuantity) {
        this.pQuantity = pQuantity;
    }
}
