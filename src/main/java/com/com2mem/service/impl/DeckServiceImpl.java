package com.com2mem.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.com2mem.model.Deck;
import com.com2mem.repository.DeckRepository;
import com.com2mem.service.DeckService;

@Service(value = "deckService")
public class DeckServiceImpl implements DeckService {
    
    @Autowired
    DeckRepository deckRepository;
    
    @Override
    public void updateDeck(final Deck deck) {
        // TODO Auto-generated method stub
    }

    @Override
    public List<Deck> getAllDecks() {
        // TODO Auto-generated method stub
        return null;
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
    public void deleteDeckById(final Long id) {
        deckRepository.delete(id);
    }
    
    @Override
    public void deleteDeck(final Deck deck) {
        deckRepository.delete(deck);
    }

    @Override
    public void deleteAllDecks() {
        // TODO Auto-generated method stub
    }

    @Override
    public Deck getDeckById(final Long deckId) {
        return deckRepository.findOne(deckId);
    }
    
}
