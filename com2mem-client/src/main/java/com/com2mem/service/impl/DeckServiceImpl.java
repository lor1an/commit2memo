package com.com2mem.service.impl;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.com2mem.model.Card;
import com.com2mem.model.Client;
import com.com2mem.model.Deck;
import com.com2mem.model.Wave;
import com.com2mem.repository.DeckRepository;
import com.com2mem.resolver.ClientResolver;
import com.com2mem.service.CardService;
import com.com2mem.service.ClientService;
import com.com2mem.service.DeckService;
import com.google.common.collect.Lists;

@Service(value = "deckService")
public class DeckServiceImpl implements DeckService {

    @Autowired
    private ClientResolver clientResolver;

    @Autowired
    private CardService cardService;

    @Autowired
    private DeckRepository deckRepository;

    @Autowired
    private ClientService clientService;

    @Override
    public void addDeck(Deck deck) {
        Client curClient = clientResolver.curentClient();
        deck.setClient(curClient);
        deckRepository.save(deck);
        if (curClient.getDecks() != null) {
            curClient.getDecks().add(deck);
        } else {
            curClient.setDecks(Lists.newArrayList(deck));
        }
        clientService.saveUser(curClient);
    }

    @Override
    public Deck getDeckById(final Long deckId) {
        Deck deck = deckRepository.findByDeck(deckId);
        if (clientResolver.isClientDeck(deck)) {
            return deck;
        } else {
            return null;
        }
    }

    @Override
    public boolean addCard(Long deckId, Card card) {
        Deck deck = deckRepository.findByDeck(deckId);
        if (clientResolver.isClientDeck(deck)) {
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
        return clientResolver.curentClient().getDecks();
    }

    @Override
    public List<Deck> getDecksWithNewCards() {
        return deckRepository.findDecksWithNewCards(true, clientResolver.curentClient());
    }

    @Override
    public List<Deck> getDecksWithRepeatCards() {
        return deckRepository.findDecksWithRepeatCards(LocalDate.now(), clientResolver.curentClient());
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
        if (clientResolver.isClientDeck(deck)) {
            deck.setClient(null);
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
