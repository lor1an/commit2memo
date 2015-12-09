package com.com2mem.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
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

}