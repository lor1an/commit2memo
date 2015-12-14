package com.com2mem.model;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.com2mem.common.model.User;
import com.com2mem.common.model.UserRole;

@Entity
@DiscriminatorValue("C")
@Table(name="clients")
public class Client extends User {

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "client", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Deck> decks;

    public Client(){
        
    }
    public Client(String username, String password, boolean enabled,
            Set<UserRole> userRole) {
        super(username, password, enabled, userRole);
    }
    
    public List<Deck> getDecks() {
        return decks;
    }

    public void setDecks(List<Deck> decks) {
        this.decks = decks;
    }
}
