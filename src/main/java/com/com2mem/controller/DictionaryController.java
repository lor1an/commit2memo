package com.com2mem.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.oxm.XmlMappingException;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.com2mem.dto.EntryList;
import com.com2mem.service.DictionaryService;

@RestController
public class DictionaryController {

    @Autowired
    DictionaryService dictionaryService;

    @RequestMapping(value = "/entryList/{word}", method = RequestMethod.GET)
    public EntryList getEntryList(@PathVariable String word)
            throws XmlMappingException, IOException {
        return dictionaryService.getEntryListFromDictionary(word);
    }

    @RequestMapping("/resource")
    public Testt home() {
        Testt test = new Testt();
        test.setId(UUID.randomUUID().toString());
        test.setContent("HelloWorld");
        return test;
    }
    
    @RequestMapping("/user")
    public Principal user(Principal user) {
      return user;
    }
    
}

class Testt {
    private String id;
    private String content;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

}