<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
var conF = confirm("정말로 환불하겠습니까?");
if (conF == true) {
	location.href = '/Movieyo/refund/addRefund.do?buyNo=' + ${buyNo} + "&userNo=" + ${userNo};
}else{
	location.href = '/Movieyo/buy/list.do';
}
</script>
<meta charset="UTF-8">

<title>환불체크</title>

</head>

<body>	
</body>

</html>