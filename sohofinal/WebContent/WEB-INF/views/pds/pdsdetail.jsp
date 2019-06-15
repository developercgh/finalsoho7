<%@page import="sh.model.ShPdsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 코어 테그나 el테그 3줄 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<%
ShPdsDto pds = (ShPdsDto)request.getAttribute("pds");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url('/css/table.css');
</style>
</head>
<body>

<div align="center">
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
   <td style="text-align: left;">${pds.title }</td>
</tr>

<tr>
   <th>다운로드</th>
   <td style="text-align: left;">
      <input type="button" name="btnDown" value="다운로드" onclick="filedowns('${pds.filename}','${pds.seq }')">
   </td>
</tr>

<tr>
   <th>조회수</th>
   <td style="text-align: left;">${pds.readcount }</td>
</tr>

<tr>
   <th>다운수</th>
   <td style="text-align: left;">${pds.downcount }</td>
</tr>

<tr>
   <th>파일명</th>
   <td style="text-align: left;">${pds.filename }</td>
</tr>

<tr>
   <th>등록일</th>
   <td style="text-align: left;">${pds.wdate }</td>
</tr>

<tr>
   <th>내용</th>
   <td style="text-align: left;">
      <textarea rows="10" cols="50" name="content" id="_content" readonly="readonly">${pds.content }</textarea>   
   </td>
</tr>

</table>
</div>

<!-- 다운로드 버튼 클릭시에 동작이 되는 폼을 만들어줄수도 있음(파일 다운은 포스트 밖에 안됨) -->
<form name="file_Down" action="fileDownload.do" method="post">
   <input type="hidden" name="filename">
   <input type="hidden" name="seq">
</form>

<c:if test="${login.id eq pds.id }">   <!-- 자기글 -->

<div id="buttons_wrap">
<table>
<tr>
	<td align="left" style="padding-left: 10px">
		<button type="button" name="backBtn" id="_backBtn" value="back"
				class="btn btn-default btn-block" onclick="location.href='pdslist.do'">목록 보기</button>
	</td>
	
<%-- 						<td>
					<c:if test="${login.id eq  pds.id}">
						<img alt="" src="image/del.png" data-seq="${pds.seq }
							class="btn_fileDelete" id="zz" onclick="filedelete('${pds.seq}')" >
					</c:if>	
					</td> --%>
	
	
	
	<td>
		<c:if test="${login.id eq pds.id }">
			<button type="button" id="_btnAdd">수정하기</button>
		</c:if>
	</td>
	<td>
		<c:if test="${login.id eq pds.id }">
			<button type="button" onclick="deletechk()">삭제</button>
		</c:if>	
	</td>
</tr>
</table>

</div>

</c:if>

<form name="frmForm" id="_frmForm" action="pdsupdate.do" method="post">    <!-- 포스트로 널김때 방법 -->
   <input type="hidden" name="seq" value="${pds.seq }">
</form>



<script type="text/javascript">

$("#_btnAdd").click(function () {    //수정하기
   $("#_frmForm").submit();      //폼을 보냄
});

function filedowns(filename, seq) {
   alert("filename");
   var doc = document.file_Down;      //이름으로 접근(급할때 사용하세요)
   doc.filename.value = filename;
   doc.seq.value = seq;
   doc.submit();
   
   //location.href = "fileDownload.do?"      //원래대로라면 이러면 GET 방식임 (다운로드는 GET 이기 때문에)
   
}

function deletechk() {
	if(confirm("정말 삭제하시겠습니까?")) {
		location.href = "pdsdelete.do?seq=" + <%=pds.getSeq() %>;
		alert("게시물이 삭제되었습니다");
	}
}

</script>