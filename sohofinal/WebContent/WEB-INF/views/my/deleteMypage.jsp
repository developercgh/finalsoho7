<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
					 회원탈퇴
				</h4>
				<label>정말 탈퇴 하시겠습니까?</label>
			</div>
			<div class="modal-body" style="padding: 40px 50px;">
				<!-- <form role="form" method="post" action="j_spring_security_check"> -->
				<form action="deleteMypage.do" id="_frmForm" name="frmForm" method="post">
					
					<br>
					<div id="_rgetid"></div>
					<div class="form-group">	
						<label for="id"> 아이디 :</label> <input type="text"
							class="form-control" name="_id" id="_id" value="${login.id }" readonly="readonly">
					</div>
					
					<div class="form-group">
						<label for="pw"> 비밀번호 :</label> <input type="password"
							class="form-control" id="_pwd" name="_pwd" 
							placeholder="Enter Password" required="required">
					</div>
					
					<button type="submit" class="btn btn-default btn-block" >
						회원탈퇴</button>
					<button type="button" onclick="location.href='mypage.do'"class="btn btn-default btn-block" id="_btnRegi">
						이전으로</button>
					
				</form>
			</div>
			<div class="modal-footer"></div>
		</div>

	</div>

</body>
</html>