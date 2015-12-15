package com.com2mem.service;

import java.util.List;

import com.com2mem.model.Card;

public interface CardService {

    Card getCardById(final Long cardId);

    void updateCard(final Card card);
    
    boolean updateCard(Long deckId, Card card);

    List<Card> getCardsByDeckId(Long deckId);

    List<Card> getCardsForTraining(Long deckId);
    
    List<Card> getNewCards(Long deckId);

    List<Card> getAllCards();
    
    Integer countNewCardsOfClient();
    
    Integer countRepeatCardsOfClient();
    
    Integer countNewCardsOfDeck(Long deckId);
    
    Integer countRepeatCardsOfDeck(Long deckId);

    boolean isCardExist(Card card);

    void saveCard(Card card);

    boolean deleteCardById(Long id);

    void deleteCard(Card card);

    void deleteAllCards();

    boolean deleteCardById(List<Long> ids);
}
