<%@page import="sh.model.ShNbbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<%
ShNbbsDto nbbs = (ShNbbsDto)request.getAttribute("nbbs1");
%>

<style>
.nbbs_delete {
	padding-bottom: 40px;
}

#_nbbs_title {
	width: 600px;
}
</style>

<form action="nbbsdeleteAf.do" name="frmForm" id="_frmForm" 
	style="padding-bottom: 100px" method="post">

<div class="nbbs_delete" align="center">

<h2 align="center"><strong>다음의 글을 삭제하시겠습니까?</strong></h2>

<table class="delete_table">
<col width="200"><col width="800">
<tr style="height: 40px;">
	<th>ID</th>
	<td>
		<input type="text" name="id" id="_nbbs_id" value="<%=nbbs.getId() %>" readonly="readonly">
	</td>
</tr>
<tr style="height: 40px;">
	<th>제목</th>
	<td>
		<p><%=nbbs.getTitle() %></p>
		<%-- <input type="text" name="title" id="_nbbs_title" value="<%=nbbs.getTitle() %>" readonly="readonly"> --%>
	</td>
</tr>

</table>

<!-- <table>

</table> -->

</div>



<div style="padding-bottom: 300px" align="center">
	<input type="button" id="backBtn" value="뒤로 가기" onclick="location.href='nbbsdetail.do?seq='+<%=nbbs.getSeq() %>">
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit" id="_deleteBtn" value="&nbsp;삭제하기&nbsp;">
</div>

<div style="padding-bottom: 20px">

</div>

</form>

<script>
function backBtn( seq ) {
	location.href = "nbbsdetail.do?seq=" + seq;
}

$(document).ready(function () {
	$("#_deleteBtn").on("click", function () {
		location.href = "nbbsdeleteAf.do";
	});
});
</script>