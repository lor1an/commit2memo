package com.com2mem.dto;

public class DefText {
    
    private String senseNumber;
    private String value;
    private String synonymous;
    private String usageNote;
    private String verbalIllustration;
    
    public String getSenseNumber() {
        return senseNumber;
    }
    public void setSenseNumber(String senseNumber) {
        this.senseNumber = senseNumber;
    }
    public String getValue() {
        return value;
    }
    public void setValue(String value) {
        this.value = value;
    }
    public String getSynonymous() {
        return synonymous;
    }
    public void setSynonymous(String synonymous) {
        this.synonymous = synonymous;
    }
    public String getUsageNote() {
        return usageNote;
    }
    public void setUsageNote(String usageNote) {
        this.usageNote = usageNote;
    }
    public String getVerbalIllustration() {
        return verbalIllustration;
    }
    public void setVerbalIllustration(String verbalIllustration) {
        this.verbalIllustration = verbalIllustration;
    }
    @Override
    public String toString() {
        return "DefText [senseNumber=" + senseNumber+", value=" + value + ", synonymous=" + synonymous
                + ", usageNote=" + usageNote + ", verbalIllustration="
                + verbalIllustration + "]";
    }
    
}
