<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		if(${msg ne null}){
			alert('${msg}');
		};
		
		if($("#pwForm").submit(function(){
			 if($("#oldPwd").val() !== $("#opwd").val()){
				alert("비밀번호가 일치하지 않습니다.")
				$("#oldPwd").val("").focus();
				return false;
			}
			else if($("#pwd").val() !== $("#pwd2").val()){
				alert("새 비밀번호가 동일하지 않습니다.");
				$("#pwd").val("").focus();
				$("#pwd2").val("");
				return false;
 			}else if ($("#pwd").val().length < 4) {
				alert("비밀번호는 4자 이상으로 설정해야 합니다.");
				$("#pwd").val("").focus();
				return false;
			}else if($.trim($("#pwd").val()) !== $("#pwd").val()){
				alert("공백은 입력이 불가능합니다.");
				return false;
			}
		}));
	})
	
</script>

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
					 비밀번호 변경
				</h4>
				<label>비밀번호를 변경하시겠습니까?</label>
			</div>
			
			<div class="modal-body" style="padding: 40px 50px;">
				<form id="pwForm" name="pwForm" action="updatePwd.do" method="post">
					<input type="hidden" value="${login.pwd}" id="opwd" name="opwd">
					<input type="hidden" name="id" value="${ login.id }">
					<br>
					<div id="_rgetid"></div>
					<div class="form-group">	
						<label> 비밀번호 :</label> 
						<input type="password" class="form-control" id="oldPwd" name="oldPwd" type="password" required>
					</div> 
					
					<div class="form-group">
						<label> 새 비밀번호 :</label>
						 <input type="password" class="form-control" id="pwd" name="pwd" type="password" required>
					</div>
					
					<div class="form-group">
						<label> 새 비밀번호 확인 :</label>
						 <input type="password" class="form-control" type="password" id="pwd2" type="password" required>
					</div>
					<button type="submit" class="btn btn-default btn-block" >
						비밀번호 변경</button>
					<button type="button" onclick="location.href='mypage.do'"class="btn btn-default btn-block" id="_btnRegi">
						이전으로</button>
					
				</form>
			</div>
			<div class="modal-footer"></div>
		</div>

	</div>
</body>
</html>