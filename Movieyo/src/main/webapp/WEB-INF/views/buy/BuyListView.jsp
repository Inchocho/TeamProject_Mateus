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
	tr, td, th{
		min-width: 230px;
		display: flex;
		font-size: 16px;
		text-align: center;		
	}
	
	table {
		border-collapse: collapse;
	}
	#tdId{
	width: 500px;
	height: 500px;
	text-align: center;
	font-weight: bolder;
	}
	
	#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewContents {
    width: 100%;
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}
.curPageDiv{
	margin-left: 200px;
}
.titleContainer{
	border-bottom: 2px solid #252525;
	margin: 3px 3px 3px 0px;
}
.titleContainer h1{
	margin-left: 30px;
}
.contContainer{
    width: 1600px;
    margin: 10px 0 0 30px;
}
.contContainer table{
	width: 1600px;
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
.cartSelectInfo, .csiCkBox, .csiCkBoxView{
	display: flex;
}
.cartSelectInfo{
	flex-direction: column;
	align-items: center;
}
.csiCkBox{
	align-items: center;
	width: 250px;
	justify-content: space-between;
}
.csiCkBoxView{
	flex-direction: column;
}

#buyCartSelBtn{
	width: 250px;
    background-color: #02ace0;
    border: 1px solid black;
    color: #fff;
}
#delCartSelBtn{
	width: 250px;
    background-color: #fd7d40;
    border: 1px solid black;
    color: #fff;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">

function movieDetail(index) {
	
	location.href = "/Movieyo/movie/detail.do?movieNo=" + index.value;
}


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
		<c:choose>
			<c:when test='${userDto.userAdmin == 1}'>
				<h1>관리자 구매내역 관리
					<c:if test='${userDto.userAdmin == 1}'>
						<span style='float:right; margin-right:100px;'>총매출액 : ${totalMoney}원</span>
						<span style='float:right; margin-right:100px;'>환불금액 : ${refundMoney}원</span>
					</c:if>		
				</h1>
			</c:when>
			<c:otherwise>
				<h1>구매내역</h1>
			</c:otherwise>
		</c:choose>
	</div>
		
	<div class="contContainer">
		<input type="hidden" value="${userDto.userNo}">
	<table>
		<tr style="min-height: 50px; border: 1px solid black;">
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
		<tr style="min-height: 50px; border: 1px solid black;">
			<td>
				${buyMap.movieTitle}
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
									<input type="submit" name='refundSubmitBtn' id='refundSubmit' value="환불하기">					
								</c:when>
								<c:otherwise>
									<input type="button" onclick='movieDetail(movieNo${varStatus.index});' value='구매하러 가기'>
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