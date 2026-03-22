package com.chat;

import com.fasterxml.jackson.databind.ObjectMapper;
import javax.websocket.*;
import java.io.IOException;

public class MessageDecoder implements Decoder.Text<Message> {

    private static ObjectMapper mapper = new ObjectMapper();

    @Override
    public Message decode(String json) throws DecodeException {
        try {
            return mapper.readValue(json, Message.class);
        } catch (IOException e) {
            throw new DecodeException(json, "Decode error");
        }
    }

    @Override
    public boolean willDecode(String json) {
        return json.contains("text");
    }

    @Override public void init(EndpointConfig config) {}
    @Override public void destroy() {}
}