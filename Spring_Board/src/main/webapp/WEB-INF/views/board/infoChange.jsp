<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>회원 정보 수정</title>
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

.address-row {
	margin-bottom: 8px;
}
</style>
<script>
	function validateForm() {
		var id = document.forms["updateForm"]["userId"].value;
		var password = document.forms["updateForm"]["userPassword"].value;
		var name = document.forms["updateForm"]["userName"].value;
		var address = document.forms["updateForm"]["userAddress"].value;

		if (name === "" || address === "") {
			alert("모든 필드를 채워주세요.");
			return false;
		}

		return true;
	}

	function searchAddress() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = '';
				if (data.userSelectedType === 'R') {
					addr = data.roadAddress;
				} else {
					addr = data.jibunAddress;
				}
				var fullAddress = addr + " " + data.buildingName; // 상세 주소에 빌딩 이름 추가 (선택)
				document.getElementById("userAddress").value = fullAddress;
			}
		}).open();
	}

</script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<h2>회원 정보 수정</h2>
	<form name="updateForm" action="/updateAction" method="post"
		onsubmit="return validateForm()">
		<table>
			<tr>
				<td><label for="id">아이디:</label></td>
				<td><input type="text" id="id" name="userId"
					value="${user.userId}" required readonly></td>
			</tr>
			<tr>
				<td><label for="password">비밀번호:</label></td>
				<td><input type="password" id="password" name="userPassword"
					value="${user.userPassword}" required readonly></td>
			</tr>
			<tr>
				<td><label for="name">이름:</label></td>
				<td><input type="text" id="name" name="userName"
					value="${user.userName}" required></td>
			</tr>
			<tr>
				<td><label>주소:</label></td>
				<td><input type="text" id="userAddress" name="userAddress"
					placeholder="주소" value="${user.userAddress}" required>
					<button type="button" onclick="searchAddress()">주소 검색</button></td>
			</tr>
		</table>
		<div class="button-container">
			<button type="submit">정보 수정</button>
			<button type="button" onclick="location.href='/boardList'">취소</button>
		</div>
	</form>
</body>
</html>
