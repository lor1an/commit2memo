package com.com2mem.common.service;

import java.util.List;

import com.com2mem.common.model.User;

public interface UserService {

    User addUser(final User user);

    User getUserByUsername(final String login);

    User getUserById(final Long usrId);

    void updateUser(final User user);
    
    List<User> getAllUsers();
    
    boolean isUserExist(User user);
    
    void saveUser(User user);
    
    void deleteUserById(Long id);
    
    void deleteAllUsers();

}
