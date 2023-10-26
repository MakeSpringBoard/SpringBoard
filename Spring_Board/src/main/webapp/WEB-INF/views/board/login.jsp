<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
        }
        table {
            width: 100%;
            max-width: 400px;
            margin: auto;
        }
        td {
            padding: 8px;
        }
        input[type="text"], input[type="password"], button {
            padding: 8px;
            box-sizing: border-box;
            width: 100%;
        }
        button {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            padding: 10px 15px;
        }
        button:hover {
            background-color: #0056b3;
        }
        h2 {
            margin-bottom: 20px;
        }
        .button-container {
            display: flex;
            justify-content: space-between;
        }
    </style>
    <script>
        function validateForm() {
            var id = document.forms["loginForm"]["id"].value;
            var password = document.forms["loginForm"]["password"].value;

            if (id == "" || password == "") {
                alert("아이디와 비밀번호를 입력해주세요.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
<h2>로그인</h2>
<form name="loginForm" action="/loginAction" method="post" onsubmit="return validateForm()">
    <table>
        <tr>
            <td><label for="id">아이디:</label></td>
            <td><input type="text" id="id" name="userId" required></td>
        </tr>
        <tr>
            <td><label for="password">비밀번호:</label></td>
            <td><input type="password" id="password" name="userPassword" required></td>
        </tr>
        <tr>
            <td colspan="2">
                <div class="button-container">
                    <button type="submit">로그인</button>
                    <button type="button" onclick="location.href='/register'">회원가입</button>
                </div>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
