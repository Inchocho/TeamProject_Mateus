<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>새로나온책 팝업창</title>
		<meta http-equiv="content-type"
		 content="text/html; charset=utf-8" />
		<style type="text/css">
		* {
			margin: 0;
			padding: 0;
		}
		</style>
		
		<script type="text/javascript">
	
			window.onload = function(){
				var parentValGetObj = document.getElementById('parentValGet');					
				parentValGetObj.addEventListener('click',getParentValueFnc);
			}
			
			function getParentValueFnc(){
				var parentValue = 
					window.opener.document.getElementById('parentText').value;
				
				var resultTextDivObj = document.getElementById('resultTextDiv');
					resultTextDivObj.innerHTML = parentValue;
			}
		</script>
		
	</head>
	
	<body>
		
		<div id='resultTextDiv'>여기에 부모창의 내용을 가져온다</div>
	
		<div>			
			<input type="button" id='parentValGet' value="부모값 가져오기 버튼"> 			
		</div>
		
		<p>
			<img src="images/popup.jpg" alt="이달에 새로나온책" usemap="#pop" />
		</p>
		<map name="pop" id="pop">
			<area shape="rect" coords="228,371,294,399" href="#"
				onclick="window.close();" alt="창닫기" />
		</map>
	</body>
</html>
