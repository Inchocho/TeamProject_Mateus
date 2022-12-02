<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<head>
<style type="text/css">
#popup_layer_incartmovie {position:fixed;top:0;left:0;z-index: 10000; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.56); overflow: hidden scroll;} 
</style>
</head>

<div id="popup_layer_incartmovie" style="visibility: hidden;">
  <div class="popup_box">
      <!--팝업 컨텐츠 영역-->
      <div class="popup_cont">
          <h2 id="" class="pop_cont_title">장바구니에 담으시겠습니까?</h2>
          <div id="" class="pop_cont_cont">
          	<ul>
          		<li>${movieDto.movieTitle}</li>
          		<li>${movieDto.price} 원</li>
            </ul>
          </div>
      </div>
      <!--팝업 버튼 영역-->
      <div class="popup_btn">
          <a id="inCartBtn" href="#" onclick="inCartSubmitFnc();" class="">담기</a> 
          <a href="#" onclick="cancelbuyFnc();" class="cancel">닫기</a>
      </div>
  </div>
</div>

<script type="text/javascript">
function cancelbuyFnc() {
	htmlTag.classList.toggle('popup_focus');
	var popup_layer_incartmovie = document.getElementById("popup_layer_incartmovie");
	popup_layer_incartmovie.style.visibility = "hidden";
}
</script>