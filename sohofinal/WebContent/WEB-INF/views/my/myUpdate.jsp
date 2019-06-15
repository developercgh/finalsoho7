<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 
<form id="myForm" action="updateMypage.do" method="post">
					<p>
						<label>ID</label> 
						<input class="w3-input" type="text" id="id" name="id" readonly value="${ login.id }"> 
					</p>
					<p>
						<label>Email</label> 
						<input class="w3-input" type="text" id="email" name="email" value="${ login.email }" required> 
					</p>
					<p>
						<label>Phone number</label> 
						<input class="w3-input" type="text" id="pnum" name="pnum" value="${ login.pnum }" required> 
					</p>
					<p class="w3-center">
						<button type="submit" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">회원정보 변경</button>
					</p>
				</form>
 -->
<title>Insert title here</title>
</head>
<body>


	<div class="modal-dialog">

		<div style="margin-top: 12px" align="center">
		<!-- 홈페이지 로고 -->
		<img alt="" src="image/nlogo_w.png" border="0" id="logo" width="300px">
		
		</div>
		<!-- Modal content-->
		<div class="modal-content">

			<div class="modal-header" style="padding: 35px 50px;">
				<h4>
					정보 수정
				</h4>
				<label>회원정보를 수정하시겠습니까?</label>
			</div>
			<div class="modal-body" style="padding: 40px 50px;">
				<form id="_frmForm" name="frmForm" action="updateMypage.do" method="post">
					
					<br>
					<div id="_rgetid"></div>
					<div class="form-group">	
						<label> ID :</label> 
						<input type="text" class="form-control" id="id" name="id" readonly value="${ login.id }" required>
					</div>
					
					<div class="form-group">
						<label> Email :</label>
						 <input type="text" class="form-control" id="email" name="email" value="${ login.email }" required>
					</div>
					
					<div class="form-group">
						<label> Phone number :</label>
						 <input type="text" class="form-control" id="pnum" name="pnum" value="${ login.pnum }" required>
					</div>
					<button type="submit" class="btn btn-default btn-block" >
						회원정보 수정</button>
					<button type="button" onclick="location.href='mypage.do'"class="btn btn-default btn-block" id="_btnRegi">
						이전으로</button>
					
				</form>
			</div>
			<div class="modal-footer"></div>
		</div>

	</div>
</body>
</html>