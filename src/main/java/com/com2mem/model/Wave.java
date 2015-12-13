package com.com2mem.model;

public enum Wave {

    WAVE_0(0L), WAVE_1(1L), WAVE_2(2L), WAVE_7(7L), WAVE_14(14L), WAVE_28(28L), WAVE_56(56L), WAVE_168(
            168L), WAVE_365(365L);

    private final Long waveSpace;

    private Wave(Long waveSpace) {
        this.waveSpace = waveSpace;
    }

    public Long getWaveSpace() {
        return waveSpace;
    }

    private static Wave[] vals = values();

    public Wave next() {
        return vals[(this.ordinal() + 1) % vals.length];
    }
}
