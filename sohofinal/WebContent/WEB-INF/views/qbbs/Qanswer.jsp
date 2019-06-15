<%@page import="sh.model.ShQbbsDto"%>
<%@page import="sh.model.ShMemberDto"%>


<%
Object ologin = session.getAttribute("login");
ShMemberDto mem = (ShMemberDto)ologin;
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Qanswer.jsp</title>
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
<body>

<%
ShQbbsDto qbbs = (ShQbbsDto)request.getAttribute("Qbbs");

%>


<div align="center">

<table class="list_table">
<col width="150"><col width="600">

<tr>
	<th>작성자</th>
	<td><%=qbbs.getId() %></td>
</tr>

<tr>
	<th>제목</th>
	<td><%=qbbs.getTitle() %></td>
</tr>

<tr>
	<th>작성일</th>
	<td><%=qbbs.getWdate() %></td>
</tr>

<tr>
	<th>조회수</th>
	<td><%=qbbs.getReadcount() %></td>
</tr>

<tr>
	<th>정보</th>
	<td><%=qbbs.getRef() %>-<%=qbbs.getStep() %>-<%=qbbs.getDepth() %></td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<%-- <textarea rows="5" cols="60"><%=qbbs.getContent() %></textarea> --%>
		<%=qbbs.getContent() %>
	</td>
</tr>



</table>
</div>

<br><br>


<div align="center">
<h3>댓글</h3>
<form action="QanswerAf.do" method="post" class="replyFrm">
<input type="hidden" name="seq" value="<%=qbbs.getSeq() %>">

<table class="list_table">
<col width="150"><col width="600">

<tr>
	<th>아이디</th>
	<td>
		<input type="text" name="id" readonly="readonly" size="50px" 
			value="<%=mem.getId() %>">
	</td>
</tr>	
<tr>
	<th>제목</th>
	<td>
		<input type="text" name="title" id="_title" size="50px">		
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="5" cols="70" name="content" id="_content"></textarea>		
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" id="submit" value="댓글쓰기">
	</td>
</tr>

</table>

</form>

</div>

</body>

<script type="text/javascript">
$(document).ready(function () {
	$("#submit").click(function () {
		if( $.trim( $(".replyFrm #_title").val() ) == "" || $.trim( $(".replyFrm #_title").val() ) == null ) {
			alert("제목을 입력해주세요");
			return false;
		}
		if( $.trim( $(".replyFrm #_content").val() ) == "" || $.trim( $(".replyFrm #_content").val() ) == null ) {
			alert("내용을 입력해주세요");
			return false;
		} return true;
		
		// 이거 하면 안넘어갑니다 적용하세요
	});
		
/* function nullchk1() {
	if( $.trim( $(".replyFrm #_title").val() ) == "" || $.trim( $(".replyFrm #_title").val() ) == null ) {
		alert("제목을 입력해주세요");
	}
	
	if( $.trim( $(".replyFrm #_content").val() ) == "" || $.trim( $(".replyFrm #_content").val() ) == null ) {
		alert("내용을 입력해주세요");
	}
}

function nullchk2() {
	if( $.trim( $(".replyFrm #_title").val() ) == "" || $.trim( $(".replyFrm #_title").val() ) == null ) {
		alert("제목을 입력해주세요");
	}
}
		
 */

});
</script>
</html>
