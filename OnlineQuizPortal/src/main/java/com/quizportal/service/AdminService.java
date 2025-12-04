package com.quizportal.service;
 
import com.quizportal.dao.AdminDao;
import com.quizportal.dao.AdminDaoImpl;
import com.quizportal.model.AdminUser;
 
public class AdminService {
 
    private final AdminDao adminDao = new AdminDaoImpl();
 
    /**
     * Validates admin login.
     * @return AdminUser if credentials are correct, else null.
     */
    public AdminUser login(String email, String password) {
        AdminUser admin = adminDao.findByEmail(email);
        if (admin != null && admin.getPasswordHash().equals(password)) {
            return admin;
        }
        return null;
    }
}