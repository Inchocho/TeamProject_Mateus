<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회원 등록</title>

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
	
	<jsp:include page="../Header.jsp"/>
	<h1>무비요</h1>
	<h4>회원가입</h4>
   	
   	<form action='./addCtr.do' method='post' id='submitForm'
      enctype="multipart/form-data">
      이메일<br>
      <input type='text' name='email' id='email'><br>
      
      비밀번호<br>
      <input type='password' name='password' id='password'><br>
      
      비밀번호 재확인<br>
      <input type="password" id="passwordC"><br>
      
      이름<br>
      <input type='text' name='userName' id='name'><br>
      
      생년월일<br>
      <input type="date" name="userBirth"/> <br>   

      닉네임<br>
      <input type="text" name="nickname"><br>

      <label for="mem_gender">성별 </label><br>
      
      <input type="checkbox" name="gender" value="남" onclick="checkOnlyOne(this)">남
      <input type="checkbox" name="gender" value="여" onclick="checkOnlyOne(this)">여 <br>
      
<!--       선호장르<br> -->
<!--       <input type="checkbox" name="genre" value="1">액션 -->
<!--       <input type="checkbox" name="genre" value="2">코미디<br> -->
<!--       <input type="checkbox" name="genre" value="3">드라마 -->
<!--       <input type="checkbox" name="genre" value="4">스릴러<br> -->
<!--       <input type="checkbox" name="genre" value="5">멜로 -->
<!--       <input type="checkbox" name="genre" value="6">SF<br> -->
<!--       <input type="checkbox" name="genre" value="7">스포츠 -->
<!--       <input type="checkbox" name="genre" value="8">공포<br> -->
<!--       <input type="checkbox" name="genre" value="9">판타지 -->
<!--       <input type="checkbox" name="genre" value="10">음악<br> -->
            
         
      <input type='button' value='뒤로가기' onclick='pageMoveListFnc();'><br>
      <input type='submit' value='가입하기'>
   </form>  
	
	<jsp:include page="../Tail.jsp"/>
	
</body>

</html>