package com.com2mem.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.oxm.XmlMappingException;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.com2mem.dto.EntryList;
import com.com2mem.resolver.UserResolver;
import com.com2mem.service.CardService;
import com.com2mem.service.DeckService;
import com.com2mem.service.UserService;

@RestController
public class CardController {

    @Autowired
    private UserResolver userResolver;

    @Autowired
    private UserService userService;

    @Autowired
    private DeckService deckService;

    @Autowired
    private CardService cardService;

    @RequestMapping(value = "/decks/{id}/cards", method = RequestMethod.GET)
    public ResponseEntity<EntryList> listAllDecks(@PathVariable("id") Long id) throws XmlMappingException, IOException {
        EntryList cards = cardService.getCardsByDeckId(id);
        if (cards == null) {
            return new ResponseEntity<EntryList>(HttpStatus.NOT_FOUND);
        } else {
            return new ResponseEntity<EntryList>(cards, HttpStatus.OK);
        }

    }

}
