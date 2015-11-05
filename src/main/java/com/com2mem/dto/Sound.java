package com.com2mem.dto;

public class Sound {
    
    private String wav;

    public String getWav() {
        return wav;
    }

    public void setWav(String wav) {
        this.wav = wav;
    }

    @Override
    public String toString() {
        return "Sound [wav=" + wav + "]";
    }
    
}
