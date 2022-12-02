<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<head>
<style type="text/css">
#popup_layer {position:fixed;top:0;left:0;z-index: 10000; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.56); overflow: hidden scroll;} 
/*팝업 박스*/
.popup_box{position: relative;top:50%;left:50%; width:550px;transform:translate(-50%, -50%);z-index:1002;box-sizing:border-box;background:#252526;}
/*컨텐츠 영역*/
.popup_box .popup_cont {padding:50px;line-height:1.4rem;font-size:14px;}
.popup_box .popup_cont h2 {padding:15px 0;color:#ff81ab;margin:0; text-align: center;}
.popup_box .popup_cont p{ border: 1px solid #ff81ab; color:#ff81ab; text-align: center; font-weight: bold;}
/*버튼영역*/
.popup_box .popup_btn {display:table;width:100%;height:70px;}
.popup_box .popup_btn a {display: table-cell; color:#fff; font-size:17px;text-align:center;vertical-align:middle;text-decoration:none; background: #02ace0;}
.popup_box .popup_btn a.cancel{background-color: gray;}
/*오픈시 doc*/
.popup_focus{
    overflow: hidden !important;
    margin-right: 17px;
}
</style>
</head>

<div id="popup_layer" style="visibility:hidden; ">
  <div class="popup_box">
      <!--팝업 컨텐츠 영역-->
      <div class="popup_cont">
          <h2>충전 하시겠습니까?</h2>
          <p id="chargePriceCheck"></p>
      </div>
      <!--팝업 버튼 영역-->
      <div class="popup_btn">
          <a id="chargeBtn" href="#" class="chargeBtn">충전</a> 
          <a href="#" onclick="cancelFnc();" class="cancel">취소</a>
      </div>
  </div>
</div>
<script type="text/javascript">
function cancelFnc() {
	htmlTag.classList.toggle('popup_focus');
	var popup_layer = document.getElementById("popup_layer");
	popup_layer.style.visibility = "hidden";
}
</script>