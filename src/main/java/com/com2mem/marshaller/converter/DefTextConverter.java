package com.com2mem.marshaller.converter;

import com.com2mem.dto.DefText;
import com.thoughtworks.xstream.converters.Converter;
import com.thoughtworks.xstream.converters.MarshallingContext;
import com.thoughtworks.xstream.converters.UnmarshallingContext;
import com.thoughtworks.xstream.io.HierarchicalStreamReader;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;

public class DefTextConverter implements Converter {

    @Override
    public boolean canConvert(Class clazz) {
        return clazz.equals(DefText.class);
    }

    @Override
    public void marshal(Object source, HierarchicalStreamWriter writer,
            MarshallingContext context) {
    }

    @Override
    public Object unmarshal(HierarchicalStreamReader reader,
            UnmarshallingContext context) {
        DefText dt = new DefText();
        String value = reader.getValue();
        while (reader.hasMoreChildren()) {
            reader.moveDown();
            if ("sx".equals(reader.getNodeName())) {
                dt.setSynonymous("syn. to:"+ reader.getValue());
            }
            if("un".equals(reader.getNodeName())){
                dt.setUsageNote("(" + reader.getValue() + ")");
            }
            if("vi".equals(reader.getNodeName())){
                dt.setVerbalIllustration("(f. e.:"+reader.getValue()+")"); 
            }
            reader.moveUp();
        }
        dt.setValue(value);

        return dt;
    }
}
