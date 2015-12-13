package com.com2mem.service;

import java.util.List;

import com.com2mem.model.Card;

public interface CardService {

    Card getCardById(final Long cardId);

    void updateCard(final Card card);
    
    void updateCard(Long deckId, Card card, boolean memorize);

    List<Card> getCardsByDeckId(Long deckId);

    List<Card> getCardsForTraining(Long deckId);

    List<Card> getAllCards();

    boolean isCardExist(Card card);

    void saveCard(Card card);

    void deleteCardById(Long id);

    void deleteCard(Card card);

    void deleteAllCards();
}
