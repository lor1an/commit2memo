package com.com2mem.util;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;

public class UserHelper {
	
	public static String getCurentUsername(){
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return user.getUsername();  
	}
}
