<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>regi</title>

<style type="text/css">
</style>

<!-- datepicker -->
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

</head>
<body>
   <div class="modal-dialog">

      <div style="margin-top: 12px" align="center">
         <!-- 홈페이지 로고 -->
         <img alt="" src="image/nlogo_w.png" border="0" id="logo"
            width="300px">

      </div>
      <!-- Modal content-->
      <div class="modal-content">

         <div class="modal-header" style="padding: 35px 50px;">
            <h4>회원가입</h4>
            <label>소호 회원이 아니신가요? 회원가입 해주세요!</label>
         </div>
         <div class="modal-body" style="padding: 40px 50px;">
            <!-- <form role="form" method="post" action="j_spring_security_check"> -->

            <form action="regiAf.do" id="_frmForm" name="frmForm" method="post">
                <input type="text" name="sid" id="_id" class="form-control"
                  placeholder="사용할 아이디를 입력하세요" required="required"> <span><font
                  size="2">&nbsp;영문(소문자) 또는 숫자 포함 10자 이하로만 입력해주세요</font></span><br> <br>
               <input type="button" class="btn btn-default btn-block"
                  id="_btnGetId" title="id체크" value="ID 체크"> <br> 
               <div id="_rgetid"></div>
               <div class="form-group">
                  <label for="id"> 아이디 :</label> <input type="text" data-msg="아이디를"
                     class="form-control" name="id" id="_userid" readonly="readonly">
               </div>
               <div class="form-group">
                  <label for="pw"> 비밀번호 :</label> <input type="password"
                     data-msg="비밀번호를" class="form-control" id="_pwd" name="pwd"
                     placeholder="영문,숫자 포함 4~10자 이하로만 입력 가능합니다" required="required">
               </div>
               <div class="form-group">
                  <label for="name"> 이름 :</label> <input type="text" data-msg="이름을"
                     class="form-control" id="_name" name="name"
                     placeholder="Enter Name" required="required">
               </div>

               <div class="form-group">
                  <label for="gender"> 성별 :</label> <input type="radio"
                     name="gender" id="_gender" size="50" value="남자"
                     required="required" data-msg="성별을" checked="checked">남자&nbsp;&nbsp;
                  <input type="radio" name="gender" id="_gender" size="50"
                     value="여자" required="required" data-msg="성별을">여자
               </div>

               <div class="form-group">
                  <label> 생년월일 :</label> <input type="date" data-msg="생년월일을"
                     class="form-control" id="_rdate" name="rdate"
                     placeholder="ex) 20190101" required="required">
               </div>
               <div class="form-group">
                  <label> 이메일 :</label> <input type="email" data-msg=""
                     class="form-control" id="_email" name="email"
                     placeholder="ex) abc123@naver.com" required="required">


               </div>
               <div class="form-group">
                  <label> 연락처 :</label> <input type="tel" data-msg="연락처를"
                     class="form-control" id="_pnum" name="pnum"
                     pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}"
                     placeholder="'-'을 포함하여 입력해 주세요" required="required">
               </div>
               <br> <input type="submit" ID="_btnRegi" class="btn btn-default btn-block"
                     value="회원가입">   <!-- 현재 회원가입 성공 메시지 안나옴. 스크립트 손볼 필요-->
            </form>

         </div>
         <div class="modal-footer"></div>
      </div>

   </div>

   <script type="text/javascript">

function valcId() {
   
   // id 형식 체크(알파벳, 숫자만 허용)
    var regId = /^[a-z0-9_]{3,15}$/;
   if( regId.test($("#_id").val()) == false ) {
      alert("잘못된 ID 형식입니다");
      return false;
   } 
   
   // id 공백 체크
   var regIdSpace = /\s/g;
   if( regIdSpace.test($("#_id").val().trim()) == true ) {
      alert("ID에 공백이 있습니다");
      return false;
   }
   return true;
}

function valcPwd() {
   
   // 패스워드 형식 체크(알파벳, 숫자만 허용)
   var regPwd = /^[a-z0-9_]{3,15}$/;
   if( regPwd.test($("#_pwd").val()) == false ) {
      alert("잘못된 패스워드 형식입니다");
      return false;
   }
   
   // 패스워드 공백 체크
   var regPwdSpace = /\s/g;
   if( regPwdSpace.test($("#_pwd").val().trim()) == true ) {
      alert("패스워드에 공백이 있습니다");
      return false;
   }
   return true;
   
}
/* 
function valcEmail() {

   // 이메일 형식 체크
   // '@'앞자리 : 
   // '@'뒷자리 :
   var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
   if( regEmail.test($("#_email").val().trim()) == false ) {
      alert("잘못된 이메일 형식입니다");
      return false;
   }
   return true;
} */

function valcPhone() {

   // 전화번호 형식 체크
   // 첫번째 : 01(0,1,6,7,8,9)
   // 두번째 : 0~9까지 세자리 또는 네자리
   // 세번째 : 0~9까지 네자리
   var regPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
   if( regPhone.test($("#_pnum").val()) == false ) {
      alert("잘못된 전화번호 형식입니다");
      return false;
   }
   return true;
}

   /* $("#email").val( $("#email1").val() + "@" + $("#email2").val() );
   $("#phone").val( $("#phone1").val() + "-" + $("#phone2").val() + "-" + $("#phone3").val() ); */
   

$("#_btnRegi").click(function() {
   /*
    if($("#_userid").val() == ""){
      alert("아이디를 입력해 주십시오" );
      $("#_userid").focus();
   }
   else if($("#_pwd").val() == ""){
      alert($("#_pwd").attr("data-msg") + " 입력해 주십시오" );
      $("#_pwd").focus();
   }
   else if($("#_pwd").val().length < 4) {
      alert("비밀번호는 4자 이상으로 설정해야 합니다");
      $("#_pwd").val("").focus();
   }
   else if($("#_name").val() == ""){
      alert($("#_name").attr("data-msg") + " 입력해 주십시오" );
      $("#_name").focus();
   }
    else if($("#_gender").val() == ""){
      alert($("#_gender").attr("data-msg") + " 입력해 주십시오" );
      $("#_gender").focus();
    }
   else if($("#_rdate").val() == ""){
      alert($("#_rdate").attr("data-msg") + " 입력해 주십시오" );
      $("#_rdate").focus();
   } */
/*    else if($("#_email").val() == "") {
       alert("이메일을 입력해야 합니다.");
       return false;
   }
   else if($("#_pnum").val() == "") {
         alert("연락처를 입력해야 합니다.");
       return false;
   }  */
   /*    
   else if($("#_email").val() == ""){
      alert($("#_email").attr("data-msg") + " 입력해 주십시오" );
      $("#_email").focus();
   }
   else if($("#_pnum").val() == ""){
      alert($("#_pnum").attr("data-msg") + " 입력해 주십시오" );
      $("#_pnum").focus();
   } 
   */
    if(!($("#_userid").val() == "" || $("#_pwd").val().length < 4 || $("#_name").val() == ""
      || $("#_gender").val() == "" || "#_rdate").val() == "" || $("#_email").val() == "" 
         || $("#_email").val() == "" || $("#_pnum").val() == ""){
 
      alert("회원가입이 완료되었습니다. 로그인 해주십시오" );
    }
});

var regId = /^[a-z0-9_]{3,15}$/;
regId = false;

var wid = "";

$(document).ready(function () {
   $("#_id").on("focus", function () {
      $("#_btnRegi").attr("disabled", true);
   });
   
   
$("#_btnGetId").click(function () {

   
   if( $("#_id").val().trim() != "" ) {
      if(valcId() == true) {
         $.ajax({
            type:"post",
            url:"getId.do",      
            data:{ id:$("#_id").val().trim() },
            async:true,
            success:function(msg){
               if(msg == 'YES') {
                  alert("사용중인 아이디입니다");
                  /* $("#_id").val(""); */
                  wid = "";
                  $("#_btnRegi").attr("disabled", true);   // 회원가입버튼 비활성화시킴(true일때)
                  idck = false;
               } else if(msg == 'NO') {
                  alert("사용할 수 있는 아이디입니다");
                  /* wid = $("#_id").val().trim(); */
                  wid = $("#_userid").val( $("#_id").val() );
                  $("#_btnRegi").attr("disabled", false);
                  idck = true;
               }
               /* if(msg == 'YES'){
                  if(regId == true){
                  $("#_rgetid").html("사용할 수 없는 아이디입니다");   
                  $("#_rgetid").css("color", "#ff0000");
                  $("#_userid").val("");
                  }
               } else {
                  if(regId == false){
                  $("#_rgetid").html("이 아이디는 사용할 수 있습니다");
                  $("#_rgetid").css("color", "#0000ff");
                  $("#_userid").val( $("#_id").val() );
                  }
               } */      
            },
            error:function(){
               alert("error");   
            }
         });
      }
   } else {
      alert("ID를 입력해야 합니다");
      $("#_id").focus();
   }
});

   if(valcEmail() == false || valcPhone() == false) {
      $("#_btnRegi").attr("disabled", false);
      return false;
   }

});

/* 
$(function() {
      $("#_rdate").datepicker(
            {
               dateFormat : "yymmdd",
               prevText : '이전 달',
               nextText : '다음 달',
               dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
               monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월",
                     "7월", "8월", "9월", "10월", "11월", "12월" ],
               monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월",
                     "7월", "8월", "9월", "10월", "11월", "12월" ],
               showMonthAfterYear : true,
               changeMonth : true,
               changeYear : true,
               yearRange : "-100:+0",
               maxDate : 0
            });
   }); */

</script>

</body>
</html>