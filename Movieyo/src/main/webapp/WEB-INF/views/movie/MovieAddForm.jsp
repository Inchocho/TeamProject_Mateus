<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c' %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화추가</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>	
	<form action="addCtr.do" method="post" id='submitForm'
		enctype="multipart/form-data">
		영화제목:	<input type="text" name='movieTitle' id='movieTitle'><br>
		제작년도: <input type="text" name='prdtYear' id='prdtYear'><br>
		국가: <input type="text" name='nation' id='nation'><br>
		감독: <input type="text" name='director' id='director'><br>
		장르: <input type='text' name='genre' id='genre'><br>
		상영시간: <input type='text' name='runtime' id='runtime'><br>
		상영등급: <input type='text' name='grade' id='grade'><br>
		가격: <input type='text' name='price' id='price'><br>
		파일: <input type='file' name='file'>
		<input type='submit' value='추가' id='submitBtn'>				
	</form>
</body>
</html>