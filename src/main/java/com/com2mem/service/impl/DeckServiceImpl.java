package com.com2mem.service.impl;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.com2mem.model.Card;
import com.com2mem.model.Deck;
import com.com2mem.model.User;
import com.com2mem.model.Wave;
import com.com2mem.repository.DeckRepository;
import com.com2mem.resolver.UserResolver;
import com.com2mem.service.CardService;
import com.com2mem.service.DeckService;
import com.com2mem.service.UserService;
import com.google.common.collect.Lists;

@Service(value = "deckService")
public class DeckServiceImpl implements DeckService {

    @Autowired
    private UserResolver userResolver;

    @Autowired
    private CardService cardService;

    @Autowired
    private DeckRepository deckRepository;

    @Autowired
    private UserService userService;

    @Override
    public void addDeck(Deck deck) {
        User curUser = userResolver.curentUser();
        deck.setUser(curUser);
        deckRepository.save(deck);
        if (curUser.getDecks() != null) {
            curUser.getDecks().add(deck);
        } else {
            curUser.setDecks(Lists.newArrayList(deck));
        }
        userService.saveUser(curUser);
    }

    @Override
    public Deck getDeckById(final Long deckId) {
        Deck deck = deckRepository.findOne(deckId);
        if (userResolver.isUserDeck(deck)) {
            return deck;
        } else {
            return null;
        }
    }

    @Override
    public boolean addCard(Long deckId, Card card) {
        Deck deck = deckRepository.findOne(deckId);
        if (userResolver.isUserDeck(deck)) {
            card.setDeck(deck);
            card.setWave(Wave.WAVE_0);
            card.setNewCard(true);
            cardService.saveCard(card);
            if (deck.getCards() != null) {
                deck.getCards().add(card);
            } else {
                deck.setCards(Lists.newArrayList(card));
            }
            saveDeck(deck);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public void updateDeck(final Deck deck) {
        // TODO Auto-generated method stub
    }

    @Override
    public List<Deck> getAllDecks() {
        return userResolver.curentUser().getDecks();
    }

    @Override
    public List<Deck> getDecksWithNewCards() {
        return deckRepository.findDecksWithNewCards(true, userResolver.curentUser());
    }

    @Override
    public List<Deck> getDecksWithRepeatCards() {
        return deckRepository.findDecksWithRepeatCards(LocalDate.now(), userResolver.curentUser());
    }

    @Override
    public boolean isDeckExist(final Deck deck) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public void saveDeck(final Deck deck) {
        deckRepository.save(deck);
    }

    @Override
    public void deleteAllDecks() {
        // TODO Auto-generated method stub
    }

    @Override
    public boolean deleteDeckById(Long id) {
        Deck deck = deckRepository.findOne(id);
        if (userResolver.isUserDeck(deck)) {
            deck.setUser(null);
            deleteDeck(deck);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public void deleteDeck(Deck deck) {
        deckRepository.delete(deck);
    }
}
