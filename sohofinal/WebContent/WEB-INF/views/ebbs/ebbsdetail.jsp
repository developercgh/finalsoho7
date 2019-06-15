<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<table class="list_table" style="width: 85%">

<colgroup>
<col width="200"><col width="500">
</colgroup>

<tr>
	<th>아이디</th>
	<td style="text-align: left;">${Ebbs.id}</td>
</tr>

<tr>
	<th>제목</th>
	<td style="text-align: left;">${Ebbs.title}</td>
</tr>

<tr>
	<th>다운로드</th>
	<td style="text-align: left;">
		<input type="button" name="btnDown" value="다운로드"
			onclick="filedowns('${Ebbs.filename}', '${Ebbs.seq }')">
	</td>
</tr>

<tr>
	<th>조회수</th>
	<td style="text-align: left;">${Ebbs.readcount}</td>
</tr>

<tr>
	<th>다운수</th>
	<td style="text-align: left;">${Ebbs.downcount}</td>
</tr>

<tr>
	<th>파일명</th>
	<td style="text-align: left;">${Ebbs.filename}</td>
</tr>

<tr>
	<th>등록일</th>
	<td style="text-align: left;">${Ebbs.wdate}</td>
</tr>

<tr>
	<th>내용</th>
<td style="text-align: left;"><textarea rows="10" cols="50"
name="content" id="_content">${Ebbs.content }</textarea>
</td>
</tr>

</table>
<form name="file_Down" action="EfileDownload.do" method="post">
	<input type="hidden" name="filename">
	<input type="hidden" name="seq">

</form>

<c:if test="${login.id eq Ebbs.id }">
<div id="buttons_wrap">
	<span class="button blue">
		<button type="button" id="_btnAdd">수정하기</button>
	</span>
</div>
</c:if>

<c:if test="${login.id eq Ebbs.id }">
<div id="buttons_wrap">
	<span class="button blue">
		<button type="button" id="_btnDel">삭제하기</button>
	</span>
</div>
</c:if>

<form name="frmForm" id="_frmForm" action="Ebbsupdate.do" method="post">
<input type="hidden" name="seq" value="${Ebbs.seq }">

</form>

<script type="text/javascript">

$("#_btnAdd").click(function () {
	$("#_frmForm").submit()
});

function deleteEbbs( seq ) {
	location.href = "Ebbsdelete.do?seq=" + seq;
}
function filedowns(filename, seq){
	var doc = document.file_Down;
	doc.filename.value = filename;
	doc.seq.value = seq;
	doc.submit();
}
</script>