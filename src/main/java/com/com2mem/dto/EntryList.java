package com.com2mem.dto;

import java.util.List;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamImplicit;

@XStreamAlias("entry_list")
public class EntryList {
    
    @XStreamImplicit(itemFieldName="entry")  
    List<Entry> entryList;
    
    @Override
    public String toString() {
        return "EntryList [entryList=" + entryList + "]";
    }

    public List<Entry> getEntryList() {
        return entryList;
    }

    public void setEntryList(List<Entry> entryList) {
        this.entryList = entryList;
    }
    
    
    
}
