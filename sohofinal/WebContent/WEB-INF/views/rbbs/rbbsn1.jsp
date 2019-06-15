<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#_bookBtn {
	width: 120px;
	height: 40px;
	font-size: medium;
}
</style>
</head>
<body>

<div style="margin-top: 12px" align="center">
	<!-- 방이름 -->
	<img alt="" src="image/n101.png" border="0" id="logo" width="300px">
		
</div>

<div align="center" style="padding-bottom: 30px">
	<img alt="" src="image/r1.png" border="0" id="backimg" style="width: 70%;padding-bottom: 100px">
	<img alt="" src="image/rl1.png" border="0" id="backimg" style="width: 70%;padding-bottom: 100px">
	<img alt="" src="image/sp1.png" border="0" id="backimg" style="width: 70%;padding-bottom: 100px">
	
<table style="width: 70%;">
<tr>
	<th>객실정보안내</th>
</tr>
<tr>
	<td>넓이 : 약39.6㎡ (12평형)</td><td>유형 : 커플전용</td>
</tr>
<tr>
	<td>형태 : 원룸형</td><td>특이사항 : 스파, 개별바비큐</td>
</tr>
<tr>
	<td colspan="2">입실시간 : 15 ~ 22시    * 22시 이후의 입실은 사전에 반드시 연락을 주시기 바랍니다.</td>
</tr>
<tr>
	<td>퇴실시간 : 12시</td>
</tr>
<tr>
	<th style="padding-top: 20px">기준인원</th><th style="padding-top: 20px">구비시설</th>
</tr>
<tr>
	<td>기준인원 : 2명 / 최대인원 : 2명</td><td><span>스파, 65인치 OLED TV, DVD, 에어컨, 전기밥솥, 전자레인지, 냉장고, 드라이기, 주방용품, 욕실용품 등</span></td>
</tr>
<tr>
	<td>기준인원 초과시  1인당 성인 20,000 원  아동 20,000 원  유아 20,000원이 추가됩니다.</td>
</tr>
<tr>
	<th style="padding-top: 20px">기간안내</th>
</tr>
<tr>
	<td>- 주중 : 일요일 ~ 목요일</td><td>여름준성수기 2019-07-13(토) ~ 2019-07-25(목)</td>
</tr>
<tr>
	<td style="padding-bottom: 30px">- 금요일 : 요금 별도 표시</td><td style="padding-bottom: 30px">여름성수기 2019-07-26(금) ~ 2019-08-17(토)</td>
</tr>

<tr align="right">
	<td colspan="2">
		<button type="button" id="_bookBtn" class="btn btn-default btn-block" onclick="location.href='Bookingwrite.do'">예약하기</button>
	</td>
</tr>

</table>
</div>
</body>
</html>