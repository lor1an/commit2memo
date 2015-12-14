package com.com2mem.resolver;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;

import com.com2mem.model.Deck;
import com.com2mem.security.C2MUser;
import com.com2mem.service.ClientService;

@Component
public class ClientResolver {

    @Autowired
    ClientService clientService;

    public com.com2mem.model.Client curentClient() {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return clientService.getUserByUsername(user.getUsername());
    }

    public Long curentUserId() {
        C2MUser user = (C2MUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return user.getUserId();
    }

    public boolean isClientDeck(Deck deck) {
        if (deck == null || !deck.getClient().getUserId().equals(curentUserId())) {
            return false;
        }
        return true;
    }
    
}
