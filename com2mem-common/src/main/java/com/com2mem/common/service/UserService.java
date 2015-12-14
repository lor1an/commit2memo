package com.com2mem.common.service;

import java.util.List;

import com.com2mem.common.model.User;

public interface UserService<T extends User> {

    T addUser(final T user);

    T getUserByUsername(final String login);

    T getUserById(final Long usrId);

    void updateUser(final T user);
    
    List<T> getAllUsers();
    
    boolean isUserExist(T user);
    
    void saveUser(T user);
    
    void deleteUserById(Long id);
    
    void deleteAllUsers();

}
