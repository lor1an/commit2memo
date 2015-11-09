package com.com2mem.util;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;

import org.apache.commons.io.Charsets;
import org.apache.commons.io.IOUtils;

public class InputStreamFilter {

    private static final String TAG_REGEX = "<(%s)>([^<]*)</(%s)>";
    private static final String REPLACEMENT_GROUP = "$2";
    private static final Charset DEFAULT_CHARSET = Charsets.UTF_8;

    public static InputStream filterTags(InputStream in, Charset charset,
            String replacementTags) throws IOException {
        String stream = IOUtils.toString(in, charset);
        return IOUtils.toInputStream(stream.replaceAll(
                String.format(TAG_REGEX, replacementTags, replacementTags),
                REPLACEMENT_GROUP), charset);
    }

    public static InputStream filterTags(InputStream in, String replacementTags)
            throws IOException {
        return filterTags(in, DEFAULT_CHARSET, replacementTags);
    }
}
