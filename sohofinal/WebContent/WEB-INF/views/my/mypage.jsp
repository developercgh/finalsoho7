<%@page import="sh.model.ShBookingDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
<%

		List<ShBookingDto> blist = (List<ShBookingDto>)(request.getAttribute("booking"));
		ShBookingDto book = new ShBookingDto();
	/* 
	System.out.println("jsp print : " +blist); 
	*/
%>



	<div class="modal-dialog">

		<div style="margin-top: 12px" align="center">
		<!-- 홈페이지 로고 -->
		<img alt="" src="image/nlogo_w.png" border="0" id="logo" width="300px">
		
		</div>
		<!-- Modal content-->
		<div class="modal-content">

			<div class="modal-header" style="padding: 35px 50px;">
				<h4>
					 My Page
				</h4>
				<label>${login.name }님 환영합니다!</label>
			</div>
			<div class="modal-body" style="padding: 40px 50px;">
				<form action="deleteMypage.do" id="_frmForm" name="frmForm" method="post">
					
					<br>
					<div id="_rgetid"></div>
					<div class="form-group">	
						<label> 아이디 : ${login.id }</label>
					</div>
					
					<div class="form-group">
						<label> 이름 : ${login.name }</label>
					</div>
					
					<div class="form-group">	
						<label> 성별 : ${login.gender }</label>
					</div>
					
					<div class="form-group">	
						<label> 생년월일 : ${login.rdate }</label>
					</div>
					
					<div class="form-group">	
						<label> 이메일 : ${login.email }</label>
					</div>
					
					<div class="form-group">	
						<label> 연락처 : ${login.pnum }</label>
					</div>
					
					<div class="form-group">	
						<label> ${login.name }님 예약정보</label>
					</div>
					
					<div>
					<table border="1" class="yetable">
					<col width="95px"><col width="103px"><col width="105px">
   					<col width="55px"><col width="132px"><col width="113px"><col width="107px">
					<tr>
						<th align="center">객실이름</th><th align="center">입실일</th><th align="center">퇴실일</th><th align="center">인원</th>
						<th align="center">금액</th><th align="center">예약 취소</th><th align="center">예약</th>
					</tr>
					</table>
					<table border="1" class="yetable">	
   					<col width="100px"><col width="100px"><col width="100px">
   					<col width="100px"><col width="100px"><col width="100px"><col width="100px">
					<%if(book.getChecknum() != 2){
					if(blist.size() != 0 ){
							for(int i=0;i<blist.size();i++){ %>
					
					<tr>
					<td align="center">
						<%=blist.get(i).getRoomname() %>
					</td>
					<td align="center">
						<%=blist.get(i).getSdate() %>
					</td>
					<td align="center">
						<%=blist.get(i).getEdate() %>
					</td>
					<td align="center">
						<%=blist.get(i).getCountnum() %>
					</td>
					<td align="center">
						<%=blist.get(i).getPrice() %>
					</td>
					<td>
						<button type="button" onclick="location.href='BookCancel.do?seq='+ <%=blist.get(i).getSeq() %>" class="btn btn-default btn-block" >
							취소</button>
					</td>
					<td align="center">
						<input type="text" id="cn" value="<%=blist.get(i).getChecknum() %>" style="width:50px; text-align: center;" readonly="readonly"> 
					</td>
				</tr>
					<%}
							}else{
						%><tr><td>예약내용이 없습니다.</td></tr>
					<%
					}
					}
					%>
					
					
					</table>
					</div>
					<br><br>
					
					
					<button type="button" onclick="location.href='myup.do'"class="btn btn-default btn-block" >
						내 정보수정</button>
					<button type="button" onclick="location.href='pwdup.do'"class="btn btn-default btn-block" >
						비밀번호 변경</button>
					<button type="button" onclick="location.href='toDeletePage.do'"class="btn btn-default btn-block" >
						회원탈퇴</button>
						

				</form>
			</div>
			<div class="modal-footer"></div>
		</div>

	</div>
<script type="text/javascript">
var cn = document.getElementById("cn").value;
if(cn == 0){
	document.getElementById("cn").value = "대기";
}if(cn == 1){
	document.getElementById("cn").value = "완료";
}if(cn == 2){
	document.getElementById("cn").value = "취소";
};

</script>
</body>
</html>