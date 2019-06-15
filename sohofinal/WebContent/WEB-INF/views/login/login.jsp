<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>      
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>



</head>
<body>
	<div class="modal-dialog">

		<div style="margin-top: 12px" align="center">
					<!-- 홈페이지 제목 -->
						<img alt="" src="image/nlogo_w.png" border="0" id="logo" width="300px">
		
		</div>
		<!-- Modal content-->
		<div class="modal-content">

			<div class="modal-header" style="padding: 35px 50px;">
				<h4>
					<span class="glyphicon glyphicon-lock"></span> 로그인
				</h4>
				<label>다양한 서비스 사용을 위해서 로그인해야 합니다.</label>
			</div>
			<div class="modal-body" style="padding: 40px 50px;">
				<!-- <form role="form" method="post" action="j_spring_security_check"> -->
				<form action="loginAf.do" name="frmForm" id="_frmForm" method="post">
					<div class="form-group">
						<label for="id"> 아이디 :</label> <input type="text" data-msg="아이디를"
							class="form-control" id="_userid" name="id" placeholder="Enter ID"
							required="required">
							<input type="checkbox" id="chk_save_id">아이디 저장
					</div>
					<div class="form-group">
						<label for="pw"> 비밀번호 :</label> <input type="password" data-msg="비밀번호를"
							class="form-control" id="_pwd" name="pwd" 
							placeholder="Enter Password" required="required">
					</div>
					<br>
					<button type="button" class="btn btn-default btn-block" id="_btnLogin">
						로그인</button>
					<button type="button" class="btn btn-default btn-block" id="_btnRegi"
					onclick="location.href='regi.do'" >
						회원가입</button>
					
				</form>		
				
			</div>
			<div class="modal-footer"></div>
		</div>

	</div>

<script type="text/javascript">
$("#_btnLogin").click(function() {
	if($("#_userid").val() == ""){
		alert($("#_userid").attr("data-msg") + " 입력해 주십시오" );
		$("#_userid").focus();
	} else if($("#_pwd").val() == ""){
		alert($("#_pwd").attr("data-msg") + " 입력해 주십시오" );
		$("#_pwd").focus();
	} else{
		$("#_frmForm").attr("target", "_self").submit();
	}	
});
$("#_userid").keypress(function(event) {
	if(event.which == "13"){
		event.preventDefault();
		$("#_pwd").focus();
	}
});

$("#_pwd").keypress(function() {
	if(event.which == "13"){
		event.preventDefault();
		$("#_btnLogin").click();
	}
});

// id저장
var user_id = $.cookie("user_id");
if(user_id != null){
	$("#_userid").val(user_id);
	$("#chk_save_id").attr("checked", "checked");
}

$("#chk_save_id").click(function() {	
	alert("_chk_save_id");
	if($('input:checkbox[id="chk_save_id"]').is(":checked")){
		if($("#_userid").val() == ""){
			$(this).prop("checked", false);
			alert("아이디를 입력해 주십시오");
		}else{
			$.cookie("user_id", $("#_userid").val(), { expires: 7, path: '/' });
		}		
	}else{
		$.removeCookie("user_id", { path:'/' });
	}
});

/* $("#_btnRegi").click(function () {
	location.href = "regi.do";
}); */
//로그인 완료,실패
</script>	
</body>
</html>
