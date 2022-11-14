<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   	<form action='./addCtr.do' method='post' id='submitForm'
      enctype="multipart/form-data">
      영화제목 : <input type='text' name='movieTitle' id='movieTitle'><br>      
      제작년도 : <input type='text' name='prdtYear' id='prdtYear;	'><br>      
      제작국가 : <input type='text' name='nation' id='nation'><br>      
      제작감독 : <input type='text' name='director' id='director'><br>      
      상영시간 : <input type='text' name='runtime' id='runtime'><br>      
      영화등급 : <input type='text' name='grade' id='grade'><br>      
      영화가격 : <input type='text' name='price' id='price'><br>           
      <input type='submit' value='가입하기'>
   </form>  
</body>
</html>