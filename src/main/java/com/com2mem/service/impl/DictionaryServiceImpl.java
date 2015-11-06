package com.com2mem.service.impl;

import java.io.IOException;
import java.net.URL;

import org.apache.commons.io.Charsets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.oxm.XmlMappingException;
import org.springframework.oxm.xstream.XStreamMarshaller;

import com.com2mem.dto.EntryList;
import com.com2mem.service.DictionaryService;
import com.com2mem.util.InputStreamFilter;

public class DictionaryServiceImpl implements DictionaryService {

    @Autowired
    XStreamMarshaller xstream;

    @Value("${dictionary}")
    private String dictionaryKey;

    @Value("${thesaurus}")
    private String thesaurusKey;

    private static final String API_URL = "http://www.dictionaryapi.com/api/v1/references/collegiate/xml/%s?key=%s";

    public EntryList getEntryListFromDictionary(String word)
            throws XmlMappingException, IOException {
        URL url = new URL(String.format(API_URL, word, dictionaryKey));
        EntryList entryList = (EntryList) xstream
                .unmarshalInputStream(InputStreamFilter.filter(
                        url.openStream(), Charsets.UTF_8, "<it>([^<]*)</it>",
                        "$1"));
        return entryList;
    }
}