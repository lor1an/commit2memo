package com.com2mem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.com2mem.model.Usr;
import com.com2mem.service.UserService;

@RestController
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/users", method = RequestMethod.POST)
    public Usr addUser(@RequestBody Usr user) {
        return userService.addUser(user);
    }

    @RequestMapping(value = "/users", method = RequestMethod.PUT)
    public void updateUser(@RequestBody Usr user) {
        userService.editUser(user);
    }
    
    @RequestMapping(value = "/users/{id}", method = RequestMethod.GET)
    public Usr updateUser(@PathVariable Long id) {
       return userService.getUserById(id);
    }

}
