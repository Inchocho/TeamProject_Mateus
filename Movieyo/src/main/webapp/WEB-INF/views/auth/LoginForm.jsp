<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>로그인</title>

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>

<script type="text/javascript">
// function findPw() {
// 	location.href = '../UserFindpw.do';
// }



	$(function () {
		var emailC = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		var pwC = /^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$/;
		
		$('#emailInp').keyup(function () {
		
		var emailInp = $('#emailInp').val();
		
		if (emailInp.match(emailC)) {
			$('#emailText').css('display','none');
		}else {
	// 		alert('asd');
			$('#emailText').html('정확하지 않은 이메일형식입니다.');
			$('#emailText').css('display','block');
		}
	
	});
		//이메일 키업 끝

		$('#pwInp').keyup(function () {
			var pwInp = $('#pwInp').val();	
				if (pwInp.match(pwC)) {
						$('#passwordText').css('display','none');
				}else {
					$('#passwordText').html('비밀번호는 영문, 숫자, 특수문자 3개를 조합하여<br>최소 8자리 이상이여야 합니다.');
					$('#passwordText').css('display','block');
				}	
			});
		//비밀번호 키업 끝
	
	
	
	
	
// 	$('.btn_login').click(function () {
// 		var submit = true;
		
// 			var email = $('#emailInp').val()
// 		if (email == "") {
// 			$('#emailText').html('이메일을 입력해주세요.');
// 			submit = false;
// 		}else if (!email.match(emailC)) {
// 			$('#emailText').html('정확하지 않은 이메일형식입니다.');
// 			$('#emailText').css('display','block');
// 			submit = false;
// 		}else {
// 			$('#emailText').css('display','none');
// 		}
		
		
		
// 		var password = $('#pwInp').val();
		
// 		if (password == "") {
// 			$('#passwordText').html('비밀번호를 입력해주세요.');
// 			submit = false;
// 		}else if (!password.match(pwC)) {
// 			$('#passwordText').html('비밀번호는 영문, 숫자, 특수문자 3개를 조합하여<br>최소 8자리 이상이여야 합니다.');
// 			$('#passwordText').css('display','block');
// 			submit = false;
// 		}else {
// 			$('#passwordText').css('display','none');
// 		}
		
// 		return submit;
// 	});
	//서브밋 클릭 끝
	
	});
	//함수레디 끝



</script>

<style type="text/css">
a{
	color: red;
}

#emailText, #passwordText {
/* 	display: none; */
	color: red;
/* 	height: 1px; */
}

.input{
	width: 300px;
	height: 40px;
	position: relative;
	/* 	margin: 0 0 10px 0;  */
	/* 	padding: 10px 50px 10px 21px;  */
	margin-top: 12px;
	border: solid 1px #bfbfbf;
	border-radius: 4px;
	background: #fff;
}

.btn_login, .add_btn{
/* 	display: block; */
	width: 300px;
	height: 50px;
	color: #ff81ab;
	background: #201919;
	text-align: center;
	font-size: 15px;
	font-weight: bold;
	line-height: 49px;
	border: 0;
	border-radius: 4px;
	cursor: pointer;
	font-size: 20px;
	
}



#movieyo{
	margin-top:20px;
	color: #ff81ab;
	font-weight: bold;
	font-style: oblique;
/* 	width: 150px; */
/* 	margin: 0px; */
	display: block;
    font-size: 45px;
	text-decoration: none;
}
/* .w3-content, .w3-auto { */
/*     margin-left: auto; */
/*     margin-right: auto; */
/* } */

.findDiv{
	height: 70px;
	line-height: 100px;
}

.TextDiv{
	text-align: left;
	padding-left: 45px;
/* 	font-size: 15px; */
}

.container{
 width: 400px;
 text-align: center;
 margin: auto;
 margin-top: 200px;
 border: 1px solid #e3e3e3;
 height: 580px;
 border-radius: 80px / 40px;
 box-shadow: 0 4px 10px 0 rgb(0 0 0 / 20%), 0 4px 20px 0 rgb(0 0 0 / 19%);
}

</style>
</head>

<body>
	<div class="container">
		<div>
		<h1 id="movieyo">무비요</h1>
		</div>
		<div>
		<h2>로그인</h2>
		</div>
		<div>
		<form action="./loginCtr.do" method="post">
			<div style="height: 180px;">
			<div>
			<input type="text" name="email" id="emailInp" placeholder="이메일" class="input"><br>
			</div>
			<div style="height: 20px;" class="TextDiv">	
				<a id="emailText"></a>
			</div>
			<div>	
			<input type="password" name="password" id="pwInp" placeholder="비밀번호" class="input"><br>
			</div>
			<div style="height: 20px;" class="TextDiv">
				<a id="passwordText">
<!-- 				비밀번호는 영문, 숫자 중 2개를 조합하여<br> -->
<!-- 				 최소 8자리 이상이여야 합니다. -->
				 </a>
			</div>
				</div>
					<input type="submit" value="로그인" class="btn_login">
			
		</form>
			<div class="findDiv">
			<a style="color: #ff81ab;" href="../user/UserFindpw.do">비밀번호를 잊으셨나요?</a>
			</div>
			<br>
		<button type="button" class="add_btn" onclick="location.href ='../user/add.do'">새 계정 만들기</button>
		</div>
	</div>	
</body>

</html>