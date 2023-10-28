<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
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

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	padding: 10px;
	border: 1px solid #ddd;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #f1f1f1;
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

.write-btn {
	float: right;
	margin-bottom: 20px;
}

p {
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<div class="container">
		<h1>게시판 목록</h1>
		<a href="/writeBoard" class="btn write-btn">글 작성</a>
		<c:if test="${not empty sessionScope.user}">
			<p>안녕하세요, ${sessionScope.user.userName}님!</p>
		</c:if>
		<c:if test="${empty sessionScope.user}">
			<p>로그인하시면 이름을 표시합니다.</p>
		</c:if>
		<form action="/logout" method="post" style="display: inline;">
			<input type="submit" value="로그아웃" class="btn" />
		</form>
		<table>
			<tr>
				<th>글번호</th>
				<th>글제목</th>
				<th>글쓴이</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="board" items="${boardList}">
				<tr>
					<td>${board.boardNumber}</td>
					<td><a href="/board/${board.boardNumber}">${board.boardTitle} (${board.boardCommentCount})</a></td>
					<td>${board.boardWriterProfile}</td>
					<td>${board.boardWriteDate}</td>
					<td>${board.boardClickCount}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
