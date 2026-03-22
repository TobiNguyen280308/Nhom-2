package com.chat;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@ServerEndpoint(
        value = "/json/chat/{username}",
        encoders = MessageEncoder.class,
        decoders = MessageDecoder.class
)
public class JsonChatServerEndpoint {

    private static Map<String, Session> sessions = new HashMap<>();

    // broadcast
    private void broadcast(Message message) {
        sessions.forEach((username, session) -> {
            try {
                session.getBasicRemote().sendObject(message);
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
    }

    // JOIN
    @OnOpen
    public void onOpen(@PathParam("username") String username, Session session) {

        if (sessions.containsKey(username)) {
            throw new RuntimeException("Username already exists");
        }

        session.getUserProperties().put("username", username);
        sessions.put(username, session);

        Message message = new Message(
                "joined the chat",
                0,
                username,
                sessions.size()
        );

        broadcast(message);
    }

    // CHAT
    @OnMessage
    public void onMessage(Message message, Session session) {
        broadcast(message);
    }

    // LEAVE
    @OnClose
    public void onClose(Session session) {

        String username = (String) session.getUserProperties().get("username");
        sessions.remove(username);

        Message message = new Message(
                "left the chat",
                1,
                username,
                sessions.size()
        );

        broadcast(message);
    }

    // ERROR
    @OnError
    public void onError(Session session, Throwable throwable) {
        try {
            session.close();
        } catch (IOException e) {
            throw new RuntimeException("Cannot close session");
        }
    }
}