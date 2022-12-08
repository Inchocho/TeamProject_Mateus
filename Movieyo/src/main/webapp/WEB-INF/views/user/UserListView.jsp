<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>		

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회원정보관리</title>

<style type="text/css">
table,tr, td, th{
		border: 1px solid black;
}
td{
	height: 50px;
}
table {
		border-collapse: collapse;
}
.curPageDiv{
	margin: 0px 0px 0px 200px;
	text-align: center;
	min-width: 600px;
}
.titleContainer{
	border-bottom: 2px solid #252525;
	margin: 3px 3px 3px 0px;
}

.contContainer{
    width: 800px;
    padding: 10px 0 0 30px;
    margin: auto;
    font-size: 20px;
}
.contContainer table{
	width: 800px;
	text-align: center;
}
  
#ul li {
  list-style-type: none;
  float: left;
  margin-left: 10px;
  }
 
th {
	background-color: gray;
}
.buy_btn_css{
	height: 30px;
	font-size: 15px;
    background: #201919;
    color: #ff81ab;
    border-radius: 8px;
    margin: 10px;
}
.buy_btn_css:hover {
	background-color: rgba(135, 206, 235, 0.3);
	cursor: pointer;
}
.title_con{
	width: 800px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin: auto;
}
.title_con_sales{
	font-size: 18px;
	align-self: flex-end;
}
.title_con_sales span span{
	font-weight: bold;
}
.salesView{
	border-right: 2px dotted;
    padding-right: 10px;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">

</script>
</head>

<body>
	<header>
	<jsp:include page="/WEB-INF/views/Header.jsp"/>

	</header>
	<jsp:include page="/WEB-INF/views/UserMyPageSideMenu.jsp"></jsp:include>
		
	<div class="curPageDiv">
	
	<div class="titleContainer">
		<div class="title_con">
			<div class="title_con_title">
				<h1>회원관리</h1>
			</div>
		</div>
	</div>
		
	<div class="contContainer">
		<input type="hidden" value="${userDto.userNo}">
	<table>
		<tr>
			<th>아이디</th>
			<th>닉네임</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>성별</th>
			<th>캐쉬</th>	
			<th>수정 및 관리</th>			
		</tr>	
		
		<c:if test="${not empty userList}">
		
		<c:forEach var="userDto" items="${userList}" varStatus="varStatus">
		<tr>
			<td>
				${userDto.email}
			</td>
			<td>
				${userDto.nickname}		
			</td>
			<td>
				${userDto.userName}
			</td>				
			<td>
				<fmt:formatDate pattern="yyyy-MM-dd"
					value="${userDto.userBirth}" />
			</td>
			<td>
				${userDto.gender}
			</td>
			<td>
				${userDto.userCash}
			</td>
			<td>
				<c:choose>
					<c:when test="${userDto.userAdmin == 1}">
						관리자
					</c:when>
					<c:otherwise>
					<form id='userDetailForm' action="./one.do" method="get">
						<input type="hidden" name="userNo" value="${userDto.userNo}">
						<input class='body_userDetail_btn_css' type="submit" value="상세">
					</form>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>			
		</c:forEach>
	
		</c:if>
		<c:if test="${empty userList}">
			<tr>
				<td colspan="7" id="tdId">구매내역이 없습니다</td>
			</tr>		
		</c:if>
	</table>

	<jsp:include page="/WEB-INF/views/common/CommonPaging.jsp"/>
	
	<form action="./list.do" id="pagingForm" method="post">
		<input type="hidden" id="curPage" name="curPage"
			value="${pagingMap.commonPaging.curPage}"> <input
			type="hidden" name="keyword" value="${searchMap.keyword}"> <input
			type="hidden" name="searchOption" value="${searchMap.searchOption}">
	</form>
	
	<form action="./list.do" method="post">
		<select name="searchOption">
			<c:choose>
				<c:when test="${searchMap.searchOption == 'all'}">
					<option value="all" selected="selected">이름+이메일</option>
					<option value="USER_NAME">이름</option>
					<option value="USER_EMAIL">이메일</option>
				</c:when>
				<c:when test="${searchMap.searchOption == 'USER_NAME'}">
					<option value="all">이름+이메일</option>
					<option value="USER_NAME" selected="selected">이름</option>
					<option value="USER_EMAIL">이메일</option>
				</c:when>
				<c:when test="${searchMap.searchOption == 'USER_EMAIL'}">
					<option value="all">이름+이메일</option>
					<option value="USER_NAME">이름</option>
					<option value="USER_EMAIL" selected="selected">이메일</option>
				</c:when>
			</c:choose>
		</select> <input type="text" name="keyword" value="${searchMap.keyword}"
			placeholder="회원이름 검색"> <input type="submit" value="검색">

	</form>
		
	</div>
	</div>
	<jsp:include page="/WEB-INF/views/Tail.jsp"/>
</body>
<style>

</style>
</html>