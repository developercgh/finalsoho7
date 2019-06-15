<%@page import="sh.model.ShMemberDto"%>
<%@page import="sh.model.ShNbbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
Object ologin = session.getAttribute("login");
ShMemberDto mem = (ShMemberDto)ologin;

String getSeq = request.getParameter("seq");
int seq = Integer.parseInt(getSeq.trim());

ShNbbsDto nbbsdto = (ShNbbsDto)request.getAttribute("nbbs");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
body, div {
	float: center;
}

</style>
</head>
<body>
<form action="nbbsupdateAf.do" name="frmForm" id="_frmForm"  method="post">

<div class="nbbs_update" align="center">

<h2 align="center"><strong>글 수정</strong></h2>

<input type="hidden" name="seq" id="_seq" value="<%=nbbsdto.getSeq() %>">

<table class="list_table">
<col width="200"><col width="800">
<tr style="height: 40px;">
	<th>ID</th>
	<td>
		<input type="text" name="id" id="_nbbs_id" value="<%=nbbsdto.getId() %>" readonly="readonly" style="border: 0px;">
	</td>
</tr>
<tr style="height: 40px;">
	<th>제목</th>
	<td>
		<input type="text" name="title" id="_nbbs_title" value="<%=nbbsdto.getTitle() %>"readonly="readonly" style="border: 0px;">
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="10" cols="75" name="content" id="_nbbs_content" style="background-color:#fcfff2;"><%=nbbsdto.getContent() %></textarea>
	</td>
</tr>
<tr>
	<td></td><td align="center" style="border: 0;"><input type="submit" id="_updateBtn" value="올리기" class="ebbsbutton" ></td>
</tr>
</table>

<table>

</table>

</div>

<div style="padding-bottom: 20px">

</div>



</form>

<!-- 
<script type="text/javascript">
$("#_updateBtn").on("click", function () {
	$("#_frmForm").submit();
}); 
</script>-->
</body>
</html>
