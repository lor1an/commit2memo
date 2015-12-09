package com.com2mem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.com2mem.model.Deck;
import com.com2mem.model.User;
import com.com2mem.service.DeckService;
import com.com2mem.service.UserService;
import com.com2mem.util.UserResolver;
import com.google.common.collect.Lists;

@RestController
public class DeckController {

    @Autowired
    UserResolver userResolver;

    @Autowired
    UserService userService;
    
    @Autowired
    DeckService deckService;

    @RequestMapping(value = "/decks", method = RequestMethod.GET)
    public ResponseEntity<List<Deck>> listAllDecks() {
        return new ResponseEntity<List<Deck>>(userResolver.curentUser()
                .getDecks(), HttpStatus.OK);
    }

    @RequestMapping(value = "/decks", method = RequestMethod.POST)
    public ResponseEntity<HttpStatus> addDeck(@RequestBody Deck deck) {
        User curUser = userResolver.curentUser();
        deck.setUser(curUser);
        deckService.saveDeck(deck);
        System.out.println(deck);
        if (curUser.getDecks() != null) {
            curUser.setDecks(Lists.newArrayList(deck));
        } else {
            curUser.setDecks(Lists.newArrayList(deck));
        }
        userService.saveUser(curUser);
        return new ResponseEntity<HttpStatus>(HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/decks/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<HttpStatus> deleteDeck(@PathVariable("id") Long id) {
        System.out.println(id);
        System.out.println(deckService.getDeckById(id));
        deckService.deleteDeckById(id);
        return new ResponseEntity<HttpStatus>(HttpStatus.OK);
    }

}
