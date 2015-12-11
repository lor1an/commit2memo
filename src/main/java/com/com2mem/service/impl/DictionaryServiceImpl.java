package com.com2mem.service.impl;

import java.io.IOException;
import java.net.URL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.oxm.XmlMappingException;
import org.springframework.oxm.xstream.XStreamMarshaller;

import com.com2mem.dto.EntryList;
import com.com2mem.filter.InputStreamFilter;
import com.com2mem.service.DictionaryService;

public class DictionaryServiceImpl implements DictionaryService {

    @Autowired
    XStreamMarshaller xstream;

    @Value("${dictionary}")
    private String dictionaryKey;

    @Value("${thesaurus}")
    private String thesaurusKey;

    private final String replacementTags = "it|d_link|i_link|dx_ety|dx_def";

    private static final String API_URL = "http://www.dictionaryapi.com/api/v1/references/collegiate/xml/%s?key=%s";

    public EntryList getEntryListFromDictionary(final String word)
            throws XmlMappingException, IOException {
        URL url = new URL(String.format(API_URL, word, dictionaryKey));

        EntryList entryList = (EntryList) xstream
                .unmarshalInputStream(InputStreamFilter.filterTags(
                        url.openStream(), replacementTags));
        return entryList;
    }
}
