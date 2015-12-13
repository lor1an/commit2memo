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

import com.com2mem.model.Card;
import com.com2mem.model.Deck;
import com.com2mem.resolver.UserResolver;
import com.com2mem.service.CardService;
import com.com2mem.service.DeckService;
import com.com2mem.service.UserService;

@RestController
public class DeckController {

    @Autowired
    private UserResolver userResolver;

    @Autowired
    private UserService userService;

    @Autowired
    private DeckService deckService;

    @Autowired
    private CardService cardService;

    @RequestMapping(value = "/decks", method = RequestMethod.GET)
    public ResponseEntity<List<Deck>> listAllDecks() {
        return new ResponseEntity<List<Deck>>(userResolver.curentUser().getDecks(), HttpStatus.OK);
    }

    @RequestMapping(value = "/decks", method = RequestMethod.POST)
    public ResponseEntity<HttpStatus> addDeck(@RequestBody Deck deck) {
        deckService.addDeck(deck);
        return new ResponseEntity<HttpStatus>(HttpStatus.CREATED);
    }

    @RequestMapping(value = "/decks/{id}", method = RequestMethod.GET)
    public ResponseEntity<Deck> getDeck(@PathVariable("id") Long id) {
        Deck deck = deckService.getDeckById(id);
        if (deck != null) {
            return new ResponseEntity<Deck>(deck, HttpStatus.OK);
        } else {
            return new ResponseEntity<Deck>(HttpStatus.NOT_FOUND);
        }
    }

    @RequestMapping(value = "/decks/{id}", method = RequestMethod.PUT)
    public ResponseEntity<HttpStatus> addCard(@PathVariable("id") Long id, @RequestBody Card card) {
        if (deckService.addCard(id, card)) {
            return new ResponseEntity<HttpStatus>(HttpStatus.OK);
        } else {
            return new ResponseEntity<HttpStatus>(HttpStatus.NOT_FOUND);
        }
    }

    @RequestMapping(value = "/decks/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<HttpStatus> deleteDeck(@PathVariable("id") Long id) {
        if (deckService.deleteDeckById(id)) {
            return new ResponseEntity<HttpStatus>(HttpStatus.OK);
        } else {
            return new ResponseEntity<HttpStatus>(HttpStatus.NOT_FOUND);
        }
    }

}
