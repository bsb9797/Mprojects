package com.quizportal.model;
 
public class Quiz {
 
    private int id;
    private String title;
    private String category;
    private boolean published;
 
    public int getId() {
        return id;
    }
 
    public void setId(int id) {
        this.id = id;
    }
 
    public String getTitle() {
        return title;
    }
 
    public void setTitle(String title) {
        this.title = title;
    }
 
    public String getCategory() {
        return category;
    }
 
    public void setCategory(String category) {
        this.category = category;
    }
 
    public boolean isPublished() {
        return published;
    }
 
    public void setPublished(boolean published) {
        this.published = published;
    }
}
 