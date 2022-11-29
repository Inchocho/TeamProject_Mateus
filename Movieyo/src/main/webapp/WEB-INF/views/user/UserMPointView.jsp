<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>회원정보 상세조회</title>



<style type="text/css">
.userMpayContainer{
	text-align: center;
	min-width: 600px;
}
.mpayAttribute{
	color: #F08080;
	font-weight: bold;
	margin-right: 150px;
}
.userMpointDiv{
	display: flex;
    flex-direction: column;
    align-items: center;
}
table, tr, td, th, .userMpointTd {
	border: 2px solid black;
}
table {
	border-collapse: collapse;
}
.userMpointTd{
	width: 150px;
	height: 100px;
	font-weight: bold;
}
#userMpointView{
	font-size: 36px;
	font-weight: bold;
}
#chargeInfo{
	width: 290px;
}
.plusBtnBox{
	display: flex;
	justify-content: space-between;
	margin-top: 10px;
	width: 230px;
	flex-wrap: wrap;
}
.pricePlusBtn{
	width: 100px;
    margin-bottom: 5px;
    height: 40px;
}
</style>
</head>
	
<body>

<jsp:include page="/WEB-INF/views/Header.jsp" />
<jsp:include page="/WEB-INF/views/UserMyPageSideMenu.jsp"></jsp:include>
<div class="userMpayContainer">
	<h1>Mpay</h1>
	<div class="userMpointDiv">
		<h2 class="mpayAttribute">Movieyo Point</h2>
		<table>
			<tr>
				<td class="userMpointTd">보유 Mpoint</td>
				<td class="userMpointTd" id="userMpointView">${userDto.userCash}</td>
			</tr>
		</table>
	</div>
	<div class="userMpointDiv">
		<h2 class="mpayAttribute" style="margin-right: 270px;">충전</h2>
		<!-- 포인트 충전시 afterMpoint 보내기 -->
	<form action="chargeMpointCtr.do" method="get" id="chargeForm">
		<input id="beforeMpoint" type="hidden" value="${userDto.userCash}">
		<input id="chargePoint" type="hidden" value="0">
		<span class="userMpointTd">충전할 금액</span>
		<input id="userInputPoint" type="text" maxlength="10" onkeyup="inputNumberFormat(this);"
		placeholder="충전하실 금액을 입력하세요" style="height: 20px;" value=""> 원
		<input id="afterMpoint" name="afterMpoint" type="hidden">
	</form>
	
		<div class="plusBtnBox">
		
		<input class="pricePlusBtn" type="button" value="+5,000 원">
		<input class="pricePlusBtn" type="button" value="+10,000 원">
		<input class="pricePlusBtn" type="button" value="+30,000 원">
		<input class="pricePlusBtn" type="button" value="+50,000 원">
		</div>
	<table>
			<tr>
				<td class="userMpointTd">충전후 Mpoint</td>
				<td class="userMpointTd" id="afterMpointView"></td>
			</tr>
		</table>
	</div>
		<input id="chargeTryBtn" type="button" value="충전하기">
</div>
<jsp:include page="/WEB-INF/views/PopUp/ChargeMpointPop.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/Tail.jsp" />
</body>
<script type="text/javascript">
	var inputChargePointObj = document.getElementById("userInputPoint");
	var chargePointObj = document.getElementById("chargePoint");
	var afterMpointObj = document.getElementById("afterMpoint");
	var afterMpointViewObj = document.getElementById("afterMpointView");
	
	var beforePoint = document.getElementById("beforeMpoint").value;
	var chargePoint = chargePointObj.value;
	var afterPoint = parseInt(beforePoint);
	
	afterMpointViewObj.innerHTML = beforePoint;
	
	inputChargePointObj.addEventListener("keyup", function(e) {
		chargePointObj.value = inputChargePointObj.value;
		//keyup이벤트로 콤마추가되어 숫자전체가 안잡혀서 콤마 지우는 포멧
		inputOnlyNumberFormat(chargePointObj);
		chargePoint = chargePointObj.value;
		// 충전금액 입력안하고 넘어갈경우 NaN 나와서 걸러줌
		if (isNaN(parseInt(chargePoint))) {
			afterPoint = parseInt(beforePoint);
		}else{
			afterPoint = parseInt(beforePoint) + parseInt(chargePoint);
		}
		
		afterMpointViewObj.innerHTML = afterPoint;
	});

	
	var pricePlusBtnList = document.getElementsByClassName("pricePlusBtn");
	
	pricePlusBtnList[0].addEventListener("click", function(e) {
			if (isNaN(parseInt(chargePoint))) {
				var priceSum = 5000;
			}else{
				var priceSum = parseInt(chargePoint) + 5000;
			}
			chargePoint = priceSum;
			inputChargePointObj.value = parseInt(priceSum);
			inputNumberFormat(inputChargePointObj);
			afterPoint = parseInt(beforePoint) + parseInt(chargePoint);
			afterMpointViewObj.innerHTML = afterPoint;
		});
	pricePlusBtnList[1].addEventListener("click", function(e) {
			if (isNaN(parseInt(chargePoint))) {
				var priceSum = 10000;
			}else{
				var priceSum = parseInt(chargePoint) + 10000;
			}
			chargePoint = priceSum;
			inputChargePointObj.value = parseInt(priceSum);
			inputNumberFormat(inputChargePointObj);
			afterPoint = parseInt(beforePoint) + parseInt(chargePoint);
			afterMpointViewObj.innerHTML = afterPoint;
		});
	pricePlusBtnList[2].addEventListener("click", function(e) {
			if (isNaN(parseInt(chargePoint))) {
				var priceSum = 30000;
			}else{
				var priceSum = parseInt(chargePoint) + 30000;
			}
			chargePoint = priceSum;
			inputChargePointObj.value = parseInt(priceSum);
			inputNumberFormat(inputChargePointObj);
			afterPoint = parseInt(beforePoint) + parseInt(chargePoint);
			afterMpointViewObj.innerHTML = afterPoint;
		});
	pricePlusBtnList[3].addEventListener("click", function(e) {
			if (isNaN(parseInt(chargePoint))) {
				var priceSum = 50000;
			}else{
				var priceSum = parseInt(chargePoint) + 50000;
			}
			chargePoint = priceSum;
			inputChargePointObj.value = parseInt(priceSum);
			inputNumberFormat(inputChargePointObj);
			afterPoint = parseInt(beforePoint) + parseInt(chargePoint);
			afterMpointViewObj.innerHTML = afterPoint;
		});
	
//	충전버튼 눌렀을때 충전값 있으면 모달창
	var chargeTryBtn = document.getElementById("chargeTryBtn");
	var popup_layerObj = document.getElementById("popup_layer");
	
	chargeTryBtn.addEventListener("click", function(e) {
		var chargePriceCheck = document.getElementById("chargePriceCheck");
		chargePointObj.value = inputChargePointObj.value;
		afterMpointObj.value = afterPoint;
		chargePriceCheck.innerHTML = inputChargePointObj.value + " 원";
		if (chargePointObj.value == 0) {
			e.preventDefault();
			alert("충전금액이 입력되지 않았습니다.")
		}else{
			popup_layer.style.visibility = "visible";
		}
	});
//충전 submit
	var chageBtn = document.getElementById("chargeBtn");
	var chargeForm = document.getElementById("chargeForm");
	
	chageBtn.addEventListener("click", function(e) {
		
		chargeForm.submit();
				
	});
	
	
	function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }

    function uncomma(str) {
        str = String(str);
        return str.replace(/[^\d]+/g, '');
    } 
    
    function inputNumberFormat(obj) {
        obj.value = comma(uncomma(obj.value));
    }
    
    function inputOnlyNumberFormat(obj) {
        obj.value = onlynumber(uncomma(obj.value));
    }
    
    function onlynumber(str) {
	    str = String(str);
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1');
	}
</script>
</html>