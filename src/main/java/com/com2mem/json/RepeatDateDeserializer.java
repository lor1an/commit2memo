package com.com2mem.json;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;

public class RepeatDateDeserializer extends JsonDeserializer<LocalDate>{

    @Override
    public LocalDate deserialize(JsonParser parser, DeserializationContext context) throws IOException,
            JsonProcessingException {
        String value = parser.getText();
        return LocalDate.parse(value, DateTimeFormatter.BASIC_ISO_DATE);
    }

}
