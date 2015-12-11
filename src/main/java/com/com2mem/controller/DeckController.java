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
import com.com2mem.model.User;
import com.com2mem.resolver.UserResolver;
import com.com2mem.service.CardService;
import com.com2mem.service.DeckService;
import com.com2mem.service.UserService;
import com.google.common.collect.Lists;

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
        return new ResponseEntity<List<Deck>>(userResolver.curentUser()
                .getDecks(), HttpStatus.OK);
    }

    @RequestMapping(value = "/decks", method = RequestMethod.POST)
    public ResponseEntity<HttpStatus> addDeck(@RequestBody Deck deck) {
        User curUser = userResolver.curentUser();
        deck.setUser(curUser);
        deckService.saveDeck(deck);
        if (curUser.getDecks() != null) {
            curUser.getDecks().add(deck);
        } else {
            curUser.setDecks(Lists.newArrayList(deck));
        }
        userService.saveUser(curUser);
        return new ResponseEntity<HttpStatus>(HttpStatus.CREATED);
    }

    @RequestMapping(value = "/decks/{id}", method = RequestMethod.GET)
    public ResponseEntity<Deck> getDeck(@PathVariable("id") Long id) {
        List<Deck> decks = userResolver.curentUser().getDecks();
        for (int i = 0; i < decks.size(); i++) {
            if (decks.get(i).getDeckId().equals(id)) {
                return new ResponseEntity<Deck>(decks.get(i), HttpStatus.OK);
            }
        }
        return new ResponseEntity<Deck>(HttpStatus.NOT_FOUND);
    }

    @RequestMapping(value = "/decks/{id}", method = RequestMethod.PUT)
    public ResponseEntity<HttpStatus> addCard(@PathVariable("id") Long id,
            @RequestBody Card card) {
        List<Deck> decks = userResolver.curentUser().getDecks();
        for (int i = 0; i < decks.size(); i++) {
            if (decks.get(i).getDeckId().equals(id)) {
                Deck deck = decks.get(i);
                card.setDeck(deck);
                cardService.saveCard(card);
                if (deck.getCards() != null) {
                    deck.getCards().add(card);
                } else {
                    deck.setCards(Lists.newArrayList(card));
                }
                deckService.saveDeck(deck);
                return new ResponseEntity<HttpStatus>(HttpStatus.OK);
            }
        }
        return new ResponseEntity<HttpStatus>(HttpStatus.NOT_FOUND);
    }

    @RequestMapping(value = "/decks/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<HttpStatus> deleteDeck(@PathVariable("id") Long id) {
        User curUser = userResolver.curentUser();
        List<Deck> decks = curUser.getDecks();
        for (int i = 0; i < decks.size(); i++) {
            if (decks.get(i).getDeckId().equals(id)) {
                Deck deck = decks.get(i);
                deck.setUser(null);
                curUser.getDecks().remove(i);
                userService.saveUser(curUser);
                deckService.deleteDeck(deck);
                break;
            }
        }
        return new ResponseEntity<HttpStatus>(HttpStatus.OK);
    }

}
