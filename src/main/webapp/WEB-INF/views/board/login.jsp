<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>로그인</title>
<style>
@font-face {
    font-family: 'SDSamliphopangche_Outline';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/SDSamliphopangche_Outline.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body {
	font-family: 'SDSamliphopangche_Outline', Arial, sans-serif;
	text-align: center;
	margin: 0;
	padding: 0;
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	background-size: cover;
	background-image: url("/images/IMG_1054.PNG");
}

table {
	margin: auto;
	background-color: rgba(255, 255, 255, 1);
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

td {
	padding: 8px;
	text-align: left;
}

input[type="text"], input[type="password"], button {
	padding: 8px;
	box-sizing: border-box;
	width: 100%;
	border-radius: 4px;
	margin-bottom: 8px;
}

button {
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	padding: 10px 15px;
	margin: 0;
}

button:hover {
	background-color: #0056b3;
}

form {
    position: relative;
    display: inline-block;
}

h2 {
    position: absolute;  /* 제목의 위치를 절대적으로 설정 */
    top: 0%;          /* 제목이 form의 상단 바깥으로 올라가게 설정 */
    left: 50%;           /* 가로 중앙에 배치 */
    transform: translateX(-50%);  /* 정확한 중앙 배치를 위해 X축으로 -50% 이동 */
    margin-bottom: 0;    /* 마진 제거 */
    color: white;
    font-size : 70pt;
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
	<h2>LOGIN</h2>
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
