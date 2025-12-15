package com.example.pg.entity;


import jakarta.persistence.*;
 
@Entity
@Table(name = "tenant")
public class Tenant {
 
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
 
    private String name;
 
    private String email;
 
    private String mobile;
 
    private int age;
 
    public Tenant() {
    }
 
    public Tenant(String name, String email, String mobile, int age) {
        this.name = name;
        this.email = email;
        this.mobile = mobile;
        this.age = age;
    }
 
    // getters and setters
    public Long getId() {
        return id;
    }
 
    public void setId(Long id) {
        this.id = id;
    }
 
    public String getName() {
        return name;
    }
 
    public void setName(String name) {
        this.name = name;
    }
 
    public String getEmail() {
        return email;
    }
 
    public void setEmail(String email) {
        this.email = email;
    }
 
    public String getMobile() {
        return mobile;
    }
 
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
 
    public int getAge() {
        return age;
    }
 
    public void setAge(int age) {
        this.age = age;
    }
}
 