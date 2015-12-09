package com.com2mem.marshaller;

import java.util.List;

import org.springframework.oxm.xstream.XStreamMarshaller;

import com.com2mem.dto.Entry;
import com.thoughtworks.xstream.XStream;

public class C2MXStreamMarshaller extends XStreamMarshaller{
    
    private List<Class<?>> classesToUnmarshall;
    
    @Override
    protected void configureXStream(final XStream xstream) {
        super.configureXStream(xstream);
        xstream.ignoreUnknownElements();
        for (Class<?> clazz : classesToUnmarshall) {
            xstream.processAnnotations(clazz);
        }
        xstream.aliasAttribute(Entry.class, "id", "id");
        
    }

    public List<Class<?>> getClassesToUnmarshall() {
        return classesToUnmarshall;
    }

    public void setClassesToUnmarshall(List<Class<?>> classesToUnmarshall) {
        this.classesToUnmarshall = classesToUnmarshall;
    }
    
}
