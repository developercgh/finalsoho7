<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 코어 테그 사용 -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>   



<!-- 혹시 모를수 있으니까 여기 테이블은 수정테이블이야!!(폼으로 만들어야지 나중에 이름으로 넘겨줄거임!! 여기서 중요한거라고나 해야할거 서블릿이랑 통신을 위해서 encytype 잘 보고해야함-->
<form name="frmForm" id="_frmForm" action="pdsupdateAf.do" method="post" encytype="multipart/form-data">

<input type="hidden" name="seq" value="${pds.seq }">

<table class="list_table" style="width: 85%">
<colgroup>
<col width="200"><col width="500">
</colgroup>

<tr>
	<th>아이디</th>
	<td style="text-align: left;">${pds.id }</td>
</tr>

<tr>
	<th>제목</th>
	<td style="text-align: left;">
		<input type="text" name="title" size="50" value="${pds.title }">
	</td>
</tr>

<tr>
	<th>파일업로드</th>
	<td style="text-align: left;">
		<!-- 기존의 파일 -->
		<input type="text" name="namefile" value="${pds.filename }" size="50" readonly="readonly">	
			<!-- 혹시  EL tag 사용법 써놀게 value를 pds테이블에 이름이 filename인거 -->
		<!-- 수정할 파일 -->
		<input type="file" name="fileload" style="width: 400px;">
	</td>
</tr>

<tr>
	<th>내용</th>
	<td style="text-align: left;">
		<textarea rows="10" cols="50" name="content" id="_content">${pds.content }</textarea>
	</td>
</tr>

<tr>
	<td colspan="2" style="height: 50px; text-align: left;" >
		<span>	<!-- 혹시 이것도 모를수 있으니 href에 #none 하는 이유는 아무것도 실행하지 않으면 이동하지 않음 -->
			<a href="#none" id="btnupdate" title="수정완료">
				<img alt="" src="image/bupdate.png">
			</a>
		</span>
	</td>
</tr>

</table>

</form>

<script>
$("#btnupdate").click(function () {
	$("#_frmForm").submit();	
});
</script>

