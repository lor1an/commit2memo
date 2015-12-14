package com.com2mem.resolver;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;

import com.com2mem.common.service.UserService;
import com.com2mem.model.Deck;
import com.com2mem.security.C2MUser;

@Component
public class UserResolver {

    @Autowired
    UserService userService;

    public com.com2mem.common.model.User curentUser() {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return userService.getUserByUsername(user.getUsername());
    }

    public Long curentUserId() {
        C2MUser user = (C2MUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return user.getUserId();
    }

    public boolean isUserDeck(Deck deck) {
        if (deck == null || !deck.getUser().getUserId().equals(curentUserId())) {
            return false;
        }
        return true;
    }
    
}
