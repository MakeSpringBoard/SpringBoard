<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${board.boardTitle} - 수정</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            font-size: 2em;
            margin-bottom: 20px;
        }
        form {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 10px;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            margin-bottom: 20px;
        }
        input[type="submit"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
    <script>
function previewImage(event) {
    var reader = new FileReader();
    reader.onload = function () {
        var output = document.getElementById('imagePreview');
        output.src = reader.result;
    }
    reader.readAsDataURL(event.target.files[0]);
}
</script>
    
</head>
<body>
    <div class="container">
        <h1>${board.boardTitle} - 수정</h1>
        <form action="/editAction" method="post" enctype="multipart/form-data">
            <input type="hidden" name="boardNumber" value="${board.boardNumber}">
            <label for="boardTitle">제목</label>
            <input type="text" id="boardTitle" name="boardTitle" value="${board.boardTitle}" required>
            
            <label for="boardContent">내용</label>
            <textarea id="boardContent" name="boardContent" rows="10" required>${board.boardContent}</textarea>
            
            <c:if test="${not empty board.boardImage}">
                <input type="file" name="boardImage" onchange="previewImage(event)">
				<img id="imagePreview" src="${board.boardImage}" alt="${board.boardTitle}" style="max-width: 30%; height: 30%;">
                <br>
                <label for="boardImage">이미지</label>
            </c:if>
            
            <input type="submit" value="수정하기">
        </form>
        <button onclick="location.href='/board/${board.boardNumber}'">취소</button>
    </div>
</body>
</html>
