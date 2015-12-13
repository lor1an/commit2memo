package com.com2mem.service;

import java.util.List;

import com.com2mem.model.Card;
import com.com2mem.model.Deck;

public interface DeckService {
    
    void addDeck(Deck deck);
    
    Deck getDeckById(final Long deckId);
    
    void updateDeck(final Deck deck);

    List<Deck> getAllDecks();
    
    List<Deck> getDecksWithNewCards();

    List<Deck> getDecksWithRepeatCards();

    boolean isDeckExist(Deck deck);

    void saveDeck(Deck deck);

    boolean deleteDeckById(Long id);
    
    void deleteDeck(Deck deck);
    
    void deleteAllDecks();
    
    boolean addCard(Long deckId, Card card);
    
}
