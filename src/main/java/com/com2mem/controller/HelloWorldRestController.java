package com.com2mem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.com2mem.model.Usr;
import com.com2mem.service.UserService;

@RestController
public class HelloWorldRestController {

    @Autowired
    UserService userService; // Service which will do all data
                             // retrieval/manipulation work

    // -------------------Retrieve All
    // Users--------------------------------------------------------

    @RequestMapping(value = "/user/", method = RequestMethod.GET)
    public ResponseEntity<List<Usr>> listAllUsers() {
        List<Usr> users = userService.getAllUsers();
        if (users.isEmpty()) {
            return new ResponseEntity<List<Usr>>(HttpStatus.NO_CONTENT);// You
                                                                        // many
                                                                        // decide
                                                                        // to
                                                                        // return
                                                                        // HttpStatus.NOT_FOUND
        }
        return new ResponseEntity<List<Usr>>(users, HttpStatus.OK);
    }

    // -------------------Retrieve Single
    // User--------------------------------------------------------

    @RequestMapping(value = "/user/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Usr> getUser(@PathVariable("id") Long id) {
        System.out.println("Fetching User with id " + id);
        Usr user = userService.getUserById(id);
        if (user == null) {
            System.out.println("User with id " + id + " not found");
            return new ResponseEntity<Usr>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Usr>(user, HttpStatus.OK);
    }

    // -------------------Create a
    // User--------------------------------------------------------

    @RequestMapping(value = "/user/", method = RequestMethod.POST)
    public ResponseEntity<Void> createUser(@RequestBody Usr user,
            UriComponentsBuilder ucBuilder) {
        System.out.println("Creating User " + user.getUsername());

        if (userService.isUserExist(user)) {
            System.out.println("A User with name " + user.getUsername()
                    + " already exist");
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }

        userService.saveUser(user);

        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/user/{id}")
                .buildAndExpand(user.getUsrId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }

    // ------------------- Update a User
    // --------------------------------------------------------

    @RequestMapping(value = "/user/{id}", method = RequestMethod.PUT)
    public ResponseEntity<Usr> updateUser(@PathVariable("id") Long id,
            @RequestBody Usr user) {
        System.out.println("Updating User " + id);

        Usr currentUser = userService.getUserById(id);

        if (currentUser == null) {
            System.out.println("User with id " + id + " not found");
            return new ResponseEntity<Usr>(HttpStatus.NOT_FOUND);
        }

        currentUser.setUsername(user.getUsername());
        currentUser.setAddress(user.getAddress());
        currentUser.setEmail(user.getEmail());

        userService.updateUser(currentUser);
        return new ResponseEntity<Usr>(currentUser, HttpStatus.OK);
    }

    // ------------------- Delete a User
    // --------------------------------------------------------

    @RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Usr> deleteUser(@PathVariable("id") Long id) {
        System.out.println("Fetching & Deleting User with id " + id);

        Usr user = userService.getUserById(id);
        if (user == null) {
            System.out.println("Unable to delete. User with id " + id
                    + " not found");
            return new ResponseEntity<Usr>(HttpStatus.NOT_FOUND);
        }

        userService.deleteUserById(id);
        return new ResponseEntity<Usr>(HttpStatus.NO_CONTENT);
    }

    // ------------------- Delete All Users
    // --------------------------------------------------------

    @RequestMapping(value = "/user/", method = RequestMethod.DELETE)
    public ResponseEntity<Usr> deleteAllUsers() {
        System.out.println("Deleting All Users");

        userService.deleteAllUsers();
        return new ResponseEntity<Usr>(HttpStatus.NO_CONTENT);
    }

}