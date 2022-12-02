<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<head>
<style type="text/css">
#popup_layer_cartbuy {position:fixed;top:0;left:0;z-index: 10000; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.56); overflow: hidden scroll;} 
/*추가*/
.popup_box .popup_cont .pop_cont_cont ul{
	list-style-position: inside;
	text-align: left;
}
.popup_box .popup_cont .pop_cont_cont{
	margin: 0 120px 0 120px;
}
#popViewUserCash{
	text-decoration: underline;
	
}
.pop_cont_Mpoint a{
	color: #F08080;
}
</style>
</head>

<div id="popup_layer_cartbuy" style="visibility: hidden;">
  <div class="popup_box">
      <!--팝업 컨텐츠 영역-->
      <div class="popup_cont">
          <h2 id="" class="pop_cont_title">구매 하시겠습니까?</h2>
          <div id="" class="pop_cont_cont">
          	<ul>
          		<li><span id="selMovieTitleFir"></span> 외 <span id="selCountMinOne"></span></li>
          		<li><span id="selPrice"></span> 원</li>
            </ul>
          </div>
          <div class="pop_cont_Mpoint">
          	보유Mpoint: <a id="popViewUserCash" href="/Movieyo/user/userMpoint.do">${userDto.userCash}</a> 원
          </div>
      </div>
      <!--팝업 버튼 영역-->
      <div class="popup_btn">
          <a id="buyBtn" href="#" class="">구매</a> 
          <a href="#" onclick="cancelbuyFnc();" class="cancel">닫기</a>
      </div>
  </div>
</div>

<script type="text/javascript">
function cancelbuyFnc() {
	htmlTag.classList.toggle('popup_focus');
	var popup_layer_cartbuy = document.getElementById("popup_layer_cartbuy");
	popup_layer_cartbuy.style.visibility = "hidden";
}
</script>