package com.com2mem.model;

public enum Wave {

    WAVE_0(0), WAVE_1(1), WAVE_2(2), WAVE_7(7), WAVE_14(14), WAVE_28(28), WAVE_56(56), WAVE_168(168), WAVE_365(
            365);

    private final Integer waveNumber;

    private Wave(Integer waveNumber) {
        this.waveNumber = waveNumber;
    }

    public Integer getWaveNumber() {
        return waveNumber;
    }
}
