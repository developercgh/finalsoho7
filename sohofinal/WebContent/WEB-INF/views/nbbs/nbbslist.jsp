<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<!-- 검색 키워드와 카테고리 값을 받는곳 -->
<%
String category = (String)request.getAttribute("s_category");
if(category == null) category = "";
	
String keyword = (String)request.getAttribute("s_keyword");
if(keyword == null) keyword = "";
%>

<script>
var category = "<%=category %>";
var keyword = "<%=keyword %>";
$(document).ready(function () {
	$("#_s_category").val( category );
	document.frmForm1.s_keyword.value = keyword;
});
</script>

<style type="text/css">
@import url ("/css/table.css");

.list_table a {
	color: #000000;
}
</style>

<%-- arrow생성 --%>
<jsp:useBean id="ubbs" class="sh.util.BbsArrow"/>

<div class="list_div" align="center">

<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber }">
<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage }">


<table class="list_table" style="width: 1000px">
<colgroup>
	<col width="50"><col width="300"><col width="100"><col width="120"><col width="50">
</colgroup>

<thead>	<!-- 표의 머리부분 -->
<tr>
	<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
</tr>
</thead>

<tbody style="padding-bottom: 10px">

	<c:if test="${empty nbbslist }">
	<tr>
		<td colspan="5">작성된 글이 없습니다</td> 
	</tr>	
	</c:if>
	
<c:forEach items="${nbbslist }" var="nbbs" varStatus="nbbsVs">	
<!-- var은 사용할 변수명, items는 Collection 객체(List, ArrayList), varStatus은 반복상태를 알수 있는 변수 --> 
<tr><!-- 반드시 위에서 써 놓은 거를 맞춰서 작상할것 -->
	<td>
 		${nbbsVs.count } 
		<%-- <c:if test="${pageNumber }">
			${nbbsVs.count }	<!-- 카운트 가져옴 -->
		</c:if> --%>
		<%-- <c:if test="${pageNumber >= 1 }">
			<p>${nbbsVs.count + 10}</p>
		</c:if> --%>
	</td>	
	<td style="text-align: left; padding-left: 10px; padding-top: 0px; padding-bottom: 0px">		<!-- 왼쪽 정렬 -->
		<c:if test="${nbbs.del == 1 }">
			<b id="_bold" style="color: #ff0000">이 게시글은 관리자에 의해 삭제되었습니다</b>
			
			<%-- del==1 한뒤 실제로 db에서 삭제하면 오류나는지? --%>

		</c:if>
		<a href="nbbsdetail.do?seq=${nbbs.seq }"> 		<!-- seq값을 가지고 디테일러 갈거임 -->
			<c:if test="${nbbs.del != 1 }">
				${nbbs.title }	<!-- 화면에 타이틀을 보여줄거임 -->
			</c:if>
		</a>
	</td>
	<td>
		<c:if test="${nbbs.del != 1 }">
			${nbbs.id }			<!-- 아이디 가져옴 -->
		</c:if>
		<c:if test="${nbbs.del == 1 }">
			<p>&nbsp;</p>
		</c:if>
		
	</td>		
	<td>
		<c:if test="${nbbs.del != 1 }">
			${nbbs.wdate }		<!-- 작성일(Written by) -->
		</c:if>
		<c:if test="${nbbs.del == 1 }">
			<p>&nbsp;<p>
		</c:if>
	</td> 
	<td>
		<c:if test="${nbbs.del != 1 }">
			${nbbs.readcount }
		</c:if>
		<c:if test="${nbbs.del == 1 }">
			<p>&nbsp;<p>
		</c:if>
	</td>
</tr>
</c:forEach>
</tbody>
</table>

<!-- paging -->
<div id="paging_wrap">
	<jsp:include page="/WEB-INF/views/nbbs/nbbspaging.jsp" flush="false">
		<jsp:param value="${pageNumber }" name="pageNumber"/>
		<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>
		<jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
		<jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
	</jsp:include>
</div>
	
<div align="right">
<table style="float: center">
<tr>
	<td style="border: none">
		<a>&nbsp;</a>
	</td>
</tr>
<c:if test="${login.id eq 'admin' }">
<tr>
	<td style="border: none; align-content: right">
		<button type="button" id="_btnAdd" value="글쓰기" class="btn btn-default btn-block" onclick="location.href='nbbsupload.do'">글쓰기</button>
	</td>
</tr>
</c:if>
</table>

</div>

<form action="" name="frmForm1" id="_frmFormSearch" method="post">
	<!-- 검색  -->
	<div class="search_page_box" align="left">
		<table style="margin-left: auto; margin-right: auto;
      			margin-top: 3px; margin-bottom: 3px;">
			<tr>
			   <td>검색:</td>
			   <td style="padding-left: 5px">
			      <select id="_s_category" name="s_category">
			         
			         <option value="" selected="selected">선택</option>
			         <option value="title">제목</option>
			         <option value="contents">내용</option>
			         <option value="writer">작성자</option>         
			      </select>
			   </td>
			   <td style="padding-left: 5px">
			      <input type="text" id="_s_keyword" name="s_keyword">
			   </td>
			   <td style="padding-left: 5px">
			      <span class="button blue">
			         <button type="button" id="_btnSearch" class="btn btn-default btn-block">검색</button>
			      </span>
			   </td>
			</tr>
		</table>
	</div>
</form>

</div>

<script type="text/javascript">
function goPage(pageNumber) {
	$("#_pageNumber").val(pageNumber);	// pagenumber 보여줌
	$("#_frmFormSearch").attr("action", "nbbslist.do").submit();
}

$("#_bold").on("click", function () {
	alert("삭제된 게시글입니다.");
});

$("#_searchBtn").on("click", function () {
//	alert("검색 버튼 누름");
	/* if($("#_s_keyword").val() {
		alert("검색어를 한 글자 이상 입력해주세요");
	}
	 */
	$("#_frmFormSearch").attr("action", "nbbslist.do").submit();
});
</script>

