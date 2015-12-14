package com.com2mem.dto;

import java.util.List;

public class Definition {
            
    private List<DefText> sndf;

    public List<DefText> getSndf() {
        return sndf;
    }
    public void setSndf(List<DefText> sndf) {
        this.sndf = sndf;
    }

    @Override
    public String toString() {
        return "Def [sndf=" + sndf + "]";
    }

}
