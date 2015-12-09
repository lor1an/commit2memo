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
    public void updateDeck(Deck deck) {
        // TODO Auto-generated method stub
        
    }

    @Override
    public List<Deck> getAllDecks() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public boolean isDeckExist(Deck deck) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public void saveDeck(Deck deck) {
        deckRepository.save(deck);
    }

    @Override
    public void deleteDeckById(Long id) {
        deckRepository.delete(id);
    }

    @Override
    public void deleteAllDecks() {
        // TODO Auto-generated method stub
    }

    @Override
    public Deck getDeckById(Long deckId) {
        return deckRepository.findOne(deckId);
    }
    
}
