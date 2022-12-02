<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회원 등록</title>

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>

<script type="text/javascript">
	function pageMoveListFnc() {
		location.href = '../auth/login.do';
	}
	
	function checkOnlyOne(element) {
	        
	        const checkboxes 
	            = document.getElementsByName("gender");
	        
	        checkboxes.forEach((cb) => {
	          cb.checked = false;
	        })
	        
	        element.checked = true;
	}
	
	

</script>

</head>

<body>

<%-- 	<jsp:include page="../Header.jsp" /> --%>
	<h1>무비요</h1>
	<h4>회원가입</h4>

	<form action='./addCtr.do' method='post' id='submitForm'
		enctype="multipart/form-data">
		이메일<br> <input type='text' name='email' id='email'><br>

		비밀번호<br> <input type='password' name='password' id='password'><br>

		비밀번호 재확인<br> <input type="password" id="passwordC"><br>

		이름<br> <input type='text' name='userName' id='name'><br>

		생년월일<br> <input type="date" name="userBirth" /> <br>
		
		닉네임<br>
		<input type="text" name="nickname"><br>
		
		성별<br> <input
			type="checkbox" name="gender" value="남" onclick="checkOnlyOne(this)">남
		<input type="checkbox" name="gender" value="여"
			onclick="checkOnlyOne(this)">여 <br>
		
		선호장르<br> 
			<input type="checkbox" name="genreNo[]" value="1">애니메이션 
			<input type="checkbox" name="genreNo[]" value="2">드라마<br>
			<input type="checkbox" name="genreNo[]" value="3">코미디
			<input type="checkbox" name="genreNo[]" value="4">다큐멘터리<br>
			<input type="checkbox" name="genreNo[]" value="5">범죄
			<input type="checkbox" name="genreNo[]" value="6">성인물(에로)<br>
			<input type="checkbox" name="genreNo[]" value="7">SF
			<input type="checkbox" name="genreNo[]" value="8">멜로/로맨스<br>
			<input type="checkbox" name="genreNo[]" value="9">어드벤처
			<input type="checkbox" name="genreNo[]" value="10">공포(호러)<br>
			<input type="checkbox" name="genreNo[]" value="11">스릴러<br>
			<input type="checkbox" name="genreNo[]" value="12">기타<br>
			
		<input type='button' value='뒤로가기' onclick='pageMoveListFnc();'><br>
		<input type='submit' value='가입하기'>
	</form>

	<jsp:include page="../Tail.jsp" />

</body>

</html>