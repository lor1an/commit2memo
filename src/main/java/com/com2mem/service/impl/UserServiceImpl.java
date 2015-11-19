package com.com2mem.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.com2mem.model.Usr;
import com.com2mem.repository.UsrRepository;
import com.com2mem.service.UserService;

@Service(value = "userService")
public class UserServiceImpl implements UserService {

    @Autowired
    UsrRepository userRepository;

    @Override
    public Usr addUser(final Usr user) {
        return userRepository.save(user);
    }

    @Override
    public Usr getUserByLogin(final String login) {
        List<Usr> usrList = userRepository.findByLogin(login);
        Usr user = usrList == null ? null : usrList.get(0);
        return user;
    }

    @Override
    public Usr getUserById(final Long usrId) {
        return userRepository.findOne(usrId);
    }

    @Override
    public void updateUser(Usr user) {
        userRepository.save(user);
    }

    @Override
    public List<Usr> getAllUsers() {
        return (List<Usr>) userRepository.findAll();
    }

    @Override
    public boolean isUserExist(Usr user) {
        if (user.getUsrId() != null) {
            return getUserById(user.getUsrId()) != null;
        }
        return false;
    }

    @Override
    public void saveUser(Usr user) {
        userRepository.save(user);
    }

    @Override
    public void deleteUserById(Long id) {
        userRepository.delete(id);
    }

    @Override
    public void deleteAllUsers() {
        userRepository.deleteAll();
    }

}
