<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>무비요 : ${movieDto.movieTitle}</title>
<style type="text/css">
img {
	width: 250px;
	height: 360px;
}
table, tr, td, th {
	border: 1px solid black;
}

table {
	border-collapse: collapse;
}

#tdId {
	width: 500px;
	height: 500px;
	text-align: center;
	font-weight: bolder;
}

.curPageDiv {
	margin: 0px;
	text-align: center;
}

.titleContainer {
	border-bottom: 2px solid #252525;
	margin: 3px 3px 3px 0px;
}

.contContainer {
	width: 600px;
	padding: 10px 0 0 30px;
	margin: auto;
}

#ul li {
	list-style-type: none;
	float: left;
	margin-left: 10px;
}

th {
	background-color: gray;
}

#alreadyBuy {
	background-color: rgba(135, 206, 235, 0.3);
	cursor: default;
	width: 400px;
}

#backBtn {
	z-index: 10;
	position: absolute;
	width: 60px;
	height: 40px;
	font-size: 30px;
	margin-top: 23px;
}
</style>

<script type="text/javascript">

</script>

</head>
	
<body>
	<p>빨강색</p>
	<jsp:include page="../Header.jsp" />
<input type="button" class="body_btn_css" id="backBtn" value="←" onclick="movePageMainFnc();"">
<div class="curPageDiv">
<div class="titleContainer">
	<h1>영화상세</h1>
</div>
		
<div class="contContainer">
	<div></div>
		<c:choose>
			<c:when test="${empty fileList}">
					첨부파일이 없습니다.<br>			
			</c:when>
		
			<c:otherwise>
				<c:forEach var="row" items="${fileList}">
<!-- 					<input type="button" value="이미지" name="file"> -->
<%-- 					${row.ORIGINAL_FILE_NAME}(${row.FILE_SIZE}kb)<br> --%>
					<img alt="image not found" src="<c:url value='/image/${row.STORED_FILE_NAME}'/>">
					<br>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	
	<form id="detailForm">
	<input type="hidden" name="userNo" value="${userDto.userNo}">
	<input type="hidden" name="movieNo" value="${movieDto.movieNo}">
	<input type="hidden" name="userCash" value="${userDto.userCash}">
	
		영화제목: <input type='text' name='movieTitle' 
			value='${movieDto.movieTitle}' readonly="readonly"><br>
<%-- 		제작연도: <input type="text" name='prdtYear' value="${movieDto.prdtYear}" readonly="readonly"> <br>  --%>
		
		제작연도 :	<fmt:formatDate pattern="yyyy" var="prdtYear"
								value="${movieDto.prdtYear}"/>
								${prdtYear}년<br>
		국가 :	<input type="text" name="nation" value="${movieDto.nation}" readonly="readonly"> <br>
		감독 :	<input type="text" name="director" value="${movieDto.director}" readonly="readonly"> <br>
		장르 :	<input type="text" name="genreName" value="${movieDto.genreName}" readonly="readonly"> <br>	
		상영시간 :	<input type="text" name="runtime" value="${movieDto.runtime}" readonly="readonly"> <br>	
		연령등급 :	<input type="text" name="grade" value="${movieDto.grade}" readonly="readonly"> <br>
		가격 :	<input type="text" name="price" value="${movieDto.price}" readonly="readonly"> <br>
		등록일 :	<fmt:formatDate pattern="yyyy-MM-dd"
								value="${movieDto.creDate}"/> <br>
		영화내용<br>
		<textarea name="movieStory" style="width: 800px; height: 400px;" readonly="readonly">${movieDto.movieStory}</textarea>
		<br>
		<c:if test="${userDto.userAdmin eq 1}">
			<input type="button" value='수정' onclick="moveMovieUD();" class="body_btn_css">
		</c:if>
	</form>
	<c:if test="${userDto.userAdmin eq 0}">
		<c:if test="${buyCheck eq 0}">
		<input type="button" value='구매' onclick="buyMoviePopFnc();" class="body_btn_css">
		<c:choose>
		<c:when test="${cartCheck eq 0}">
		<input type="button" value="장바구니 담기" onclick="inCartMoviePopFnc();" class="body_btn_css">
		</c:when>
		<c:when test="${cartCheck eq 1}">
		<input type="button" value="장바구니로 이동" onclick="pageMoveCartFnc();" class="body_btn_css">
		</c:when>
		</c:choose>
		</c:if>
		<c:if test="${buyCheck eq 1}">
		<input type="button" value='이미구매하신 영화입니다' class="body_btn_css" id="alreadyBuy">
		</c:if>
	</c:if>
</div></div>
	<jsp:include page="/WEB-INF/views/PopUp/BuyMoviePop.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/PopUp/InCartMoviePop.jsp"></jsp:include>
	<jsp:include page="../Tail.jsp" />
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
function buyMoviePopFnc() {
	htmlTag.classList.toggle('popup_focus');
	popup_layer_buymovie.style.visibility = "visible";
}
function buySubmitFnc() {
	$('#detailForm').attr('action','/Movieyo/buy/addCtr.do');
	$('#detailForm').submit();
}
function inCartMoviePopFnc() {
	htmlTag.classList.toggle('popup_focus');
	popup_layer_incartmovie.style.visibility = "visible";
}
function inCartSubmitFnc() {
	$('#detailForm').attr('action','/Movieyo/cart/addCart.do');
	$('#detailForm').submit();
}
function pageMoveCartFnc() {
	location.href = "/Movieyo/cart/list.do";
}
</script>
</html>