package com.com2mem.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "deck")
public class Deck {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long deckId;
    private String name;
    @ManyToOne
    @JoinColumn(name = "userId")
    @JsonIgnore
    private Client client;
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "deck", cascade = CascadeType.PERSIST)
    @JsonIgnore
    private List<Card> cards;

    public Deck() {
    }

    public Deck(String name) {
        super();
        this.name = name;
    }

    public Long getDeckId() {
        return deckId;
    }

    public void setDeckId(Long deckId) {
        this.deckId = deckId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Card> getCards() {
        return cards;
    }

    public void setCards(List<Card> cards) {
        this.cards = cards;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((deckId == null) ? 0 : deckId.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Deck other = (Deck) obj;
        if (deckId == null) {
            if (other.deckId != null)
                return false;
        } else if (!deckId.equals(other.deckId))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "Deck [deckId=" + deckId + ", name=" + name + ", cards=" + cards
                + "Client" + client.getUserId() + "]";
    }

}
