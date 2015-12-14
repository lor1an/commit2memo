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
import com.com2mem.service.CardService;

@RestController
public class CardController {

    @Autowired
    private CardService cardService;

    @RequestMapping(value = "/cards/{id}", method = RequestMethod.GET)
    public ResponseEntity<List<Card>> getCardByDeckId(@PathVariable("id") Long id) {
        List<Card> cards = cardService.getCardsByDeckId(id);
        if (cards == null) {
            return new ResponseEntity<List<Card>>(HttpStatus.NOT_FOUND);
        } else {
            return new ResponseEntity<List<Card>>(cards, HttpStatus.OK);
        }
    }

    @RequestMapping(value = "/cards/new/{id}", method = RequestMethod.GET)
    public ResponseEntity<List<Card>> getNewCardsOfDeck(@PathVariable("id") Long id) {
        List<Card> cards = cardService.getNewCards(id);
        if (cards == null) {
            return new ResponseEntity<List<Card>>(HttpStatus.NOT_FOUND);
        } else {
            return new ResponseEntity<List<Card>>(cards, HttpStatus.OK);
        }
    }
    
    @RequestMapping(value = "/cards/repeat/{id}", method = RequestMethod.GET)
    public ResponseEntity<List<Card>> getCardsForTraining(@PathVariable("id") Long id) {
        List<Card> cards = cardService.getCardsForTraining(id);
        if (cards == null) {
            return new ResponseEntity<List<Card>>(HttpStatus.NOT_FOUND);
        } else {
            return new ResponseEntity<List<Card>>(cards, HttpStatus.OK);
        }
    }

    @RequestMapping(value = "/cards/newCount", method = RequestMethod.GET)
    public ResponseEntity<Integer> getCountNewCardsOfUser() {
        return new ResponseEntity<Integer>(cardService.countNewCardsOfUser(), HttpStatus.OK);
    }

    @RequestMapping(value = "/cards/repeatCount", method = RequestMethod.GET)
    public ResponseEntity<Integer> getCountRepeatCardsOfUser() {
        return new ResponseEntity<Integer>(cardService.countRepeatCardsOfUser(), HttpStatus.OK);
    }

    @RequestMapping(value = "/cards/newCount/{id}", method = RequestMethod.GET)
    public ResponseEntity<Integer> getCountNewCardsOfDeck(@PathVariable("id") Long deckId) {
        return new ResponseEntity<Integer>(cardService.countNewCardsOfDeck(deckId), HttpStatus.OK);
    }

    @RequestMapping(value = "/cards/repeatCount/{id}", method = RequestMethod.GET)
    public ResponseEntity<Integer> getCountRepeatCardsOfDeck(@PathVariable("id") Long deckId) {
        return new ResponseEntity<Integer>(cardService.countRepeatCardsOfDeck(deckId), HttpStatus.OK);
    }
    
    @RequestMapping(value = "/cards/{id}", method = RequestMethod.PUT)
    public ResponseEntity<HttpStatus> updateCards(@PathVariable("id") Long id, @RequestBody Card card) {
        if (cardService.updateCard(id, card)) {
            return new ResponseEntity<HttpStatus>(HttpStatus.OK);
        } else {
            return new ResponseEntity<HttpStatus>(HttpStatus.NOT_FOUND);
        }
    }
}