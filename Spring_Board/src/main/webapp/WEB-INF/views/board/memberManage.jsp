<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<style>
table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    padding: 10px;
    border: 1px solid #ddd;
    text-align: left;
}

th {
    background-color: #f2f2f2;
}
</style>
</head>
<body>
    <h1>회원 관리</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>이름</th>
            <th>주소</th>
        </tr>
        <c:forEach var="user" items="${userList}">
            <tr>
                <td>${user.userId}</td>
                <td>${user.userName}</td>
                <td>${user.userAddress}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
