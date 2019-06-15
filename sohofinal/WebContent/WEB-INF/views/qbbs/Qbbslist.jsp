<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>

<%

String category = (String)request.getAttribute("q_category");
if(category == null){  // null값 처리 
	category = "";
}

String keyword = (String)request.getAttribute("q_keyword");
if(keyword == null){
	keyword = "";
}

%>

<style type="text/css">
@import url ("/css/table.css");

.list_table a {
	color: #000000;
}
</style>


<!-- <style type="text/css">
body, div {
   float: center;
}



.main_table {
   /* text-align: center; */
   border-collapse: collapse;
   position: relative;
   width: 600px;
   
   position: relative;
   z-index: 0;
   visibility: inherit;
   
}

.main_table th {
   border-top: 2px solid black;
   border-left: none;
   border-bottom: 1px solid black;
   border-right: none;
   text-align: center;
}

.main_table td {
   border-top: 1px solid black;
   border-left: none;
   border-bottom: 1px solid black;
   border-right: none;
   text-align: center;
}
</style> -->



<%-- arrow생성 --%>
<jsp:useBean id="ubbs" class="sh.util.BbsArrow"/>


<table class="list_table">
	<colgroup>
		<col style="width:70px">
		<col style="width:auto">
		<col style="width:100px">
		<col style="width:100px">
		<col style="width:70px">
	</colgroup>
	
	<thead>
		<tr>
			<th>순서</th> <th>제목</th> <th>작성자</th> <th>작성일</th> <th>조회수</th>
		</tr>
	</thead>
	
	<tbody>
		<c:if test="${empty Qbbslist }">
		<tr>
			<td colspan="3">작성된 글이 없습니다</td>
		</tr>
		</c:if>
			
			
			
		<c:forEach items="${Qbbslist}" var="ShQbbs" varStatus="vs">
		
		<%--setter  property는 변수 name은 객체명  --%>
		<jsp:setProperty property="depth" name="ubbs" value="${ShQbbs.depth }"/> 
		
		<tr class="_hover_tr">
			<td>${vs.count }</td>
			<td style="text-align: left;">
			
				<jsp:getProperty property="arrow" name="ubbs"/>
				
				<a href="Qbbsdetail.do?seq=${ShQbbs.seq }" >
					
					<c:if test="${ShQbbs.del != 1 }">
					${ShQbbs.title }
					</c:if>
					
					<c:if test="${ShQbbs.del == 1 }">
					<font color="#ff0000">이 글은 작성자에 의해서 삭제되었습니다</font>
					</c:if>
					
				</a>
				
			</td>
			<td>${ShQbbs.id }</td>
			<td>${ShQbbs.wdate }</td>
			<td>${ShQbbs.readcount }</td>
		</tr>
			
		</c:forEach>
		
	</tbody>
</table>


<!-- 페이징 처리    param value값은 controller에서 날려주어야 한다 
 pageCountPerScreen 한스크린당 몇개씩 보여줄것인지
 recordCountPerPage [1] ~ [10] [다음]   [11] 
 totalRecordCount 현재 총 글의 수-->
 <div id="paging_wrap">
	<jsp:include page="/WEB-INF/views/qbbs/Qpaging.jsp" flush="false">
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
	$("#_q_category").val( category );
	$("#_q_keyword").val( keyword ); 
	// 다른 방법 name안에 name
	//document.frmForm1._q_keyword.value = keyword;
	
	
	
	
});
</script>



<div class="box_border" style="margin-top: 5px; margin-bottom: 10px;">
	<form action="" name="frmForm1" id="_frmFormSearch" method="post">
	
		<table style="margin-left: auto; margin-right: auto; margin-top: 3px; margin-bottom: 3px;">
			<tr>
				<td id="">검색:</td>
				<td style="padding-left: 5px">
					<select id="_q_category" name="q_category">
						<option value="" >선택</option>
						<option value="title" selected="selected">제목</option>
						<option value="contents">내용</option>
						<option value="writer">작성자</option>
					</select>
				</td>
				
				<td style="padding-left: 5px">
					<input type="text" id="_q_keyword" name="q_keyword">
				</td>
				
				<td style="padding-left: 5px">
					<span class="button blue">
						<button type="button" id="_btnSearch">검색</button>
					</span>
				</td>
			</tr>
		</table>
	
		<%-- controller로 넘겨주기 위한 처리 --%>
		<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber }">
		<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage }">
		
		<div id="buttons_wrap" align="right" style="">
			<span class="button blue">
				<button type="button" id="_btnAdd">글쓰기</button>
			</span>
		</div>
		
	</form>
</div>


<!-- <div id="buttons_wrap" align="right" style="">
	<span class="button blue">
		<button type="button" id="_btnAdd">글쓰기</button>
	</span>
</div> -->


<script type="text/javascript">

function goPage(pageNumber) {
	
	$("#_pageNumber").val(pageNumber); //setter    
	
	// 페이지가 넘어가게되면 검색부분도 같이 보내줘야한다 
	$("#_frmFormSearch").attr("action", "Qbbslist.do").submit();  
	
}


$("#_btnAdd").click(function () {
	location.href = "Qbbswrite.do";
});

$("#_btnSearch").click(function () {
	alert("click!");
	$("#_frmFormSearch").attr("action", "Qbbslist.do").submit();
	
}); 

/* $("#_btnSearch").on("click", function () {
	alert("click!");
});
 */
 
 
/*
$(document).on("#_btnSearch", "click", function () {
	alert("click!");
}); */
</script>

