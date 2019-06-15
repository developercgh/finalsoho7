<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>


<%
String category = (String)request.getAttribute("s_category");
if(category == null){  // null값 처리 
   category = "";
}

String keyword = (String)request.getAttribute("s_keyword");
if(keyword == null){
   keyword = "";
}
SimpleDateFormat test = new SimpleDateFormat("yyyy-MM-dd");
%>	


<table class="list_table" style="width: 100%">
   <colgroup>
      <col style="width:70px">
      <col style="width:auto">
      <col style="width:100px">
   </colgroup>
   
   <thead>
      <tr>
         <th>번호</th> <th>아이디</th> <th>예약자</th> <th>객실이름</th>
          <th>입실일</th> <th>퇴실일</th> <th>금액</th> <th>예약현황</th><th>내용보기</th>
      </tr>
   </thead>
   
   <tbody>
      <c:if test="${empty Bookinglist }">
         <tr>
            <td colspan="8">작성된 글이 없습니다</td>
         </tr>
      </c:if>
      
      <c:forEach items="${Bookinglist }" var="Booking" varStatus="bk">
         
         <%--setter  property는 변수 name은 객체명  --%>
         <%-- 
         <jsp:setProperty property="depth" name="ubbs" value="${Booking.depth }"/> 
          --%>
          
         <tr class="_hover_tr">
            <%-- <td>${bk.count }</td> --%>
            <%-- <td style="text-align: left;">
            
               <jsp:getProperty property="arrow" name="ubbs"/>
            
               <a href="Bookingdetail.do?seq=${Booking.seq }" >
                  
                  <c:if test="${Booking.del != 1 }">
                     ${Booking.title }
                  </c:if>
                  
                  <c:if test="${Booking.del == 1 }">
                     <font color="#ff0000">이 글은 작성자에 의해서 삭제되었습니다</font>
                  </c:if>
                  
               </a>
            </td> --%>
            <td>${Booking.seq }</td>
            <td>${Booking.id }</td>
            <td>${Booking.name }</td>
            <td>${Booking.roomname }</td>
            <td>${Booking.sdate}</td>
            <td>${Booking.edate }</td>
            <td><fmt:formatNumber value="${Booking.price }" pattern="#,###원" /></td>   
               <!-- fmt 태그 패턴을 사용해서 금액의 3자리수 마다 콤마를 사용하게 끔 적용   -->
            <td>
            <c:if test="${Booking.checknum eq 0 }">
                예약대기</c:if>
            <c:if test="${Booking.checknum eq 1 }">
                예약완료</c:if>
             <c:if test="${Booking.checknum eq 2 }">
                예약취소</c:if>
            </td>
            <td><a href="Bookingdetail.do?seq=${Booking.seq }">${Booking.name }님 예약내용</a></td>
         </tr>

      </c:forEach>
   </tbody>
</table>   
   

   <!-- 페이징 처리    param value값은 controller에서 날려주어야 한다 
    pageCountPerScreen 한스크린당 몇개씩 보여줄것인지
    recordCountPerPage [1] ~ [10] [다음]   [11] 
    totalRecordCount 현재 총 글의 수-->
    <div id="paging_wrap">
      <jsp:include page="/WEB-INF/views/booking/Bkpaging.jsp" flush="false">
         <jsp:param value="${pageNumber }" name="pageNumber"/>
         <jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>
         <jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
         <jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
      </jsp:include>
   </div>
   
   <script>
   var category = "<%=category %>";
   var keyword = "<%=keyword %>";
   
   $(document).ready(function () {
      
      //  controller에서 다시 받은 값을 다시 넣어준다 
      $("#_s_category").val( category );
      $("#_s_keyword").val( keyword ); 
      // 다른 방법 name안에 name
      //document.frmForm1._bk_keyword.value = keyword;
      
      
   });
   </script>
  
<div class="box_border" style="margin-top: 5px; margin-bottom: 10px;">
   <form action="" name="frmForm1" id="_frmFormSearch" method="post">
   
    <table style="margin-left: auto; margin-right: auto; margin-top: 3px; margin-bottom: 3px;">
         <tr>
            <td id="">검색:</td>
            <td style="padding-left: 5px">
               <select id="_s_category" name="s_category">
                  <option selected="selected">방이름</option>
                  <option >예약자</option>
                  
               </select>
            </td>
            
            <td style="padding-left: 5px">
               <input type="text" id="_bk_keyword" name="bk_keyword">
            </td>
            
            <td style="padding-left: 5px">
                  <button type="button" id="_btnSearch"class="btn btn-default btn-block">검색</button>
            </td>
         </tr>
      </table> 
   
      <%-- controller로 넘겨주기 위한 처리 --%>
      <input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber }">
      <input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage }">
      
      
      
   </form>
</div>



<script type="text/javascript">
   function goPage(pageNumber) {
      
      $("#_pageNumber").val(pageNumber); //setter    
      
      // 페이지가 넘어가게되면 검색부분도 같이 보내줘야한다 
      $("#_frmFormSearch").attr("action", "Bookinglist.do").submit();  
      
   }
   
   
   $("#_btnAdd").click(function () {
      location.href = "Bookingwrite.do";
   });
   
   $("#_btnSearch").click(function () {
      $("#_frmFormSearch").attr("action", "Bookinglist.do").submit();
      
   });    
      
</script>