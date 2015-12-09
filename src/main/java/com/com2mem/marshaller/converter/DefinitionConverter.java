package com.com2mem.marshaller.converter;

import java.util.ArrayList;
import java.util.List;

import com.com2mem.dto.DefText;
import com.com2mem.dto.Definition;
import com.thoughtworks.xstream.converters.Converter;
import com.thoughtworks.xstream.converters.MarshallingContext;
import com.thoughtworks.xstream.converters.UnmarshallingContext;
import com.thoughtworks.xstream.io.HierarchicalStreamReader;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;

public class DefinitionConverter implements Converter {

    @Override
    public boolean canConvert(Class clazz) {
        return clazz.equals(Definition.class);
    }

    @Override
    public void marshal(Object source, HierarchicalStreamWriter writer,
            MarshallingContext context) {
    }

    @Override
    public Object unmarshal(HierarchicalStreamReader reader,
            UnmarshallingContext context) {
        Definition def = new Definition();
        List<DefText> sndts = new ArrayList<>();
        DefText dt = null;
        String sn = null;
        while (reader.hasMoreChildren()) {
            reader.moveDown();
            if (dt != null) {
                dt.setSenseNumber(sn);
                sndts.add(dt);
                dt = null;
            }
            
            if ("sn".equals(reader.getNodeName()) || "vt".equals(reader.getNodeName())) {
                sn = reader.getValue();
            } else if ("dt".equals(reader.getNodeName())) {
               dt = (DefText) context.convertAnother(def, DefText.class);
            }
            reader.moveUp();
        }
        if(dt != null){
        	dt.setSenseNumber(sn);
            sndts.add(dt);
        }
        def.setSndf(sndts);
        return def;
    }

}
