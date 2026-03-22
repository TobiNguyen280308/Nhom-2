<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Simple Chat - WebSockets</title>

    <script>
        var websocket = null;

        // Khi load trang
        function init() {

            // Kết nối tới server Bài 1
            var host = window.location.host;
            var path = window.location.pathname.split("/")[1];

            var username = prompt("Nhập username:");

            websocket = new WebSocket("ws://" + host + "/" + path + "/json/chat/" + username);

            // Khi kết nối thành công
            websocket.onopen = function(resp) {
                console.log("onopen", resp);
            }

            // Khi nhận tin nhắn từ server
            websocket.onmessage = function(resp) {

                var msg = JSON.parse(resp.data);

                var html = document.getElementById("messages").innerHTML;

                document.getElementById("messages").innerHTML =
                    html + "<p><b>" + msg.sender + ":</b> " + msg.text +
                    " (" + msg.count + " users)</p>";

                console.log("onmessage", msg);
            }

            // Khi lỗi
            websocket.onerror = function(resp) {
                alert("An error occured, closing application");
                console.log("onerror", resp);
            }

            // Khi đóng kết nối
            websocket.onclose = function(resp) {
                alert(resp.reason || "Goodbye");
                console.log("onclose", resp);
            }
        }

        // Gửi tin nhắn
        function send() {
            var message = document.getElementById("message").value;

            var msgObj = {
                text: message,
                type: 2,
                sender: "client",
                count: 0
            };

            websocket.send(JSON.stringify(msgObj));
            document.getElementById("message").value = "";
        }
    </script>

</head>

<body onload="init()">

<h3>WebSocket Chat Client</h3>

<div id="messages" style="height:200px; overflow:auto; border:1px solid black;"></div>
<hr>

<input id="message">
<button onclick="send()">Send</button>

</body>
</html>