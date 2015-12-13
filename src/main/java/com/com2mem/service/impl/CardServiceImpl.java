package com.com2mem.service.impl;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.oxm.XmlMappingException;
import org.springframework.stereotype.Service;

import com.com2mem.dto.DefText;
import com.com2mem.dto.Entry;
import com.com2mem.dto.EntryList;
import com.com2mem.model.Card;
import com.com2mem.model.Deck;
import com.com2mem.model.User;
import com.com2mem.repository.CardRepository;
import com.com2mem.resolver.UserResolver;
import com.com2mem.service.CardService;
import com.com2mem.service.DictionaryService;

@Service(value = "cardService")
public class CardServiceImpl implements CardService {

    @Autowired
    private UserResolver userResolver;

    @Autowired
    private CardRepository cardRepository;

    @Autowired
    private DictionaryService dictionaryService;

    @Override
    public List<Card> getCardsByDeckId(final Long deckId) {
        User curUser = userResolver.curentUser();
        List<Deck> decks = curUser.getDecks();
        for (int i = 0; i < decks.size(); i++) {
            if (decks.get(i).getDeckId().equals(deckId)) {
                List<Card> cards = cardRepository.findByDeck(decks.get(i));
                for (Card card : cards) {
                    card.setEntry(findEntryForCard(card));
                }
                return cards;
            }
        }
        return null;
    }

    @Override
    public List<Card> getCardsForTraining(final Long deckId) {
        User curUser = userResolver.curentUser();
        List<Deck> decks = curUser.getDecks();
        for (int i = 0; i < decks.size(); i++) {
            if (decks.get(i).getDeckId().equals(deckId)) {
                List<Card> cards = cardRepository.findByDeckAndRepeatDateLessThanEqual(
                        decks.get(i), LocalDate.now());
                return cards;
            }
        }
        return null;
    }

    private Entry findEntryForCard(final Card card) {
        try {
            EntryList eList = dictionaryService.getEntryListFromDictionary(card.getSearchWord());
            Entry e = eList.getEntryList().get(card.getWordId());
            List<DefText> allSenses = e.getDef().getSndf();
            if (allSenses.size() != card.getSensesId().size()) {
                List<DefText> senses = new ArrayList<>();
                for (Integer i : card.getSensesId()) {
                    senses.add(allSenses.get(i));
                }
                e.getDef().setSndf(senses);
            }
            return e;
        } catch (XmlMappingException | IOException e1) {
            e1.printStackTrace();
            return null;
        }

    }

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
