package com.quizportal.dao;
 
import com.quizportal.model.AdminUser;
 
public interface AdminDao {
    AdminUser findByEmail(String email);
}