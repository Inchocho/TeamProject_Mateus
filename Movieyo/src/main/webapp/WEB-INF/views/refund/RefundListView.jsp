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
	table, tr, td, th{
		border:1px solid black; 
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
    width: 600px;
    margin: 10px 0 0 30px;
}
.contContainer table{
	width: 600px;
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
	<form id="refundAdmit${status.index}" action="../refund/updateRefund.do" method="POST">
		<input type="hidden" value="${userDto.userNo}">
	<table>
		<tr>
			<c:choose>
				<c:when test="${userDto.userAdmin == 1}">
					<th>회원번호</th>
					<th>회원이름</th>
					<th>영화이름</th>
					<th>영화가격</th>
					<th>구매날짜</th>
					<th>신청날짜</th>			
					<th>수락버튼</th>
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
		<c:forEach var="refundMap" items="${refundListMap}">
			<tr>
				<c:choose>
					<c:when test="${userDto.userAdmin == 1}">
						<td>
							<input type='text' value='${refundMap.refundUserNo}'>
						</td>
						<td>
							<input type='text' value='${refundMap.refundUserName}'>
						</td>
						<td>
							<input type='text' value='${refundMap.movieTitle}'>
						</td>
						<td>
							<input type='text' value='${refundMap.moviePrice}'>
						</td>
						<td>
							<input type='text' value='<fmt:formatDate pattern="yyyy-MM-dd" 
								value="${refundMap.refundDate}"/>'>
						</td>
						<td>
							<input type='text' value='<fmt:formatDate pattern="yyyy-MM-dd" 
								value="${refundMap.buyDate}"/>'>
						</td>
						<td>
							<c:choose>
								<c:when test="${refundChk !=  1}">				
									<input id='rBtnYes' type='submit' value='수락'>
									<input id='rBtnNo' type='submit' value='거절'>			
								</c:when>
								<c:otherwise>
									<input type="text" value="환불완료됨" readonly="readonly">
								</c:otherwise>
							</c:choose>
							<input type="hidden" name="refundNo" value="${refundMap.refundNo}">
							<input type="hidden" name="buyNo" value="${refundMap.buyNo}">
							<input type='hidden' name='movieNo' value="${refundMap.movieNo}">
							<input type='hidden' name='userNo' value="${refundMap.refundUserNo}">
							<input type="hidden" name="moviePrice" value="${refundMap.moviePrice}">
							<input type="hidden" id="refundCurPage" name="curPage" value="">
							<input type="hidden" name="keyword" value="${searchMap.keyword}">
							<input type="hidden" name="searchOption" value="${searchMap.searchOption}">
							<input type="hidden" name="admit" value='1'>						
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
				<td colspan="8" id="tdId">환불내역이 없습니다</td>
			</tr>		
		</c:if>
	</table>
	
	</form>

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

$(function(){
	var refundStatusStr = $('#refundStatus').val();
	if(refundStatusStr == '환불완료됨'){
		$('#rBtnYes').prop("type", "text");	
	}
});

// //선택항목,합계 보여주기
// var htmlStr = $('#cartSelCount').val();
// $('#cartSelCountView').html(htmlStr);
// 	htmlStr = $('#cartSelPrice').val();
// 	htmlStr = comma(htmlStr);
// $('#cartSelPriceView').html(htmlStr);
// 	//다른작업시 넣을 Fnc
// 	function selViewRefresh() {
// 		var htmlStr = $('#cartSelCount').val();
// 		$('#cartSelCountView').html(htmlStr);
// 			htmlStr = $('#cartSelPrice').val();
// 			htmlStr = comma(htmlStr);
// 		$('#cartSelPriceView').html(htmlStr);
// 	};

// //선택항목구매하기 모달창띄우기
// var buyCartSelBtn = document.getElementById("buyCartSelBtn");
// var popup_layerObj = document.getElementById("popup_layer");

// buyCartSelBtn.addEventListener("click", function(e) {
// 	var cartSelCount = document.getElementById("cartSelCount");
// 	if (cartSelCount.value == 0) {
// 		e.preventDefault();
// 		alert("선택하신항목이 없습니다.")
// 	}else{
// 		var htmlStr = "";
// 		htmlStr = $('#cartSelCount').val() -1;
// 		$('#selCountMinOne').html(htmlStr);
		
// 		htmlStr = $('#cartSelPrice').val();
// 		htmlStr = comma(htmlStr);
// 		$('#selPrice').html(htmlStr);
		
// 		htmlStr = $('#popViewUserCash').text();
// 		htmlStr = comma(htmlStr);
// 		$('#popViewUserCash').html(htmlStr);
// 		//
// 		var checkedFir = $('.selCartMovie').first();
// 		var findMtitle = "#tdMtitle" + checkedFir.val();
// 		htmlStr = checkedFir.parent().siblings(findMtitle).text();
// 		$('#selMovieTitleFir').html(htmlStr);
		
// 		popup_layer.style.visibility = "visible";
// 	}
// });
// 	//선택항목 구매 submit
// 	var buyBtn = document.getElementById("buyBtn");
// 	buyBtn.addEventListener("click", function(e) {
// 		$('#buyCartSelectForm').attr("action", "cart/cartBuy.do");
// 		$('#buyCartSelectForm').submit();
// 	});
	
// //선택항목 제외
// 	var delCartSelBtn = document.getElementById("delCartSelBtn");
// 	delCartSelBtn.addEventListener("click", function(e) {
// 		//cartList중 세션userNo 의 cartDto 제거 후 redirect:장바구니
// 		$("input[id^='cartSelCN']").attr("name", "movieNo");
// // 		$('#buyCartSelectForm').attr("action", "cart/cartDelete.do");
// // 		$('#buyCartSelectForm').submit();
// 	});
	
// //체크박스 선택
// 	var count = 0;
// 	var sumPrice = 0;
	
// 	$("input[id^='cartSelCN']").bind('change', function(){
// 		if ($(this).is(':checked')) {
// 			$(this).attr("class", "selCartMovie");
// 			sumPrice += parseInt($(this).parent().siblings("td[id^='cartPsel']").text());
// 			count++;
// 		}else{
// 			$(this).removeAttr("class");
// 			sumPrice -= parseInt($(this).parent().siblings("td[id^='cartPsel']").text());
// 			count--;
// 		}
// 		$('#cartSelCount').val(count);
// 		$('#cartSelPrice').val(sumPrice);
// 		selViewRefresh();
// 	});
// //체크박스 전체선택
// 	var countAll = $("input[id^='cartSelCN']").length;
// 	var sumPriceAll =0;
// 	$("td[id^='cartPsel']").each(function() {
// 		sumPriceAll += parseInt($(this).text());
// 	});
	
// $('#allck').change(function() {
// 	if ($(this).is(':checked')) {
// 		$("input[id^='cartSelCN']").prop('checked',true);
// 		$("input[id^='cartSelCN']").attr("class", "selCartMovie");
// 		count = countAll;
// 		sumPrice = sumPriceAll;
// 	}else {
// 		$("input[id^='cartSelCN']").prop('checked',false);
// 		$("input[id^='cartSelCN']").removeAttr("class");
// 		count = 0;
// 		sumPrice = 0;
// 	}
// 	$('#cartSelCount').val(count);
// 	$('#cartSelPrice').val(sumPrice);
// 	selViewRefresh();
// });



// // 숫자 콤마 포멧터
// 	function comma(str) {
//         str = String(str);
//         return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
//     }

//     function uncomma(str) {
//         str = String(str);
//         return str.replace(/[^\d]+/g, '');
//     } 
    
//     function inputNumberFormat(obj) {
//         obj.value = comma(uncomma(obj.value));
//     }
    
//     function inputOnlyNumberFormat(obj) {
//         obj.value = onlynumber(uncomma(obj.value));
//     }
    
//     function onlynumber(str) {
// 	    str = String(str);
// 	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1');
// 	}

</script>
</html>