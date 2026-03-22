<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Upload AJAX</title>
</head>
<body>

<h3>Upload File (AJAX)</h3>

<input type="file" id="file">
<button onclick="upload()">Upload</button>

<script>

    function upload() {

        let fileInput = document.getElementById("file");
        let file = fileInput.files[0];

        let formData = new FormData();
        formData.append("file", file);

        fetch("ajax/upload", {
            method: "POST",
            body: formData
        })
            .then(response => response.json())
            .then(data => {
                console.log("Upload result:", data);
            })
            .catch(error => {
                console.error("Upload error:", error);
            });
    }

</script>

</body>
</html>