package com.com2mem.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.com2mem.model.Deck;
import com.com2mem.model.User;

@Transactional
public interface DeckRepository extends CrudRepository<Deck, Long> {

    Deck findByDeckIdAndUser(Long deckId, User user);

    @Query(value = "SELECT d FROM Deck d WHERE d.user = :user AND d IN "
            + "(SELECT c.deck FROM Card c WHERE c.newCard = :newCard)")
    List<Deck> findDecksWithNewCards(@Param("newCard") boolean newCard, @Param("user") User user);

    @Query(value = "SELECT d FROM Deck d WHERE d.user = :user AND d IN "
            + "(SELECT c.deck FROM Card c WHERE c.repeatDate <= :repeatDate)")
    List<Deck> findDecksWithRepeatCards(@Param("repeatDate") LocalDate repeatDate, @Param("user") User user);

}
