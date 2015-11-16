package com.com2mem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.com2mem.model.Usr;
import com.com2mem.service.UsrService;

@RestController
public class UserController {

	@Autowired
	UsrService usrService;

	@RequestMapping(value = "/users", method = RequestMethod.POST)
	public Usr addUser() {
		return usrService.addUsr();
	}

}
