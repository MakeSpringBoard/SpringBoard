<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 작성</title>
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
        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            margin-bottom: 20px;
        }
        input[type="file"] {
            margin-bottom: 20px;
        }
        .btn {
            display: inline-block;
            font-size: 16px;
            color: #fff;
            background-color: #28a745;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>글 작성</h1>
        <form action="/writeAction" method="post" enctype="multipart/form-data">
            <label for="boardTitle">제목:</label>
            <input type="text" id="boardTitle" name="boardTitle" required>
            
            <label for="boardWriterProfile">작성자:</label>
            <input type="text" id="boardWriterProfile" name="boardWriterProfile" value="${sessionScope.user.userName}" readonly>
            
            <label for="boardContent">내용:</label>
            <textarea id="boardContent" name="boardContent" rows="10" required></textarea>
            
            <label for="boardImage">사진 첨부:</label>
            <input type="file" id="boardImage" name="boardImage">
            
            <button type="submit" class="btn">글 작성</button>
        </form>
    </div>
</body>
</html>
