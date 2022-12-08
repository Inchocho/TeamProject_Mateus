<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>무비요</title>
<style>
img {
	width: 250px;
	height: 370px;
}

html:lang(ko) {
    font-family: RobotoInCjk, "Noto Sans KR", "Apple SD Gothic Neo", "Nanum Gothic", "Malgun Gothic", sans-serif;
}

.titleContainer{
	width: 1350px;
    margin: 0px auto;
}
.contContainer{
	width: 1350px;
    margin: 0px auto;
}
.con_curList{
    position: relative;
    overflow-x: hidden;
    overflow-y: hidden;
    margin: 0px;
}
.con_movieList{
    list-style: none;
	display: flex;
    flex-wrap: nowrap;
    margin: 0px;
    padding: 0px;
    transform: translateX(0px);
    transition: 500ms;
}
.con_movie{
	margin: 10px;
}
.con_movie:hover{
	opacity: 0.3;
	cursor: pointer;
}
.con_btn_area{
	display: flex;
    position: absolute;
    top: 0px;
    z-index: 2;
    align-items: center;
    width: 30px;
    height: 400px;
}
.con_btn{
	z-index: 3;
	position: absolute;
	width: 35px;
	height: 35px;
	font-size: 25px;
    background: #201919;
    color: #ff81ab;
    border-radius: 8px;
}
.con_btn:hover {
	background-color: rgba(135, 206, 235, 0.6);
	cursor: pointer;
}
.con_btn_hide{
	display: none;
	z-index: 0;
	
}
.title{
font-size: 16px;
font-weight: 800;
color: #292a32;
}
.info{
color: #292a32;
font-size: 14px;
font-weight: 400;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
	function movePageMovieDtail(movieNo) {
		var url = "./detail.do?movieNo=" + movieNo;
		location.href = url;
	}
	function translateX(num) {
		
		var rslt = "translateX(" + num + "px)";
		return rslt;
	}
	function numFiltnext(num) {
		if (num > 0) {
			num = 0;
		}else if (num <= -4000) {
			num = -5400;
		}else if (num <= -2600) {
			num = -4050;
		}else if (num <= -1300) {
			num = -2700;
		}else if (num <= 0) {
			num = -1350;
		}
		return num;
	}
	function numFiltprev(num) {
		if (num > 0) {
			num = 0;
		}else if (num <= -4100) {
			num = -4050;
		}else if (num <= -2800) {
			num = -2700;
		}else if (num <= -1400) {
			num = -1350;
		}else if (num <= 0) {
			num = 0;
		}
		return num;
	}
	function movieList_prevBtn_fnc(listIdx) {
		var movieListId = "#con_movieList_" + listIdx;
		var inXStr = $(movieListId).css("transform").replace(/[^0-9\-,]/g,'').split(',')[4];
		var inX = parseInt(inXStr.substr(0,5));
		var prevX = numFiltprev(inX);
		
		if (prevX >= -4050) {
			var nextBtnId = "#nextBtn_" + listIdx;
			$(nextBtnId).attr("class", "con_btn");
		}
	
		$(movieListId).css("transform", translateX(prevX));
		if (prevX >= 0) {
			var prevBtnId = "#prevBtn_" + listIdx;
			$(prevBtnId).attr("class", "con_btn_hide");
		}
	}
	function movieList_nextBtn_fnc(listIdx) {
		var movieListId = "#con_movieList_" + listIdx;
		var inXStr = $(movieListId).css("transform").replace(/[^0-9\-,]/g,'').split(',')[4];
		var inX = parseInt(inXStr.substr(0,5));
		var nextX = numFiltnext(inX);
		$(movieListId).css("transform", translateX(nextX));
		
		if (nextX < 0) {
			var prevBtnId = "#prevBtn_" + listIdx;
			$(prevBtnId).attr("class", "con_btn");
		}
		if (nextX <= -4050) {
			var nextBtnId = "#nextBtn_" + listIdx;
			$(nextBtnId).attr("class", "con_btn_hide");
		}
		
	}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />

<div style="width:100%" class="curPageDiv">
<div class="movie_list_container">
	<div class="titleContainer">
		<h1>무비요영화</h1>
	</div>
	<div class="contContainer">
		<div class="con_curList">
			<ul class="con_movieList" id="con_movieList_1">
			<c:forEach var="row" items="${fileList}" varStatus="status">
			<c:set var="movieDto" value="${movieList[status.index]}" />
				<li class="con_movie" onclick="movePageMovieDtail(${movieDto.movieNo});">
					<div>
						<img alt="image not found"
							src="<c:url value='/image/${row.get(0).STORED_FILE_NAME}'/>">
					</div>
					<div>
						 <a class="title">${movieDto.movieTitle}</a><br>
						 <a class="info"><fmt:formatDate pattern="yyyy"
									value="${movieDto.prdtYear}"/> ・ ${movieDto.nation}</a><br>
						 <a class="info">${movieDto.genreName}</a>
					</div>
				</li>
			</c:forEach>
			</ul>
			<div class="con_btn_area">
				<button class="con_btn_hide" id="prevBtn_1" onclick="movieList_prevBtn_fnc(1);">⫷</button>
			</div>
			<div class="con_btn_area" style="margin-left: 1315px;">
				<button class="con_btn" id="nextBtn_1" onclick="movieList_nextBtn_fnc(1);">⫸</button>
			</div>
		</div>
	</div>
</div>
<div class="movie_list_container">
	<div class="titleContainer">
		<h1>영화제목순</h1>
	</div>
	<div class="contContainer">
		<div class="con_curList">
			<ul class="con_movieList" id="con_movieList_2">
			<c:forEach var="fileList_title" items="${fileList_title}" varStatus="status">
			<c:set var="movieDto" value="${movieList_title[status.index]}" />
				<li class="con_movie" onclick="movePageMovieDtail(${movieDto.movieNo});">
					<div>
						<img alt="image not found"
							src="<c:url value='/image/${fileList_title.STORED_FILE_NAME}'/>">
					</div>
					<div>
						 <a class="title">${movieDto.movieTitle}</a><br>
						 <a class="info"><fmt:formatDate pattern="yyyy"
									value="${movieDto.prdtYear}"/> ・ ${movieDto.nation}</a><br>
						 <a class="info">${movieDto.genreName}</a>
					</div>
				</li>
			</c:forEach>
			</ul>
			<div class="con_btn_area">
				<button class="con_btn_hide" id="prevBtn_2" onclick="movieList_prevBtn_fnc(2);">⫷</button>
			</div>
			<div class="con_btn_area" style="margin-left: 1315px;">
				<button class="con_btn" id="nextBtn_2" onclick="movieList_nextBtn_fnc(2);">⫸</button>
			</div>
		</div>
	</div>
</div>
</div>
	<jsp:include page="../Tail.jsp" />

</body>
</html>