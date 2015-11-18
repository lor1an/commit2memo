package com.com2mem.service;

import java.util.List;

import com.com2mem.model.Usr;

public interface UserService {

    Usr addUser(final Usr user);

    Usr getUserByLogin(final String login);

    Usr getUserById(final Long usrId);

    void updateUser(final Usr user);
    
    List<Usr> getAllUsers();
    
    boolean isUserExist(Usr user);
    
    void saveUser(Usr user);
    
    void deleteUserById(Long id);
    
    void deleteAllUsers();

}
