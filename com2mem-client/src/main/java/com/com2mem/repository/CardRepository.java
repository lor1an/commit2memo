package com.com2mem.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.com2mem.common.model.User;
import com.com2mem.model.Card;
import com.com2mem.model.Deck;

@Transactional
public interface CardRepository extends CrudRepository<Card, Long> {

    List<Card> findByDeck(Deck deck);

    List<Card> findByDeckAndRepeatDateLessThanEqual(Deck deck, LocalDate repeatDate);

    List<Card> findByDeckAndNewCard(Deck deck, boolean newCard);

    @Query(value = "SELECT count(c) FROM Card c WHERE c.newCard = :newCard AND c.deck IN "
            + "(SELECT d FROM Deck d WHERE d.user = :user)")
    Integer countByNewCardAndUser(@Param("newCard") boolean newCard, @Param("user") User user);

    @Query(value = "SELECT count(c) FROM Card c WHERE c.repeatDate <= :repeatDate AND c.deck IN "
            + "(SELECT d FROM Deck d WHERE d.user = :user)")
    Integer countByRepeatDateAndUser(@Param("repeatDate") LocalDate repeatDate, @Param("user") User user);

    @Query(value = "SELECT count(c) FROM Card c WHERE c.newCard = :newCard AND c.deck = :deck")
    Integer countByNewCardAndDeck(@Param("newCard") boolean newCard, @Param("deck") Deck deck);

    @Query(value = "SELECT count(c) FROM Card c WHERE c.repeatDate <= :repeatDate AND c.deck = :deck")
    Integer countByRepeatDateAndDeck(@Param("repeatDate") LocalDate repeatDate, @Param("deck") Deck deck);

}
