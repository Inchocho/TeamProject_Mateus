<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>		

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>구매내역관리</title>

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

function movieDetail(index) {
	
	location.href = "/Movieyo/movie/detail.do?movieNo=" + index.value;
}

function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

$(document).ready(function() {
	var salesMoney = $('#salesMoney').val();
	var refundMoney = $('#refundMoney').val();
	var htmlStr = "";
	
	htmlStr = comma(salesMoney);
	$('#salesMoneyView').html(htmlStr);
	
	htmlStr = comma(refundMoney);
	$('#refundMoneyView').html(htmlStr);
});

</script>
</head>

<body>
	<header>
	<jsp:include page="/WEB-INF/views/Header.jsp"/>

	</header>
	<jsp:include page="/WEB-INF/views/UserMyPageSideMenu.jsp"></jsp:include>
		
	<!-- 관리자의 경우 수입 총액을 보여줌 -->


	<div class="curPageDiv">
	
	<div class="titleContainer">
		<div class="title_con">
		<c:choose>
		<c:when test='${userDto.userAdmin == 1}'>
			<div class="title_con_title">
				<h1>관리자 구매내역 관리</h1>
			</div>
			<c:if test='${userDto.userAdmin == 1}'>
			<div class="title_con_sales">
			<input type="hidden" id="refundMoney" value="${refundMoney}">
			<input type="hidden" id="salesMoney" value="${totalMoney}">
				<span class="salesView">환불금액: <span id="refundMoneyView"></span> 원</span>
				<span>총매출액: <span id="salesMoneyView"></span> 원</span>
			</div>
			</c:if>		
		</c:when>
		<c:otherwise>
		<div class="title_con_title">
			<h1>구매내역</h1>
		</div>
		</c:otherwise>
		</c:choose>
		</div>
	</div>
		
	<div class="contContainer">
		<input type="hidden" value="${userDto.userNo}">
	<table>
		<tr>
			<th>영화제목</th>
			<th>가격</th>
			<th>구매일</th>
			<th>상태</th>
			<c:if test='${userDto.userAdmin == 1}'>
				<th>구매자</th>
				<th>회원번호</th>	
				<th>구매번호</th>			
			</c:if>			
			<c:if test='${userDto.userAdmin != 1}'>
				<th>환불신청</th>
			</c:if>
		</tr>	
		
		<c:if test="${not empty buyListMap}">
		
		<c:forEach var="buyMap" items="${buyListMap}" varStatus="varStatus">
		<tr>
			<td>
				<c:choose>
					<c:when test='${userDto.userAdmin == 0}'>
						<a href='#' onclick='movieDetail(movieNo${varStatus.index});'>
							${buyMap.movieTitle}
						</a>
					</c:when>
					<c:when test='${userDto.userAdmin == 1}'>
							${buyMap.movieTitle}
					</c:when>
				</c:choose>
			</td>
			<td>
				${buyMap.moviePrice}원				
			</td>				
			<td>
				<fmt:formatDate pattern="yyyy-MM-dd" 
					value = "${buyMap.buyDate}" />
			</td>			
			<td>
				${buyMap.buyStatus}
			</td>					
			<c:if test='${userDto.userAdmin == 1}'>
				<td>${buyMap.userNickName}</td>
				<td>${buyMap.buyUserNo}</td>
				<td>${buyMap.buyNo}</td>
			</c:if>				
			<c:if test='${userDto.userAdmin != 1}'>
				<td>
					<form id="refundAddFrom${varStatus.index}" action="../refund/addRefund.do" method="GET">
							<c:choose>
								<c:when test="${buyMap.buyStatus eq '환불신청중'}">
									환불신청중
								</c:when>
								<c:when test="${buyMap.buyStatus eq '환불불가'}">
									<a href='#'>문의하러가기</a>
								</c:when>								
								<c:when test="${buyMap.requestDeny != 0}">
									<input type="submit" name='refundSubmitBtn' id='refundSubmit' value="환불하기" class="buy_btn_css">					
								</c:when>
								<c:otherwise>
									<input type="button" onclick='movieDetail(movieNo${varStatus.index});' value='구매하러 가기' class="buy_btn_css">
								</c:otherwise>
							</c:choose>
						<input type="hidden" name="buyCheck" value="${varStatus.index}">		
						<input type="hidden" name="buyNo" value="${buyMap.buyNo}">
						<input type='hidden' name='userNo' value="${buyMap.buyUserNo}">
						<input type='hidden' id='movieNo${varStatus.index}' name='movieNo${varStatus.index}' value="${buyMap.movieNo}">
						<input type="hidden" id="buyCurPage" name="curPage" value="">
						<input type="hidden" name="keyword" value="${searchMap.keyword}">
						<input type="hidden" name="searchOption" value="${searchMap.searchOption}">
					</form>					
				</td>	
			</c:if>	
		</tr>			
		</c:forEach>
	
		</c:if>
		<c:if test="${empty buyListMap}">
			<tr>
				<td colspan="8" id="tdId">구매내역이 없습니다</td>
			</tr>		
		</c:if>
	</table>

	<jsp:include page="/WEB-INF/views/common/Paging.jsp"/>
	
	<form action="./list.do" id="pagingForm" method="post">
		<input type="hidden" id="curPage" name="curPage"
			value="${pagingMap.moviePaging.curPage}">	
		<input type="hidden"  name="userNo" value="${userDto.userNo}">			
		<input type="hidden"  name="keyword" value="${searchMap.keyword}">
		<input type="hidden"  name="searchOption" value="${searchMap.searchOption}">
	</form>
	
	<form action="./list.do" method="post">
		<select name="searchOption">
			<c:choose>
				<c:when test="${searchMap.searchOption == 'all'}">
					<option value="all"<c:if test="${searchMap.searchOption eq 'all'}">selected</c:if>>전체</option>
					<option value="MOVIE_TITLE">영화제목</option>
					<option value="BUY_STATUS">환불상태</option>
					<c:if test="${userDto.userAdmin == 1}">
						<option value="USER_NICKNAME">구매자</option>
					</c:if>					
				</c:when>
				<c:when test="${searchMap.searchOption == 'MOVIE_TITLE'}">
					<option value="all">전체</option>
					<option value="MOVIE_TITLE"<c:if test="${searchMap.searchOption eq 'MOVIE_TITLE'}">selected</c:if>>영화제목</option>
					<option value="BUY_STATUS">환불상태</option>		
					<c:if test="${userDto.userAdmin == 1}">
						<option value="USER_NICKNAME">구매자</option>
					</c:if>								
				</c:when>				
				<c:when test="${searchMap.searchOption == 'BUY_STATUS'}">
					<option value="all">전체</option>
					<option value="MOVIE_TITLE">영화제목</option>					
					<option value="BUY_STATUS"<c:if test="${searchMap.searchOption eq 'BUY_STATUS'}">selected</c:if>>환불상태</option>
					<c:if test="${userDto.userAdmin == 1}">
						<option value="USER_NICKNAME">구매자</option>
					</c:if>						
				</c:when>
				<c:when test="${searchMap.searchOption == 'USER_NICKNAME'}">
					<option value="all">전체</option>
					<option value="MOVIE_TITLE">영화제목</option>
					<option value="BUY_STATUS">환불상태</option>	
					<c:if test="${userDto.userAdmin == 1}">				
						<option value="USER_NICKNAME"<c:if test="${searchMap.searchOption eq 'USER_NICKNAME'}">selected</c:if>>구매자</option>
					</c:if>						
				</c:when>	
			</c:choose>
		</select>
		<input type='hidden' name='userNo' value="${userDto.userNo}">	
		
		<input type="text" name="keyword" value="${searchMap.keyword}" placeholder="검색">
		<input type="submit" value="검색">			
	</form>	
		
	</div>
	</div>
	<jsp:include page="/WEB-INF/views/Tail.jsp"/>
	
</body>
</html>