package com.quizportal.service;
 
import com.quizportal.dao.UserDao;
import com.quizportal.dao.UserDaoImpl;
import com.quizportal.model.User;
 
public class UserService {
 
    private final UserDao userDao = new UserDaoImpl();
 
    public boolean register(String fullName, String email, String password) {
        if (userDao.findByEmail(email) != null) {
            return false; // user already exists
        }
        User user = new User();
        user.setFullName(fullName);
        user.setEmail(email);
        // simple: store as plain text (for assignment)
        user.setPasswordHash(password);
        return userDao.create(user);
    }
 
    public User login(String email, String password) {
        User user = userDao.findByEmail(email);
        if (user != null && user.getPasswordHash().equals(password)) {
            return user;
        }
        return null;
    }
 
    public int countUsers() {
        return userDao.countAll();
    }
}