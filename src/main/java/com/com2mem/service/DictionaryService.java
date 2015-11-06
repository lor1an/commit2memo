package com.com2mem.service;

import java.io.IOException;

import org.springframework.oxm.XmlMappingException;

import com.com2mem.dto.EntryList;

public interface DictionaryService  {
    
    public EntryList getEntryListFromDictionary(String word) throws XmlMappingException, IOException;
}
