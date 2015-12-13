package com.com2mem.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.com2mem.model.Card;
import com.com2mem.model.Deck;

public interface CardRepository extends CrudRepository<Card, Long> {
    
    List<Card> findByDeck(Deck deck);
    
    List<Card> findByDeckAndRepeatDateLessThanEqual(Deck deck, LocalDate ld);
    
}
