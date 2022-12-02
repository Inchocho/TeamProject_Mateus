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
		var pwC = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
		
		$('#emailInp').keyup(function () {
		
		var emailInp = $('#emailInp').val();
		
		if (emailInp.match(emailC)) {
				$('#emailText').css('display','none');
		}else {
	// 		alert('asd');
			$('#emailText').css('display','block');
		}
	
	});
	//이메일 키업 끝
		$('#pwInp').keyup(function () {
			var pwInp = $('#pwInp').val();	
				if (pwInp.match(pwC)) {
						$('#passwordText').css('display','none');
				}else {
					$('#passwordText').css('display','block');
				}	
			});
	
	});







</script>

<style type="text/css">
a{
	color: red;
}

#emailText, #passwordText {
	display: none;
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
}

#movieyo{
	color: #ff81ab;
	font-weight: bold;
	font-style: oblique;
/* 	width: 150px; */
	margin: 0px;
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

</style>
</head>

<body>
	<div style="width: 400px; text-align: center; margin: auto; margin-top: 200px;">
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
				<a id="emailText">정확하지 않은 이메일형식입니다.</a>
			</div>
			<div>	
			<input type="password" name="password" id="pwInp" placeholder="비밀번호" class="input"><br>
			</div>
			<div style="height: 20px;" class="TextDiv">
				<a id="passwordText">비밀번호는 영문, 숫자 중 2개를 조합하여<br>
				 최소 8자리 이상이여야 합니다.</a>
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