<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>		

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>환불내역관리</title>

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
.title_con{
	width: 1000px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin: auto;
}
.title_con_title{
	margin-left: 20px;
}
.contContainer{
    width: 1000px;
    padding: 10px 0 0 30px;
    margin: auto;
    font-size: 20px;
}
.contContainer table{
	width: 1000px;
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
.refund_btn_css{
	height: 45px;
	font-size: 15px;
	margin: 2px;
	color: snow;
	font-weight: bold;
	border-radius: 8px;
}
#rBtnYes{
	background-color: #57c6f3;
}
#rBtnNo{
	background-color: #f3426b;
}
#rBtnYes:hover, #rBtnNo:hover {
	background-color: rgba(0, 0, 0, 0.1);
	color: black;
	cursor: pointer;
}
</style>

</head>

<body>
	<header>
	<jsp:include page="/WEB-INF/views/Header.jsp"/>
	</header>
	<jsp:include page="/WEB-INF/views/UserMyPageSideMenu.jsp"></jsp:include>
	<div class="curPageDiv">
	
	<div class="titleContainer">
		<div class="title_con">
		<c:choose>
		<c:when test='${userDto.userAdmin == 1}'>
			<div class="title_con_title">
				<h1>관리자 회원 환불 관리</h1>
			</div>
		</c:when>
		<c:otherwise>
			<div class="title_con_title">
				<h1>환불내역</h1>
			</div>
		</c:otherwise>
		</c:choose>
		</div>
	</div>
		
	<div class="contContainer">
		<input type="hidden" value="${userDto.userNo}">
	<table>
		<tr>
			<c:choose>
				<c:when test="${userDto.userAdmin == 1}">
					<th>환불번호</th>
					<th>회원번호</th>
					<th>회원이름</th>
					<th>영화이름</th>
					<th>영화가격</th>
					<th>구매날짜</th>
					<th>신청날짜</th>			
					<th>관리자확인</th>
					<th>환불상태</th>		
				</c:when>
				<c:when test="${userDto.userAdmin == 0}">
					<th>영화제목</th>
					<th>영화가격</th>
					<th>구매날짜</th>
					<th>신청날짜</th>
					<th>환불상태</th>
				</c:when>				
			</c:choose>			
		</tr>
		<c:if test="${not empty refundListMap}">
		<c:forEach var="refundMap" items="${refundListMap}" varStatus="varStatus">
			<tr>
				<c:choose>
					<c:when test="${userDto.userAdmin == 1}">
						<td>
							${refundMap.refundNo}
						</td>
						<td>
							${refundMap.refundUserNo}
						</td>
						<td>
							${refundMap.refundUserName}
						</td>
						<td>
							${refundMap.movieTitle}
						</td>
						<td>
							${refundMap.moviePrice}
						</td>
						<td>
							<fmt:formatDate pattern="yyyy-MM-dd" 
								value="${refundMap.buyDate}"/>
						</td>
						<td>
							<fmt:formatDate pattern="yyyy-MM-dd" 
								value="${refundMap.refundDate}"/>
						</td>
						<td>
							<form id="refundAdmit${varStatus.index}" action="/Movieyo/refund/updateRefund.do" method="POST">
								<input type="hidden" id="refundNo" name="refundNo" value="${refundMap.refundNo}">
								<input type="hidden" name="buyNo" value="${refundMap.buyNo}">
								<input type='hidden' name='movieNo' value="${refundMap.movieNo}">
								<input type='hidden' name='userNo' value="${refundMap.refundUserNo}">
								<input type="hidden" name="moviePrice" value="${refundMap.moviePrice}">
								<input type="hidden" id="refundCurPage" name="curPage" value="">
								<input type="hidden" name="keyword" value="${searchMap.keyword}">
								<input type="hidden" name="searchOption" value="${searchMap.searchOption}">															
								<input type='hidden' name='submitCheck${varStatus.index}' id='submitCheck' value='${varStatus.index}'>
								<input type="hidden" id="admit${varStatus.index}" name="admit" value=''>
							<c:choose>
								<c:when test="${refundMap.admitDeny != 0}">				
									<input id='rBtnYes' class="refund_btn_css" type='button'  onclick="refundOk(submitCheck${varStatus.index});" value='수락'>
									<input id='rBtnNo' class="refund_btn_css" type='button' onclick="refundDeny(submitCheck${varStatus.index});" value='거절'>	
								</c:when>
								<c:otherwise>
									처리완료
								</c:otherwise>
							</c:choose>														
							</form>						
						</td>
						<td>
							${refundMap.refundStatus}
						</td>						
					</c:when>
					<c:when test="${userDto.userAdmin == 0}">
						<td>
							${refundMap.movieTitle}
						</td>
						<td>
							${refundMap.moviePrice}
						</td>
						<td>
							<fmt:formatDate pattern="yyyy-MM-dd" 
								value = "${refundMap.buyDate}" />
						</td>	
						<td>
							<fmt:formatDate pattern="yyyy-MM-dd" 
								value="${refundMap.refundDate}"/>
						</td>
						<td>
							${refundMap.refundStatus}
						</td>						
					</c:when>			
				</c:choose>	
			</tr>	
		</c:forEach>
		</c:if>
		<c:if test="${empty refundListMap}">
			<tr>
				<td colspan="9" id="tdId">환불내역이 없습니다</td>
			</tr>		
		</c:if>
	</table>

	<jsp:include page="/WEB-INF/views/common/CommonPaging.jsp"/>
	
	<form action="./list.do" id="pagingForm" method="post">
		<input type="hidden" id="curPage" name="curPage"
			value="${pagingMap.commonPaging.curPage}">	
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
					<option value="REFUND_STATUS">환불상태</option>
					<option value="REFUND_NO">환불번호</option>
				</c:when>
				<c:when test="${searchMap.searchOption == 'MOVIE_TITLE'}">
					<option value="all">전체</option>
					<option value="MOVIE_TITLE"<c:if test="${searchMap.searchOption eq 'MOVIE_TITLE'}">selected</c:if>>제목</option>
					<option value="REFUND_STATUS">환불상태</option>
					<option value="REFUND_NO">환불번호</option>
				</c:when>				
				<c:when test="${searchMap.searchOption == 'REFUND_STATUS'}">
					<option value="all">전체</option>
					<option value="MOVIE_TITLE">제목</option>					
					<option value="REFUND_STATUS"<c:if test="${searchMap.searchOption eq 'REFUND_STATUS'}">selected</c:if>>환불상태</option>
					<option value="REFUND_NO">환불번호</option>
				</c:when>	
				<c:when test="${searchMap.searchOption == 'REFUND_NO'}">
					<option value="all">전체</option>
					<option value="MOVIE_TITLE">제목</option>					
					<option value="REFUND_STATUS">환불상태</option>
					<option value="REFUND_NO"<c:if test="${searchMap.searchOption eq 'REFUND_NO'}">selected</c:if>>환불번호</option>				
				</c:when>			
			</c:choose>
		</select>
		
		<input type="text" name="keyword" value="${searchMap.keyword}" placeholder="검색">
		<input type="submit" value="검색">
	</form>
		
	</div>
	</div>
	<jsp:include page="/WEB-INF/views/PopUp/CartBuyPop.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/Tail.jsp"/>
	
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">

function refundOk(index){
	
	var conF = confirm("환불수락 하시겠습니까");
	
	if(conF){
		let admitIndex = '#admit' + index.value;
		$(admitIndex).attr('value', 1);	
		let refundOk = '#refundAdmit' + index.value;
		$(refundOk).attr('action','/Movieyo/refund/updateRefund.do');
		$(refundOk).submit();
	}
}

function refundDeny(index){
	
	var conF = confirm("환불거절 하시겠습니까");
	
	if(conF){
		let admitIndex = '#admit' + index.value;
		$(admitIndex).attr('value', 0);
		let refundDeny = '#refundAdmit' + index.value;
		$(refundDeny).attr('action','/Movieyo/refund/updateRefund.do');
		$(refundDeny).submit();
	}
}

$(function(){
	
});

</script>
</html>