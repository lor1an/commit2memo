package com.com2mem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.com2mem.model.Client;
import com.com2mem.service.ClientService;

@RestController
public class ClientController {

    @Autowired
    ClientService clientService;

    @RequestMapping(value = "/client", method = RequestMethod.POST)
    public ResponseEntity<HttpStatus> createUser(@RequestBody Client client) {
        clientService.addUser(client);
        return new ResponseEntity<HttpStatus>(HttpStatus.CREATED);
    }
}
