package com.com2mem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.com2mem.model.User;
import com.com2mem.service.UserService;

@RestController
public class UserController {

    @Autowired
    UserService userService;

    //
    // @RequestMapping(value = "/usrs", method = RequestMethod.POST)
    // public User addUser(@RequestBody User user) {
    // return userService.addUser(user);
    // }
    //
    // /* @RequestMapping(value = "/usrs", method = RequestMethod.PUT)
    // public void updateUser(@RequestBody Usr user) {
    // userService.editUser(user);
    // }*/
    //
    // @RequestMapping(value = "/usrs/{id}", method = RequestMethod.GET)
    // public User updateUser(@PathVariable Long id) {
    // return userService.getUserById(id);
    // }

    @RequestMapping(value = "/user/", method = RequestMethod.POST)
    public void createUser(@RequestBody User user) {

      /*  if (userService.isUserExist(user)) {
            System.out.println("A User with name " + user.getUsername()
                    + " already exist");
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }*/

       userService.addUser(user);
/*
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/user/{id}")
                .buildAndExpand(user.getUserId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);*/
    }

}
