<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

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

<!-- <style type="text/css">
body, div {
	float: center;
}

#_frmForm {
	margin-bottom: 100px;
}

#_nbbs_id, #_nbbs_title, #_nbbs_content {
	width: 95%; 
	background-color: transparent; 
	border: none;
}

#_nbbs_content {
	resize: none;
}

.write_table {
	/* text-align: center; */
	border-collapse: collapse;
	position: relative;
	width: 800px;
	height: 300px;
	
}

.write_table th {
	border-top: 1px solid gray;
	border-left: 1px solid gray;
	border-bottom: 1px solid gray;
	border-right: 1px solid gray;
	text-align: center;
}

.write_table td {
	border-top: 1px solid gray;
	border-left: 1px solid gray;
	border-bottom: 1px solid gray;
	border-right: 1px solid gray;
	text-align: center;
}
</style> -->

<script>

</script>

<form action="nbbsuploadAf.do" name="frmForm" id="_frmForm"  method="post">

<div class="nbbs_write" align="center">

<table class="list_table">
<col width="200"><col width="800">
<tr style="height: 40px;">
	<th>ID</th>
	<td>
		<input type="text" name="id" id="_nbbs_id" placeholder="admin">
	</td>
</tr>
<tr style="height: 40px;">
	<th>제목</th>
	<td>
		<input type="text" name="title" id="_nbbs_title">
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="10" cols="75" name="content" id="_nbbs_content"></textarea>
	</td>
</tr>

</table>

<table>

</table>

</div>

<div style="padding-bottom: 20px">

</div>

<div style="padding-bottom: 20px" align="center">
	<input type="button" id="_uploadBtn" value="올리기" class="ebbsbutton">
</div>

</form>

<script type="text/javascript">
$("#_uploadBtn").on("click", function () {
	$("#_frmForm").submit();
});

//관리자가 아닌 사람이 제로 여기에 접근하면 로그인한 아이디를 불러와 강 사전 차단해줌
var id = <%=request.getAttribute("login") %>;	
$(document).ready(function () {
//	alert(id).toString();	
});
</script>









