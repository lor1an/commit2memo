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
        // if(userRepository.findByLogin(login) == null){
        return userRepository.save(user);
        /*
         * }else{ throw new IllegalArgumentException("Login is taken"); }
         */

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
    public void editUser(final Usr user) {
        userRepository.save(user);
    }

}
