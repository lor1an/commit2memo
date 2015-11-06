package com.com2mem.util;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;

import org.apache.commons.io.IOUtils;

import static org.apache.commons.io.IOUtils.toInputStream;

public class InputStreamFilter {

    public static InputStream filter(InputStream stream, Charset charset,
            String regex, String replacement) throws IOException {
        return toInputStream(IOUtils.toString(stream, charset).replaceAll(regex, replacement),charset);
    }
}
