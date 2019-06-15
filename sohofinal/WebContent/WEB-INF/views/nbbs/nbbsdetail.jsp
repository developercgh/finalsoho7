<%@page import="sh.model.ShNbbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css 할때 임포트 해줘야 되요 !!!! -->
<style type="text/css">
@import url("/css/table.css");

.list_table {
	width: 800px;
}

.list_table th {

}

.list_table td {
	text-align: left;
	padding-left: 20px;
}

</style>

</head>

<!-- <style>
table {
	border-collapse: collapse;
	position: relative;
}

#_backBtn {
	font-size: medium;
}

.detail_table {
	align: center;
	width: 800px;
}

.detail_table th {
	height: 30px;
	border-top: 1px solid gray;
	border-left: none;
	border-bottom: 1px solid gray;
	border-right: none;
	text-align: center;
	font-size: medium;
}

.detail_table td {
	height: 40px;
	padding-top: 12px;
	padding-bottom: 12px;
	border-top: 1px solid gray;
	border-left: none;
	border-bottom: 1px solid gray;
	border-right: none;
	text-align: left;
	font-size: medium;
}

.detail_table b {
	font-size: x-large;
	padding-left: 78px;
}

#_content {
	height: 100px;
	padding-top: 20px;
	padding-left: 80px; 
	padding-right: 80px;
	border-bottom: 2px solid gray;
	font-size: medium;
}

#_content span {
	white-space: pre-line;
}

</style> -->
<!-- <body> -->

<%
ShNbbsDto nbbs = (ShNbbsDto)request.getAttribute("getNbbs");
%>

<form action="" method="post">

<div class="detail_div" align="center">

<table class="list_table">
<colgroup>
	<col width="100"><col width="600">
</colgroup>
	
<tr>
	<th>제목</th>
	<td colspan="2" id="_title">
		<b><%=nbbs.getTitle() %></b>
	</td>
</tr>
<tr>
	<th>작성자</th>
	<td><%=nbbs.getId() %></td>
</tr>
<tr>
	<th>작성일</th>
	<td><%=nbbs.getWdate() %></td>
</tr>
<tr>
	<th>조회수</th>
	<td><%=nbbs.getReadcount() %></td>
</tr>
<tr>
	<!-- <td style="border-bottom: 2px solid gray">내용</th> -->
	<th>내용</th>
	<td colspan="2" id="_content">
		<span><%=nbbs.getContent() %></span>
	</td>
</tr>

</table>

</div>

<div style="padding-bottom: 20px">

</div>

<div class="detail_bottom_div" align="center" style="padding-bottom: 20px">
<table class="detail_bottom" style="width: 1000px">
<tbody>
<colgroup>
	<col width="100"><col width="100"><col width="100"><col width="80"><col width="100">
</colgroup>
<tr>
	<td></td>
	<td align="right" >
		<c:if test="${login.id eq 'admin' }">
			<button type="button" name="Btn" id="_updateBtn" value="update" class="ebbsbutton"
					onclick="updateBtn('<%=nbbs.getSeq() %>')">수정</button>
		</c:if>
	</td>
	
	<td align="right">
		<button type="button" name="backBtn" id="_backBtn" value="back"
				class="ebbsbutton" onclick="location.href='nbbslist.do'">목록 보기</button>
	</td>
	
	<td align="right" >
		<c:if test="${login.id eq 'admin' }">
			<button type="button" name="deleteBtn" id="_deleteBtn" value="delete" 
					class="ebbsbutton">삭제</button>
		</c:if>
	</td>
	<td></td>
</tr>
</tbody>
</table>
</div>

</form>

<!-- </body> -->

<script type="text/javascript">
function updateBtn( seq ) {
	location.href = "nbbsupdate.do?seq=" + seq;
}

$("#_deleteBtn").on("click", function () {
	var result = confirm("정말로 삭제하시겠습니까?");
	
	if(result) {
		location.href = 'nbbsdelete.do?seq=' + <%=nbbs.getSeq() %>;
	}
});
</script>

</html>