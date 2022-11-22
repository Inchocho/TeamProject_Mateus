<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<form action="./addMovie.do" method="post" id='submitForm'
		enctype="multipart/form-data">
		영화제목:	<input type="text" name='movieTitle' id='movieTitle'>
		제작년도: <input type="text" name='prdtYear' id='prdtYear'>
		국가: <input type="text" name='nation' id='nation'>
		감독: <input type="text" name='director' id='director'>
		장르: <input type='text' name='genre' id='genre'>
		상영시간: <input type='text' name='runtime' id='runtime'>
		상영등급: <input type='text' name='grade' id='grade'>
		가격: <input type='text' name='price' id='price'>
	</form>
</body>
</html>