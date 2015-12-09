package com.com2mem.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "deck")
public class Deck {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long deckId;
	private String name;
	@ManyToOne
	@JoinColumn(name = "userId")
	private User user;
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "deck")
	private List<Card> cards;

	public Deck(){
	    
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

}
