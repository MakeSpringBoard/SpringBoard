<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>회원가입</title>
<style>
body {
	font-family: Arial, sans-serif;
	text-align: center;
	margin-top: 50px;
}

table {
	width: 100%;
	max-width: 500px;
	margin: auto;
}

td {
	padding: 8px;
}

input[type="text"], input[type="password"], button {
	padding: 8px;
	box-sizing: border-box;
}

input[type="submit"], button {
	background-color: #28a745;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	padding: 10px 15px;
}

input[type="submit"]:hover, button:hover {
	background-color: #218838;
}

.button-container button {
	background-color: #007bff;
}

.button-container button:hover {
	background-color: #0056b3;
}
</style>
<script>
	function validateForm() {
		var id = document.forms["signupForm"]["id"].value;
		var password = document.forms["signupForm"]["password"].value;
		var confirmPassword = document.forms["signupForm"]["confirmPassword"].value;
		var name = document.forms["signupForm"]["name"].value;
		var address = document.forms["signupForm"]["address"].value;

		if (id == "" || password == "" || confirmPassword == "" || name == ""
				|| address == "") {
			alert("모든 필드를 채워주세요.");
			return false;
		}

		if (password !== confirmPassword) {
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			return false;
		}

		return true;
	}

	function searchAddress() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = ''; // 주소 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailAddress").focus();
			}
		}).open();
	}
</script>
<!-- Daum에서 제공하는 API -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<h2>회원가입</h2>
	<form name="signupForm" action="signupAction.jsp" method="post"
		onsubmit="return validateForm()">
		<table>
			<tr>
				<td><label for="id">아이디:</label></td>
				<td><input type="text" id="id" name="id" required></td>
			</tr>
			<tr>
				<td><label for="password">비밀번호:</label></td>
				<td><input type="password" id="password" name="password"
					required></td>
			</tr>
			<tr>
				<td><label for="confirmPassword">비밀번호 확인:</label></td>
				<td><input type="password" id="confirmPassword"
					name="confirmPassword" required></td>
			</tr>
			<tr>
				<td><label for="name">이름:</label></td>
				<td><input type="text" id="name" name="name" required></td>
			</tr>
			<tr>
				<td><label>주소:</label></td>
				<td>
					<div class="address-container">
						<div class="address-row">
							<input type="text" id="postcode" name="postcode"
								placeholder="우편번호" required>
							<button type="button" onclick="searchAddress()">주소 검색</button>
						</div>
						<div class="address-row">
							<input type="text" id="address" name="address" placeholder="주소"
								required>
						</div>
						<div class="address-row">
							<input type="text" id="detailAddress" name="detailAddress"
								placeholder="상세 주소" required>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</form>
	<div class="button-container">
		<button onclick="document.signupForm.submit()">회원가입</button>
		<button onclick="location.href='login.jsp'">로그인</button>
	</div>
</body>
</html>
