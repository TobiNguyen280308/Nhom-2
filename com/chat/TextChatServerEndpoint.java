package com.chat;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@ServerEndpoint("/text/chat")
public class TextChatServerEndpoint {

    // Lưu danh sách client
    private static Map<String, Session> sessions = new HashMap<>();

    // Gửi tin nhắn cho tất cả
    private void broadcast(String message) {
        sessions.forEach((id, session) -> {
            try {
                session.getBasicRemote().sendText(message);
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
    }

    // Khi có người kết nối
    @OnOpen
    public void onOpen(Session session) {
        sessions.put(session.getId(), session);
        broadcast("Someone joined the chat!");
    }

    // Khi nhận tin nhắn
    @OnMessage
    public void onMessage(String message, Session session) {
        broadcast(message);
    }

    // Khi rời đi
    @OnClose
    public void onClose(Session session) {
        sessions.remove(session.getId());
        broadcast("Someone left the chat!");
    }

    // Khi lỗi
    @OnError
    public void onError(Session session, Throwable throwable) {
        try {
            session.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}