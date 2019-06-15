
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
   href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />

<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- datepicker 한국어로 -->
<script
   src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<title>Insert title here</title>
<style type="text/css">
.bookform_table th, td {
   padding: 10px;
}

#_bookId, #_bookName, #_pnum {
   width: 400px;
   height: 40px;
   font-size: large;
}

#_chkRoom, #_sdate, #_edate, #_price {
   width: 400px;
   height: 40px;
   font-size: large;
}

#_content {
   resize: none;
   font-size: large;
}
/*datepicker에서 사용한 이미지 버튼 style적용*/
img.ui-datepicker-trigger {
   margin-left: 5px;
   vertical-align: middle;
   cursor: pointer;
}
</style>
</head>
<body>

   <div align="center">
      <br>
      <h1>예약하기</h1>
      <br>
      <hr>
      <br>

      <form action="BookingwriteAf.do" method="post">
         <div align="center" style="margin-left: 0px">
            <table class="bookform_table">
               <colgroup>
                  <col width="100px">
                  <col width="400px">
               </colgroup>
               <tr>
                  <th>예약자 ID</th>
                  <td><input type="text" name="id" id="_bookId"
                     class="form-control" value="${login.id }" maxlength="10">
                  </td>
               </tr>
               <tr>
                  <th style="padding-bottom: 10px">예약자 이름</th>
                  <td style="padding-bottom: 10px"><input type="text"
                     name="name" id="_bookName" class="form-control"
                     value="${login.name }"></td>
               </tr>
               <tr>
                  <th style="padding-bottom: 10px">핸드폰 번호</th>
                  <td style="padding-bottom: 10px">
                     <input type="text" name="pnum" id="_pnum" class="form-control" value=" ">
                  </td>
               </tr>
               <tr>
                  <th>방 선택</th>
                  <td>
                     <select name="roomname" id="_chkRoom" class="form-control">
                        <option value="베를린(101)">베를린(101)</option>
                        <option value="런던(102)">런던(102)</option>
                        <option value="파리(103)">파리(103)</option>
                        <option value="로마(201)">로마(201)</option>
                        <option value="프라하(202)">프라하(202)</option>
                        <option value="아테네(203)">아테네(203)</option>
                     </select>
                  </td>
               </tr>
               
               <tr>
                  <th>입실일</th>
                  <td>
                     <input type="text" name="sdate" id="_sdate"   class="form-control num_only" 
                           placeholder="ex)20190101" onchange="calPrice()" readonly="readonly">
                  </td>
               </tr>
               <tr>
                  <th>퇴실일</th>
                  <td>
                     <input type="text" name="edate" id="_edate"   class="form-control num_only" 
                           placeholder="ex)20190102" onchange="calPrice()" readonly="readonly">
                  </td>
               </tr>
               <tr>
                  <th>사용일 수</th>
                  <td>
                     <input type="text" name="bak" id="_bak"   class="form-control num_only" 
                           value="" readonly="readonly">
                  </td>
               </tr>
               
               <tr>
                  <th>추가 인원수</th>
                  <td>
                     <select name="countnum" id="_countnum" class="form-control" onchange="calPrice()">
                        <option value="0">없음</option>
                        <option value="1" >1인추가</option>
                        <option value="2">2인추가</option>
                        <option value="3">3인추가</option>
                        <option value="4">4인추가</option>
                     </select>
                 
                  </td>
               </tr>
               <tr>
                  <th>가격(원)</th>
                  <td>
                     <!-- price1 : write에서 보여주기용 -->
                     <input type="text" name="price1" id="_price1"   class="form-control num_only" 
                           value="" readonly="readonly">
                     <!-- price : hidden으로 적용하여 사용자는 값이 보이지 않지만. 실질적으로 리스트에 보내주는 값  -->      
                     <input type="hidden" name="price" id="_price"   class="form-control num_only" >
                  </td>
               </tr>

               <tr>
                  <th>요구 사항</th>
                  <td>
                     <textarea rows="4" cols="32" name="content" id="_content"
                        class="form-control" placeholder="관리자에게 요청할 요구사항을 입력해주세요">
                     </textarea>
                  </td>
               </tr>

               <tr>
                  <td colspan="2" align="center">
                     <input type="submit" class="ebbsbutton" value="작성 완료">
                  </td>
               </tr>

            </table>


         </div>
      </form>

   </div>
               
               
</body>
<script>




//오늘 날짜를 출력
$("#today").text(new Date().toLocaleDateString());

//datepicker 한국어로 사용하기 위한 언어설정
$.datepicker.setDefaults($.datepicker.regional['ko']); 
                
// 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
// 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

//시작일.
$('#_sdate').datepicker({
   showOn: "both",                     // 달력을 표시할 타이밍 (both: focus or button)
   buttonImage: "image/calendar.png", // 버튼 이미지
   buttonImageOnly : true,             // 버튼 이미지만 표시할지 여부
   buttonText: "날짜선택",             // 버튼의 대체 텍스트
   dateFormat: "yy-mm-dd",             // 날짜의 형식
   changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
   minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
   onClose: function( selectedDate ) {    
// 시작일(fromDate) datepicker가 닫힐때
// 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
$("#_edate").datepicker( "option", "minDate", selectedDate );
   }                
});

//종료일
$('#_edate').datepicker({
   showOn: "both", 
   buttonImage: "image/calendar.png", 
   buttonImageOnly : true,
   buttonText: "날짜선택",
   dateFormat: "yy-mm-dd",
    changeMonth: true,
    //minDate: 0, // 오늘 이전 날짜 선택 불가
   onClose: function( selectedDate ) {
   // 종료일(toDate) datepicker가 닫힐때
   // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
   $("#fromDate").datepicker( "option", "maxDate", selectedDate );
    }                
});
                
                
function calPrice(){   //방 가격

   var sdateA = $("#_sdate").val();   //시작일
   var edateA = $("#_edate").val();   //종료일
   var NumPeople = $("#_countnum").val(); //추가인원

   if (!sdateA) return; //null, undefiend, NaN, empty string(""), 0, false를 다 체크해줌
   if (!edateA) return; //null, undefiend, NaN, empty string(""), 0, false를 다 체크해줌
   
   sdateA = sdateA.split("-");   // - 자르고   예)2019-05-28 -> 2019,05,28
   edateA = edateA.split("-");   // - 자르고   예)2019-05-30 -> 2019,05,30

   var sdateObj = new Date(sdateA[0], sdateA[1], sdateA[2]); // 0 -> 2019  1 ->  05  2 -> 28
   var edateObj = new Date(edateA[0], edateA[1], edateA[2]);


   var dif = edateObj - sdateObj;      //끝날짜 - 시작날짜 = 일수(dif)
    var cDay = 24 * 60 * 60 * 1000;       // 시 * 분 * 초 * 밀리세컨
                               // 86400000ms는 1day를 의미한다.
                               // 1s = 1,000ms
                               // 1m = 60s * 1,000ms = 60,000ms
                               // 1h = 60m * 60,000ms = 3,600,000ms
                               // 1d = 24h * 3,600,000ms = 86,400,000ms

   var bak = parseInt(dif / cDay);      /* ( ( 일수(dif) / 하루의 초(cDay) ) */
   var np = parseInt(NumPeople);      /* np == 추가 인원 */
   var price = (bak * 40000)+(np * 10000 * bak);      /* price = (예약일수 * 40000)+(추가인원 * 10000);     */   
   

   $("#_bak").val(bak);
   
   $("#_price1").val(price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));   
               //예약 금액의 ,를 붙여주기 위한 price1. String형 타입이라서 값을 보내주기는 힘듬
   
   $("#_price").val(price); //값을 리스트로 보내주기용. int형 타입   
   
   
}



</script>


</html>