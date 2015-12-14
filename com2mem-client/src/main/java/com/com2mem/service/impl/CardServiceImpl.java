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
import com.com2mem.repository.CardRepository;
import com.com2mem.resolver.ClientResolver;
import com.com2mem.service.CardService;
import com.com2mem.service.DeckService;
import com.com2mem.service.DictionaryService;

@Service(value = "cardService")
public class CardServiceImpl implements CardService {

    @Autowired
    private ClientResolver clientResolver;

    @Autowired
    private CardRepository cardRepository;

    @Autowired
    private DeckService deckService;

    @Autowired
    private DictionaryService dictionaryService;

    @Override
    public List<Card> getCardsByDeckId(final Long deckId) {
        Deck deck = deckService.getDeckById(deckId);
        if (deck == null) {
            return null;
        } else {
            List<Card> cards = deck.getCards();
            for (Card card : cards) {
                card.setEntry(findEntryForCard(card));
            }
            return cards;
        }
    }

    @Override
    public List<Card> getCardsForTraining(final Long deckId) {
        Deck deck = deckService.getDeckById(deckId);
        if (deck == null) {
            return null;
        } else {
            List<Card> cards = cardRepository.findByDeckAndRepeatDateLessThanEqual(deck, LocalDate.now());
            for (Card card : cards) {
                card.setEntry(findEntryForCard(card));
            }
            return cards;
        }
    }

    @Override
    public List<Card> getNewCards(Long deckId) {
        Deck deck = deckService.getDeckById(deckId);
        if (deck == null) {
            return null;
        } else {
            List<Card> cards = cardRepository.findByDeckAndNewCard(deck, true);
            for (Card card : cards) {
                card.setEntry(findEntryForCard(card));
            }
            return cards;
        }
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
    public boolean updateCard(Long deckId, Card card) {
        Deck deck = deckService.getDeckById(deckId);
        if (deck == null) {
            return false;
        } else {
            if (card.isNewCard()) {
                card.setRepeatDate(LocalDate.now());
                card.setNewCard(false);
            }
            if (card.isMemorize()) {
                card.setWave(card.getWave().next());
            }
            LocalDate newRepeatDate = card.getRepeatDate().plusDays(card.getWave().getWaveSpace());
            card.setRepeatDate(newRepeatDate);
            saveCard(card);
            return true;
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

    @Override
    public Integer countNewCardsOfClient() {
        return cardRepository.countByNewCardAndClient(true, clientResolver.curentClient());
    }

    @Override
    public Integer countRepeatCardsOfClient() {
        return cardRepository.countByRepeatDateAndClient(LocalDate.now(), clientResolver.curentClient());
    }

    @Override
    public Integer countNewCardsOfDeck(Long deckId) {
        Deck deck = deckService.getDeckById(deckId);
        if (deck == null) {
            return null;
        } else {
            return cardRepository.countByNewCardAndDeck(true, deck);
        }
    }

    @Override
    public Integer countRepeatCardsOfDeck(Long deckId) {
        Deck deck = deckService.getDeckById(deckId);
        if (deck == null) {
            return null;
        } else {
            return cardRepository.countByRepeatDateAndDeck(LocalDate.now(), deck);
        }
    }
}
