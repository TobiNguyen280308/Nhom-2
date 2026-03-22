package com.chat;

import com.fasterxml.jackson.databind.ObjectMapper;
import javax.websocket.*;
import java.io.IOException;

public class MessageEncoder implements Encoder.Text<Message> {

    private static ObjectMapper mapper = new ObjectMapper();

    @Override
    public String encode(Message message) throws EncodeException {
        try {
            return mapper.writeValueAsString(message);
        } catch (IOException e) {
            throw new EncodeException(message, "Encode error");
        }
    }

    @Override public void init(EndpointConfig config) {}
    @Override public void destroy() {}
}