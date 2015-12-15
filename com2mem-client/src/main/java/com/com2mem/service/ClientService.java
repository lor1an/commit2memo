package com.com2mem.service;

import com.com2mem.common.service.UserService;
import com.com2mem.model.Client;

public interface ClientService extends UserService<Client> {
    
    boolean checkEmail(String email);
    
    boolean checkUsername(String username);
}
