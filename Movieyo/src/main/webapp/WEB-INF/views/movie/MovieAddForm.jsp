<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt'%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화추가</title>

<style type="text/css">
.file input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.file label {
	display: inline-block;
	padding: .5em .75em;
	color: #ff81ab;
	background: #201919;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	margin-top: 10px;	
}

.select {
	height: 35px;
	margin-top: 12px;
	border: solid 1px #bfbfbf;
	border-radius: 4px;
	background: #fff;
}

.input, .textarea {
	width: 300px;
	height: 30px;
	position: relative;
	/* 	margin: 0 0 10px 0;  */
	/* 	padding: 10px 50px 10px 21px;  */
	margin-top: 12px;
	border: solid 1px #bfbfbf;
	border-radius: 4px;
	background: #fff;
}

.p {
	height: 30px;
}

.errorM {
	height: 30px;
	/* 	margin-top: 12px; */
}

.errorM {
	display:none;
/* 	height: 30px; */
	color: red;
	/* 	margin-top: 12px; */
}

.btn_css {
	height: 50px;
	background: #201919;
	color: #ff81ab;
	font-size: 20px;
	border-radius: 8px;
	margin: 10px;
}
img{
		width: 250px;
	height: 370px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var checked = $("#genreNo option:checked").text();
		$("#genreName").val(checked);

		$("#genreNo").on({
			keyup : function() {
				var checked = $("#genreNo option:checked").text();
				$("#genreName").val(checked);
			},

			click : function() {
				var checked = $("#genreNo option:checked").text();
				$("#genreName").val(checked);
			}
		});
			
		
		$('#submitBtn').click(function() {
// 			$('#submitBtn').submit(function () {
				var submit = true;		
			// 			영화제목
			var movieTitle = $('#movieTitle').val();
			if (movieTitle == "") {
				$('#movieTitleText').css('display', 'block');
				submit = false;
			} else {
				$('#movieTitleText').css('display', 'none');
			}

			// 		제작연도
			var prdtYear = $('#prdtYear').val().length;

			if (prdtYear == 0) {
				$('#prdtYearText').css('display', 'block');
				submit = false;
			} else if (prdtYear > 4 || prdtYear < 4) {
				$('#prdtYearText').css('display', 'block');
				$('#prdtYearText').html('년도 4자리만 입력해주세요');
				submit = false;
			} else if (prdtYear == 4) {
				$('#prdtYearText').css('display', 'none');
			}

			// 			국가
			var nation = $('#nation').val();

			if (nation == "") {
				$('#nationText').css('display', 'block');
				submit = false;
			} else {
				$('#nationText').css('display', 'none');
			}

			// 			감독
			var director = $('#director').val();

			if (director == "") {
				$('#directorText').css('display', 'block');
				submit = false;
			} else {
				$('#directorText').css('display', 'none');
			}

			// 			상영시간
			var runtime = $('#runtime').val().length;

			if ($('#runtime').val() == "") {
				$('#runtimeText').css('display', 'block');
				$('#runtimeText').html('상영시간을 입력해주세요.');
				submit = false;
			} else if (runtime == 1 || runtime > 3) {
				$('#runtimeText').css('display', 'block');
				$('#runtimeText').html('상영시간 2.3자리만 입력해주세요');
				submit = false;
			} else {
				$('#runtimeText').css('display', 'none');
			}

			// 			상영등급
			var grade = $('#grade').val();

			if (grade == "") {
				$('#gradeText').css('display', 'block');
				submit = false;
			}else {
				$('#gradeText').css('display', 'none');
			}
			return submit;
		});
		//클릭
// 		});
		//서브밋
	$('#file').change(function(){
setImageFromFile(this, '#preview');
});
 
function setImageFromFile(input, expression) {
    if (input.files && input.files[0])
    {
        var reader = new FileReader();
 
            reader.onload = function (e) {
                $(expression).attr('src', e.target.result);
           }
           reader.readAsDataURL(input.files[0]);
     }
}
	
	});

</script>
</head>
<body>
	<jsp:include page="../Header.jsp" />
	<div>
		<div style="width: 895px; margin-left: 450px; border: 1px solid black;">
			<form action="./addCtr.do" method="post" id='submitForm'
				class="addForm" enctype="multipart/form-data">
				<h1>영화등록</h1>
				<div style="">
					<div style="width: 70px; float: left; border: 1px solid black; height: 465px;">
						<p class="p">영화제목</p>
						<p class="p">제작연도</p>
						<p class="p">국가</p>
						<p class="p">감독</p>
						<p class="p">장르</p>
						<p class="p">장르명</p>
						<p class="p">상영시간</p>
						<p class="p">상영등급</p>
						<p class="p">가격</p>
						<p class="p">등록자</p>
					</div>

					<div style="width: 800px; float: left; border: 1px solid black; padding-left: 20px;">
						<img src="" id="preview" style="float: right;"/>
						<div style="display:flex; height: 45px;">
						<input type="text" name='movieTitle' id='movieTitle' class="input"><br>
						<p class="errorM" id="movieTitleText">영화제목을 입력해주세요.</p>
						</div>
						<div style="display:flex; height: 45px">
						<input type="text" name='prdtYear' id='prdtYear' class="input"><br>
						<p class="errorM" id="prdtYearText">년도를 입력해주세요.</p>
						</div>
						<div style="display:flex; height: 45px">
						<input type="text" name='nation' id='nation' class="input"><br>
						<p class="errorM" id="nationText">국가를 입력해주세요.</p>
						</div>
						<div style="display:flex; height: 45px">
						<input type="text" name='director' id='director' class="input"><br>
						<p class="errorM" id="directorText">감독을 입력해주세요.</p>
						</div>
						<div style="display:flex; height: 50px">
						<select name="genreNo" id="genreNo" class="select">
							<option value="1">애니메이션</option>
							<option value="2">드라마</option>
							<option value="3">코미디</option>
							<option value="4">다큐멘터리</option>
							<option value="5">범죄</option>
							<option value="6">성인물(에로)</option>
							<option value="7">SF</option>
							<option value="8">멜로/로맨스</option>
							<option value="9">어드벤처</option>
							<option value="10">공포(호러)</option>
							<option value="11">스릴러</option>
							<option value="12" selected>기타</option>
						</select> <br>
						</div>
						<div style="display:flex; height: 45px">
						<input type="text" name="genreName" id="genreName" value="" class="input"><br>
						</div>
						<div style="display:flex; height: 45px">
						<input type="number" name='runtime' id='runtime' class="input"><br>
						<p class="errorM" id="runtimeText">상영시간을 입력해주세요.</p>
						</div>
						<div style="display:flex; height: 45px"> 
						<input type='text' name='grade' id='grade' class="input"><br>
						<p class="errorM" id="gradeText">상영등급을 입력해주세요.</p>
						</div>
						<div style="display:flex; height: 50px">
						<select name="price" id="price" class="select">
							<option value="5000">5000원</option>
							<option value="6000">6000원</option>
							<option value="7000">7000원</option>
							<option value="8000">8000원</option>
							<option value="9000">9000원</option>
							<option value="10000" selected>10000원</option>
							<option value="11000">11000원</option>
							<option value="12000">12000원</option>
							<option value="13000">13000원</option>
							<option value="14000">14000원</option>
							<option value="15000">15000원</option>
						</select>
						</div>
						<div style="display:flex; height: 50px">
						<input type="text" name="registrant"
							value="${userDto.userName}" readonly="readonly" class="input">
							<div class="file" style="margin-left: 300px;">
							<label for="file">영화사진등록</label>
							<input type='file' name='file' id="file">
						</div>
						</div>
						
					</div>
						
						
						

					<!-- 		 <input type="number" step="1000" name='price' id='price' min="1000" max="10000"><br> -->
					<!-- 			<a id="priceText">가격을 입력해주세요</a> -->
				</div>
					<div style="width: 892px; float: left; border: 1px solid black;">
						영화내용 <br>
						<textarea name="movieStory" style="width: 886px; height: 300px;"
							class="textarea"></textarea>
						<br>
						<div style="float: right;">
				<input type="submit" value='등록' id='submitBtn' class="btn_css">
						<input type="button" value="취소" class="btn_css">
						</div>
					</div>
			</form>
		</div>
	</div>
</body>
</html>