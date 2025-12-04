package com.quizportal.dao;
 
import com.quizportal.model.User;
 
public interface UserDao {
    User findByEmail(String email);
    User findById(int id);
    boolean create(User user);
    int countAll();
}