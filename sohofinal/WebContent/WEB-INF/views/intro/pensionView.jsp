<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
 
.viewback{
	background-image:  url("image/grean1.jpg");
	background-size:100%;
	 font-family: inherit;
	 font-size: 7px!important;
	  
}
</style>
</head>
<body>
<div class="viewback">
	<div align="center">
     <img src="image/penVL.png" width="300px">
   </div>
<div id="slideshow">
   <div>
     <img src="image/mainv1.png">
   </div>
   <div>
     <img src="image/mainv2.png">
   </div>
   <div>
     <img src="image/mainv3.png">
   </div>
   <div>
     <img src="image/mainv4.png">
   </div>
   <div>
     <img src="image/mainv5.png">
   </div>

</div>
	<div align="center">
     <img src="image/introduce1.png" width="300px" style="padding-bottom: 50px;">
   </div>
<div class="introduce" align="center">
SOHO 펜션의 뜻은 Small Office Home Office 라는뜻으로 <br>
기존 펜션에 대한 개념을 벗어나는 공간이라는 깊은 뜻이있습니다.<br><br>

단지 잠만자러 오는곳이 아닌 좋은 추억을 만들수 있는 펜션으로써<br>
손님들과 각종 이벤트를 하려고 노력하고 좋은 추억을 남기도록 하겠습니다.<br><br>

펜션 인근에 비발디파크, 양평 레일바이크, 산음자연휴양림, 팔봉산, 용문산이 있습니다. <br>
자연과 함께하는 소호펜션. <br>
사계절 아름답게 변화하는 전원의 멋진 풍경을 어느 객실에서도 그대로 느끼고 지저귀는 산새소리와<br>
 감미로운 계곡물소리를 들으며 산림욕을 즐기고 밤하늘의 빛나는 별을 보실수 있는 소호펜션으로 <br>
 연인, 친구, 가족과 함께하는 여행 어떠신지요?<br><br>

저희 소호펜션은 고객 한분한분을 소중히 여기며<br>
어느곳에서도 느끼지 못할 특별함으로 여러분을 초대합니다.<br> 
<br><br><br><br><br>.<br>



</div>
</div>
<script type="text/javascript">
$("#slideshow > div:gt(0)").hide();

setInterval(function() { 
  $('#slideshow > div:first')
    .fadeOut(1000)
    .next()
    .fadeIn(1000)
    .end()
    .appendTo('#slideshow');
},  3000);
</script>


</body>
</html>