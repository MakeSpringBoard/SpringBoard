<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 목록</title>
</head>
<body>
    <h1>게시판 목록</h1>
    <c:if test="${not empty sessionScope.user}">
        <p>안녕하세요, ${sessionScope.user.userName}님!</p>
    </c:if>
    <c:if test="${empty sessionScope.user}">
        <p>로그인하시면 이름을 표시합니다.</p>
    </c:if>
    <table border="1">
        <tr>
            <th>글번호</th>
            <th>글제목</th>
            <th>글내용</th>
            <th>글쓴이 프로필</th>
            <th>날짜</th>
            <th>조회수</th>
            <th>좋아요</th>
            <th>싫어요</th>
            <th>댓글수</th>
        </tr>
        <c:forEach var="board" items="${boardList}">
            <tr>
                <td>${board.boardNumber}</td>
                <td>${board.boardTitle}</td>
                <td>${board.boardContent}</td>
                <td>${board.boardWriterProfile}</td>
                <td>${board.boardWriteDate}</td>
                <td>${board.boardClickCount}</td>
                <td>${board.boardLikeCount}</td>
                <td>${board.boardHateCount}</td>
                <td>${board.boardCommentCount}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
