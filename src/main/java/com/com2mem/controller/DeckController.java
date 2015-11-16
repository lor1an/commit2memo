package com.com2mem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.com2mem.service.DeckService;

@RestController
public class DeckController {
	
	@Autowired
	DeckService deckService;
	
	public void addCard(){
		
	}
	
	public void deleteCard(){
		
	}
	
	public void changeDeck(){

	}
}
