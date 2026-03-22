<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<body>

<h3>Community Chat</h3>

<textarea id="chatBox" rows="12" cols="50" readonly></textarea><br>

<input type="text" id="msg" placeholder="Nhập tin nhắn..." />
<button onclick="sendMsg()">Send</button>

<script>
    var ws = new WebSocket(
        "ws://" + window.location.host + "<%=request.getContextPath()%>/text/chat"
    );

    ws.onopen = function() {
        console.log("Connected");
    };

    ws.onmessage = function(event) {
        var box = document.getElementById("chatBox");
        box.value += event.data + "\n";
    };

    ws.onerror = function(error){
        console.log("WebSocket error:", error);
    };

    function sendMsg() {
        var msg = document.getElementById("msg").value;
        ws.send(msg);
        document.getElementById("msg").value = "";
    }
</script>

</body>
</html>