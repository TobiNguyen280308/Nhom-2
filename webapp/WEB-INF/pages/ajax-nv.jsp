<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>AJAX Nhân Viên</title>
</head>

<body>

<h3>AJAX Fetch Demo</h3>

<button onclick="loadData()">Load Nhân Viên</button>

<script>

  function loadData() {

    fetch("ajax/nv")
            .then(response => response.json())
            .then(data => {
              console.log("JSON nhận được:", data);
            })
            .catch(error => {
              console.error("Lỗi:", error);
            });

  }

</script>

</body>
</html>