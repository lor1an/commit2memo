package com.com2mem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.com2mem.model.Deck;
import com.com2mem.service.UserService;

import static com.com2mem.util.UserHelper.getCurentUsername;

@RestController
public class DeckController {

	@Autowired
	UserService userService;

	@RequestMapping(value = "/decks", method = RequestMethod.GET)
	public ResponseEntity<List<Deck>> listAllDecks() {
		String username = getCurentUsername();
		return new ResponseEntity<List<Deck>>(userService.getUserByUsername(
				username).getDecks(), HttpStatus.OK);
	}

}
