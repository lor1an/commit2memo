package com.com2mem.marshaller.converter;

import com.com2mem.dto.Sound;
import com.thoughtworks.xstream.converters.Converter;
import com.thoughtworks.xstream.converters.MarshallingContext;
import com.thoughtworks.xstream.converters.UnmarshallingContext;
import com.thoughtworks.xstream.io.HierarchicalStreamReader;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;

public class SoundConverter implements Converter {

    public final String WAW_URL = "http://media.merriam-webster.com/soundc11/%s/%s";

    @Override
    public boolean canConvert(Class clazz) {
        return clazz.equals(Sound.class);
    }

    @Override
    public void marshal(Object source, HierarchicalStreamWriter writer,
            MarshallingContext context) {
    }

    @Override
    public Object unmarshal(HierarchicalStreamReader reader,
            UnmarshallingContext context) {
        Sound sound = new Sound();
        while (reader.hasMoreChildren()) {
            reader.moveDown();
            if ("wav".equals(reader.getNodeName())) {
                String wav = reader.getValue();
                if (wav.substring(0, 3).equals("bix")) {
                    sound.setWav(String.format(WAW_URL, "bix", wav));
                } else if (wav.substring(0, 2).equals("gg")) {
                    sound.setWav(String.format(WAW_URL, "gg", wav));
                } else if (Character.isDigit(wav.charAt(0))) {
                    sound.setWav(String.format(WAW_URL, findBeginNumber(wav),
                            wav));
                } else {
                    sound.setWav(String.format(WAW_URL, wav.charAt(0), wav));
                }
            }
            reader.moveUp();
        }
        return sound;
    }

    private String findBeginNumber(String str) {
        StringBuilder number = new StringBuilder();
        for (int i = 1; i < str.length(); i++) {
            char t = str.charAt(i);
            if (Character.isDigit(t)) {
                number.append(t);
            }
        }
        return number.toString();
    }

}