package com.com2mem.service;

import java.io.IOException;
import java.util.List;

import org.springframework.oxm.XmlMappingException;

import com.com2mem.dto.EntryList;
import com.com2mem.model.Card;

public interface CardService {
    
    Card getCardById(final Long cardId);

    void updateCard(final Card card);
    
    EntryList getCardsByDeckId(Long deckId) throws XmlMappingException, IOException;
    
    List<Card> getAllCards();

    boolean isCardExist(Card card);

    void saveCard(Card card);

    void deleteCardById(Long id);

    void deleteCard(Card card);

    void deleteAllCards();
}
