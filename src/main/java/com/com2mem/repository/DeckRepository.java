package com.com2mem.repository;

import org.springframework.data.repository.CrudRepository;

import com.com2mem.model.Deck;
import com.com2mem.model.User;

public interface DeckRepository extends CrudRepository<Deck, Long>{
    
    Deck findByDeckIdAndUser(Long deckId, User user);
    
}
