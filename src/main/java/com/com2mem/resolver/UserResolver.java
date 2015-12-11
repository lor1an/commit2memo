package com.com2mem.resolver;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;

import com.com2mem.service.UserService;

@Component
public class UserResolver {
    
    @Autowired
    UserService userService;
    
	public com.com2mem.model.User curentUser(){
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return userService.getUserByUsername(user.getUsername());
	}
}
