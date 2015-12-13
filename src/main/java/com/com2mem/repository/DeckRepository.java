package com.com2mem.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import com.com2mem.model.Deck;
import com.com2mem.model.User;

@Transactional
public interface DeckRepository extends CrudRepository<Deck, Long>{
    
    Deck findByDeckIdAndUser(Long deckId, User user);
    
}
