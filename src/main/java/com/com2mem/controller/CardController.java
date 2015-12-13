package com.com2mem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.com2mem.model.Card;
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
    public ResponseEntity<List<Card>> getCardByIds(@PathVariable("id") Long id){
        List<Card> cards = cardService.getCardsByDeckId(id);
        if (cards == null) {
            return new ResponseEntity<List<Card>>(HttpStatus.NOT_FOUND);
        } else {
            return new ResponseEntity<List<Card>>(cards, HttpStatus.OK);
        }
    }
    
    @RequestMapping(value = "/decks/{id}/cards/training", method = RequestMethod.GET)
    public ResponseEntity<List<Card>> getCardsForTraining(@PathVariable("id") Long id){
        List<Card> cards = cardService.getCardsForTraining(id);
        if (cards == null) {
            return new ResponseEntity<List<Card>>(HttpStatus.NOT_FOUND);
        } else {
            return new ResponseEntity<List<Card>>(cards, HttpStatus.OK);
        }
    }

}
