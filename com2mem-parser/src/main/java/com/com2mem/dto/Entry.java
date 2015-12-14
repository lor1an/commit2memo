package com.com2mem.dto;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamAsAttribute;

@XStreamAlias("entry")
public class Entry {
    
    @XStreamAsAttribute
	private String id;
    @XStreamAlias("ew")
    private String entryWord;
    private Sound sound;
    @XStreamAlias("pr")
    private String pronunciation;
    @XStreamAlias("fl")
    private String funcLabel;
    private Definition def;
    
    public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEntryWord() {
        return entryWord;
    }

    public void setEntryWord(String entryWord) {
        this.entryWord = entryWord;
    }

    public Sound getSound() {
        return sound;
    }

    public void setSound(Sound sound) {
        this.sound = sound;
    }

    public String getPronunciation() {
        return pronunciation;
    }

    public void setPronunciation(String pronunciation) {
        this.pronunciation = pronunciation;
    }

    public String getFuncLabel() {
        return funcLabel;
    }

    public void setFuncLabel(String funcLabel) {
        this.funcLabel = funcLabel;
    }

    public Definition getDef() {
        return def;
    }

    public void setDef(Definition def) {
        this.def = def;
    }

    @Override
    public String toString() {
        return "Entry [ew=" + entryWord + ", sound=" + sound + ", pr=" + pronunciation + ", fl="
                + funcLabel + ", def=" + def + "]";
    }
    
}
