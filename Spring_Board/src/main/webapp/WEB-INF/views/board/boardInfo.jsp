<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${board.boardTitle}</title>
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
        p {
            margin-bottom: 20px;
        }
        .meta {
            font-size: 0.9em;
            color: #555;
            margin-bottom: 20px;
        }
        img {
            max-width: 50%;
            height: 50%;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>${board.boardTitle}</h1>
        <div class="meta">
            <span>작성자: ${board.boardWriterProfile}</span> |
            <span>작성일: ${board.boardWriteDate}</span> |
            <span>조회수: ${board.boardClickCount}</span>
        </div>
        <c:if test="${not empty board.boardImage}">
            <img src="${board.boardImage}" alt="${board.boardTitle}">
        </c:if>
        <p>${board.boardContent}</p>
    </div>
    <div class="buttons">
    <c:if test="${board.boardWriterId == user.userId}">
        <button onclick="location.href='/editBoard/${board.boardNumber}'">수정</button>
        <button onclick="location.href='/deleteBoard/${board.boardNumber}'">삭제</button>
    </c:if>
    <button onclick="location.href='/boardList'">목록</button>
</div>
</body>
</html>
