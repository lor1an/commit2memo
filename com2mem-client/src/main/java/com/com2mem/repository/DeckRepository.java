package com.com2mem.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.com2mem.model.Client;
import com.com2mem.model.Deck;

@Transactional
public interface DeckRepository extends CrudRepository<Deck, Long> {

    Deck findByDeckIdAndClient(Long deckId, Client client);

    @Query(value = "select d from Deck d where d.deckId = :deckId")
    Deck findByDeck(@Param("deckId") Long deckId);

    @Query(value = "SELECT d FROM Deck d WHERE d.client = :client AND d IN "
            + "(SELECT c.deck FROM Card c WHERE c.newCard = :newCard)")
    List<Deck> findDecksWithNewCards(@Param("newCard") boolean newCard, @Param("client") Client client);

    @Query(value = "SELECT d FROM Deck d WHERE d.client = :client AND d IN "
            + "(SELECT c.deck FROM Card c WHERE c.repeatDate <= :repeatDate)")
    List<Deck> findDecksWithRepeatCards(@Param("repeatDate") LocalDate repeatDate, @Param("client") Client client);

}
