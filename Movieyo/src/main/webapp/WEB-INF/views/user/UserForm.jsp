<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회원 등록</title>

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		
		var emailC = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		
// 		이메일 키업 시작
		$('#email').keyup(function () {
			
			var emailInp = $('#email').val();
			
			if (emailInp.match(emailC)) {
				$('#emailText').css('display','none');
			}else {
		// 		alert('asd');
				$('#emailText').html('정확하지 않은 이메일형식입니다.');
				$('#emailText').css('display','block');
			}
		
		});
// 		이메일 키업 끝

			
		var pwC = /^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$/;
// 		비밀번호 키업 시작
		$('#password').keyup(function () {
			var pwInp = $('#password').val();	
				if (pwInp.match(pwC)) {
						$('#passwordText').css('display','none');
				}else {
					$('#passwordText').html('비밀번호는 영문, 숫자, 특수문자 3개를 조합하여<br>최소 8자리 이상이여야 합니다.');
					$('#passwordText').css('display','block');
				}	
			});
		//비밀번호 키업 끝
		
		
		//비밀번호 재확인 키업 시작
		$('#passwordC').keyup(function () {
			var pwInp = $('#password').val();
			var pwCInp = $('#passwordC').val();
				if (pwInp == pwCInp) {
					$('#passwordCText').css('display','none');
				}else {
					$('#passwordCText').css('display','block');
					$('#passwordCText').html('비밀번호가 일치하지 않습니다.');
					
				}
		});
		//비밀번호 재확인 키업 끝
		
		
		//이름 키업 시작
		var nameC = /^[가-힣]{2,4}$/;

		$('#name').keyup(function () {
			var name = $('#name').val();
				if (name.match(nameC)) {
					$('#nameText').css('display','none');
				}else {
					$('#nameText').html('한글 이름 2~4자만 입력해주세요.');
					$('#nameText').css('display','block');
					
				}
		});
		//이름 키업 끝
		
// 		닉네임 키업 시작
		var nickNameC = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,10}$/;
		$('#nickName').keyup(function () {
			var nickName = $('#nickName').val();
				if (nickName.match(nickNameC)) {
					$('#nickNameText').css('display','none');
				}else {
					$('#nickNameText').html('닉네임은 2~10자리 입력해주세요');
					$('#nickNameText').css('display','block');
					
				}
		});
// 		닉네임 키업 끝

		
// 		서브밋 클릭
		$('#submitBtn').click(function () {
			var submit = true;
	// 		이메일
			var email = $('#email').val();
				if (email == "") {
					$('#emailText').html('이메일을 입력해주세요.');
					$('#emailText').css('display','block');
					submit = false;
				}else if (!email.match(emailC)) {
					$('#emailText').css('display','block');
					$('#emailText').html('정확하지 않은 이메일형식입니다.');
					submit = false;
				}else {
					$('#emailText').css('display','none');
				}
				
	// 		비밀번호
			var password = $('#password').val();
				if (password == "") {
					$('#passwordText').html('비밀번호를 입력해주세요.');
					$('#passwordText').css('display','block');
					submit = false;
				}else if (!password.match(pwC)) {
					$('#passwordText').html('비밀번호는 영문, 숫자, 특수문자 3개를 조합하여<br>최소 8자리 이상이여야 합니다.');
					$('#passwordText').css('display','block');
					submit = false;
				}
				else {
					$('#passwordText').css('display','none');
				}
			
	// 		비밀번호 재확인
			var passwordC = $('#passwordC').val();
				if (passwordC == "") {
					$('#passwordCText').html('비밀번호 재확인을 입력해주세요.');
					$('#passwordCText').css('display','block');
					submit = false;
				}else if (password != passwordC) {
					$('#passwordCText').html('비밀번호가 일치하지 않습니다.');
					$('#passwordCText').css('display','block');
					submit = false;
				}else {
					$('#passwordCText').css('display','none');
				}
			
// 			이름
			var name = $('#name').val();
				if (name == "") {
					$('#nameText').html('이름을 입력해주세요.');
					$('#nameText').css('display', 'block');
					submit = false;
				}else {
					$('#nameText').css('display', 'none');
				}
			
// 			닉네임
			var nickName= $('#nickName').val();
				if (nickName == "") {
					$('#nickNameText').html('닉네임을 입력해주세요.');
					$('#nickNameText').css('display', 'block');
					submit = false;
				}else {
					$('#nickNameText').css('display', 'none');
				}
				
// 			성별
			if (!$("input:checked[Name='gender']").is(":checked")){ 
				$('#genderText').css('display', 'block');
				submit = false;
			}else {
				$('#genderText').css('display', 'none');
			}
			
// 			장르
			if (!$("input:checked[Name='genreNo[]']").is(":checked")){ 
				$('#genreText').css('display', 'block');
				submit = false;
			}else {
				$('genreText').css('display', 'none');
			}


			return submit;
		});
// 		서브밋 클릭 끝
	
	});
// 	레디 끝	

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

<style type="text/css">
	#movieyo{
	
	color: #ff81ab;
	font-weight: bold;
	font-style: oblique;
/* 	width: 150px; */
	margin-top:20px;
	display: block;
    font-size: 45px;
	text-decoration: none;
}
.inputBox{
 width: 310px;
 text-align: center;
 margin: auto;
/*  margin-top: 200px; */
/*  border: 1px solid #e3e3e3; */
 height: 550px;
 border-radius: 80px / 40px;

}


.input{
	width: 300px;
	height: 40px;
	position: relative;
	/* 	margin: 0 0 10px 0;  */
	/* 	padding: 10px 50px 10px 21px;  */
/*  	margin-bottom: 20px; */
	border: solid 1px #bfbfbf;
	border-radius: 4px;
	background: #fff;
}

.headerDiv{
	 width: 400px;
 text-align: center;
 margin: auto;
/*  margin-top: 200px; */
/*  border: 1px solid #e3e3e3; */
/*  height: 550px; */
 border-radius: 80px / 40px;
	
}
p{
margin: 0;
text-align: left;

}

.errorText{
	margin: 0;
	text-align: left;
	color: red;
 	display: none;
}

label{
	display:inline-block;
	width:300px;
	line-height:50px;
	text-align: left;
}

input[type="checkbox"] {
  width: 20px; 
  height: 15px; 
}

#container{
width:400px;
border: 1px solid #e3e3e3;
height: 1100px;
margin: auto;
/* margin-top: 200px; */
border-radius: 80px / 40px;
box-shadow: 0 4px 10px 0 rgb(0 0 0 / 20%), 0 4px 20px 0 rgb(0 0 0 / 19%); 
}

.btn_css {
	height: 50px;
	background: #201919;
	color: #ff81ab;
	font-size: 20px;
	border-radius: 8px;
	margin: 10px;
}	
	

</style>



</head>

<body>
	<div id="container">
	<div class="headerDiv">
<%-- 	<jsp:include page="../Header.jsp" /> --%>
	<h1 id="movieyo">무비요</h1>
	<h2>회원가입</h2>
	</div>
	<form action='./addCtr.do' method='post' id='submitForm'
		enctype="multipart/form-data">
		
		<div class="inputBox">
		
		
		<p>이메일</p>
		<input type='text' name='email' id='email' class="input">
		<p id="emailText" class="errorText">이메일을 입력해주세요.</p>
		
		<p>비밀번호</p>
		<input type='password' name='password' id='password' class="input">
		<p id="passwordText" class="errorText">비밀번호를 입력해주세요.</p>
	
		<p>비밀번호 재확인</p>
		<input type="password" id="passwordC" class="input">
		<p id="passwordCText"class="errorText">비밀번호 재확인을 입력해주세요.</p>

		<p>이름</p>
		<input type='text' name='userName' id='name' class="input">
		<p id="nameText" class="errorText">이름을 입력해주세요.</p>
		
		<p>닉네임</p>
		<input type="text" name="nickname" class="input" id="nickName">
		<p id="nickNameText" class="errorText">닉네임을 입력해주세요.</p>
		
		<p>생년월일</p>
		<input type="date" name="userBirth"  min="1920-01-01" max="2022-12-05" class="input" value="2000-01-01">
		
		
		<p>성별</p>
		<input type="checkbox" name="gender" value="남" onclick="checkOnlyOne(this)">남
		<input type="checkbox" name="gender" value="여" onclick="checkOnlyOne(this)" style="margin-top: 15px;">여
		<p  id="genderText" class="errorText">성별을 체크해주세요.</p>
		
		<p style="margin-top: 15px;">선호장르(필수사항)</p> 
			<p id="genreText" class="errorText">장르를 최소1개이상 선택해주세요.</p>
			<div style="margin-left: 20px;">
				<label>
					<input type="checkbox" name="genreNo[]" value="1">애니메이션 
					<input type="checkbox" name="genreNo[]" value="2">드라마
					<input type="checkbox" name="genreNo[]" value="3">코미디
				</label>
				
				<label>
					<input type="checkbox" name="genreNo[]" value="4">다큐멘터리
					<input type="checkbox" name="genreNo[]" value="5">범죄
					<input type="checkbox" name="genreNo[]" value="6">성인물(에로)
				</label>
				
				<label>
					<input type="checkbox" name="genreNo[]" value="7">SF
					<input type="checkbox" name="genreNo[]" value="8">멜로/로맨스
					<input type="checkbox" name="genreNo[]" value="9">어드벤처
				</label>
				
				<label>
					<input type="checkbox" name="genreNo[]" value="10">공포(호러)
					<input type="checkbox" name="genreNo[]" value="11">스릴러
					<input type="checkbox" name="genreNo[]" value="12">기타
				</label>
				
			</div>
			<input type="submit" value='가입하기' id="submitBtn" class="btn_css">
			<input type='button' value='뒤로가기' onclick='pageMoveListFnc();' class="btn_css">
		</div>
	</form>
</div>
<%-- 	<jsp:include page="../Tail.jsp" /> --%>
</body>

</html>