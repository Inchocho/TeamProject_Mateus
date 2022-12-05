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
	tr, td, th{
		min-width: 176px;
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

</head>

<body>
	<header>
	<jsp:include page="/WEB-INF/views/Header.jsp"/>
	</header>
	<jsp:include page="/WEB-INF/views/UserMyPageSideMenu.jsp"></jsp:include>
	<div class="curPageDiv">
	
	<div class="titleContainer">
		<c:choose>
			<c:when test='${userDto.userAdmin == 1}'>
				<h1>관리자 회원 환불 관리</h1>
			</c:when>
			<c:otherwise>
				<h1>환불내역</h1>
			</c:otherwise>
		</c:choose>
	</div>
		
	<div class="contContainer">
		<input type="hidden" value="${userDto.userNo}">
	<table>
		<tr style="min-height: 50px; border: 1px solid black;">
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
			<tr style="border: 1px solid black;">
				<c:choose>
					<c:when test="${userDto.userAdmin == 1}">
						<td style="min-height: 50px;">
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
								value="${refundMap.refundDate}"/>
						</td>
						<td>
							<fmt:formatDate pattern="yyyy-MM-dd" 
								value="${refundMap.buyDate}"/>
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
									<input id='rBtnYes' type='button'  onclick="refundOk(submitCheck${varStatus.index});" value='수락'>
									<input id='rBtnNo' type='button' onclick="refundDeny(submitCheck${varStatus.index});" value='거절'>	
								</c:when>
								<c:otherwise>
									환불완료
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
	let admitIndex = '#admit' + index.value;
	$(admitIndex).attr('value', 1);	
	let refundOk = '#refundAdmit' + index.value;
	$(refundOk).attr('action','/Movieyo/refund/updateRefund.do');
	$(refundOk).submit();
}

function refundDeny(index){
	let admitIndex = '#admit' + index.value;
	$(admitIndex).attr('value', 0);
	let refundDeny = '#refundAdmit' + index.value;
	$(refundDeny).attr('action','/Movieyo/refund/updateRefund.do');
	$(refundDeny).submit();
}

$(function(){
	
});

</script>
</html>