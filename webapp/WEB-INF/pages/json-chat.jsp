<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSON Chat - WebSockets</title>

    <script>
        var username = null;
        var websocket = null;

        function init() {

            while (username === null || username === "") {
                username = prompt("Enter username");
            }

            var host = window.location.host;
            var path = window.location.pathname.split("/")[1];

            websocket = new WebSocket(
                "ws://" + host + "/" + path + "/json/chat/" + username
            );

            websocket.onopen = function(resp) {
                console.log("onopen", resp);
            }

            websocket.onmessage = function(resp) {

                var msg = JSON.parse(resp.data);

                var output = document.getElementById("messages");

                output.innerHTML +=
                    "<p><b>" + msg.sender + "</b>: " + msg.text + "</p>";

                // join / leave → cập nhật số người
                if (msg.type != 2) {
                    document.getElementById("client-count").innerHTML =
                        "Chatters: " + msg.count;
                }
            }

            websocket.onerror = function(resp) {
                alert("An error occured, closing application");
                console.log("onerror", resp);
            }

            websocket.onclose = function(resp) {
                alert(resp.reason || "Goodbye");
                console.log("onclose", resp);
            }
        }

        function send() {

            var input = document.getElementById("message");

            var msg = {
                sender: username,
                text: input.value,
                type: 2
            };

            websocket.send(JSON.stringify(msg));
            input.value = "";
        }

    </script>
</head>

<body onload="init()">

<h3>JSON Chat - WebSockets</h3>

<div id="messages" style="height:200px; overflow:auto; border:1px solid black;"></div>

<hr>

<b id="client-count">Chatters: 0</b>

<hr>

<input id="message">
<button onclick="send()">Send</button>

</body>
</html>