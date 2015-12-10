package com.com2mem.service;

import java.util.List;

import com.com2mem.model.Deck;

public interface DeckService {

    Deck getDeckById(final Long deckId);
    
    void updateDeck(final Deck deck);

    List<Deck> getAllDecks();

    boolean isDeckExist(Deck deck);

    void saveDeck(Deck deck);

    void deleteDeckById(Long id);
    
    void deleteDeck(Deck deck);
    
    void deleteAllDecks();
}
