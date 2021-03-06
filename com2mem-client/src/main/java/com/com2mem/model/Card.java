package com.com2mem.model;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.com2mem.dto.Entry;
import com.com2mem.json.RepeatDateDeserializer;
import com.com2mem.json.RepeatDateSerializer;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

@Entity
@Table(name = "card")
public class Card {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long cardId;
    private String searchWord;
    private Integer wordId;
    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name ="card_senses")
    private List<Integer> sensesId;
    @Transient
    private Entry entry;
    @Enumerated(EnumType.STRING)
    private Wave wave;
    @Column
    @JsonSerialize(using = RepeatDateSerializer.class)
    @JsonDeserialize(using = RepeatDateDeserializer.class)
    @JsonProperty
    private LocalDate repeatDate;
    @Column
    private boolean newCard;
    @Column
    private boolean memorize;
    @ManyToOne
    @JoinColumn(name = "deckId")
    private Deck deck;

    public Long getCardId() {
        return cardId;
    }

    public void setCardId(Long cardId) {
        this.cardId = cardId;
    }
    
    public String getSearchWord() {
        return searchWord;
    }

    public void setSearchWord(String searchWord) {
        this.searchWord = searchWord;
    }

    public Integer getWordId() {
        return wordId;
    }

    public void setWordId(Integer wordId) {
        this.wordId = wordId;
    }

    public List<Integer> getSensesId() {
        return sensesId;
    }

    public void setSensesId(List<Integer> sensesId) {
        this.sensesId = sensesId;
    }
    
    public Entry getEntry() {
        return entry;
    }

    public void setEntry(Entry entry) {
        this.entry = entry;
    }

    public Wave getWave() {
        return wave;
    }

    public void setWave(Wave wave) {
        this.wave = wave;
    }

    public LocalDate getRepeatDate() {
        return repeatDate;
    }

    public void setRepeatDate(LocalDate repeatDate) {
        this.repeatDate = repeatDate;
    }

    public boolean isNewCard() {
        return newCard;
    }

    public void setNewCard(boolean newCard) {
        this.newCard = newCard;
    }
    
    public boolean isMemorize() {
        return memorize;
    }

    public void setMemorize(boolean memorize) {
        this.memorize = memorize;
    }

    public Deck getDeck() {
        return deck;
    }

    public void setDeck(Deck deck) {
        this.deck = deck;
    }

}
