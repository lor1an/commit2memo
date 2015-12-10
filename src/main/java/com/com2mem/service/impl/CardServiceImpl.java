package com.com2mem.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.com2mem.model.Card;
import com.com2mem.repository.CardRepository;
import com.com2mem.service.CardService;

@Service(value = "cardService")
public class CardServiceImpl implements CardService {

    @Autowired
    CardRepository cardRepository;

    @Override
    public Card getCardById(final Long cardId) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public void updateCard(final Card card) {
        // TODO Auto-generated method stub

    }

    @Override
    public List<Card> getAllCards() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public boolean isCardExist(final Card card) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public void saveCard(final Card card) {
        cardRepository.save(card);
    }

    @Override
    public void deleteCardById(final Long id) {
        // TODO Auto-generated method stub

    }

    @Override
    public void deleteCard(final Card card) {
        // TODO Auto-generated method stub

    }

    @Override
    public void deleteAllCards() {
        // TODO Auto-generated method stub

    }
}
