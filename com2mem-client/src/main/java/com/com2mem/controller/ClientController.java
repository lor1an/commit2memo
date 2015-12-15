package com.com2mem.controller;

import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.com2mem.model.Client;
import com.com2mem.resolver.ClientResolver;
import com.com2mem.service.ClientService;

import static org.apache.commons.lang3.StringUtils.isNotBlank;

@RestController
public class ClientController {

    @Autowired
    ClientService clientService;

    @Autowired
    ClientResolver clientResolver;

    @RequestMapping(value = "/client", method = RequestMethod.POST)
    public ResponseEntity<HttpStatus> createClient(@RequestBody Client client) {
        if (validateClient(client)) {
            clientService.addUser(client);
            return new ResponseEntity<HttpStatus>(HttpStatus.CREATED);
        } else {
            return new ResponseEntity<HttpStatus>(HttpStatus.NOT_ACCEPTABLE);
        }

    }

    @RequestMapping(value = "/currentClient", method = RequestMethod.GET)
    public ResponseEntity<Client> getCurrentClient() {
        return new ResponseEntity<Client>(clientResolver.curentClient(), HttpStatus.CREATED);
    }

    @RequestMapping(value = "/checkEmail", method = RequestMethod.GET)
    public ResponseEntity<HttpStatus> checkEmail(@RequestParam("email") String email) {
        HttpStatus status = clientService.checkEmail(email) ? HttpStatus.NOT_ACCEPTABLE : HttpStatus.OK;
        return new ResponseEntity<HttpStatus>(status);
    }

    @RequestMapping(value = "/checkUsername", method = RequestMethod.GET)
    public ResponseEntity<HttpStatus> checkUsername(@RequestParam("username") String username) {
        HttpStatus status = clientService.checkUsername(username) ? HttpStatus.NOT_ACCEPTABLE : HttpStatus.OK;
        return new ResponseEntity<HttpStatus>(status);
    }

    private boolean validateClient(Client client) {
        String email = client.getEmail();
        String username = client.getUsername();
        String password = client.getPassword();
        if (isNotBlank(email) && isNotBlank(username) && isNotBlank(password)) {
            return validateEmail(email) && validateUsername(username) && password.length() > 3;
        } else {
            return false;
        }
    }

    private boolean validateEmail(String email) {
        return !clientService.checkEmail(email) && EmailValidator.getInstance().isValid(email);
    }

    private boolean validateUsername(String username) {
        return (username.length() > 3) && !clientService.checkUsername(username);
    }
}
