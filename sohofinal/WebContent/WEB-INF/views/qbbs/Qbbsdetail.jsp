<%@page import="sh.model.ShMemberDto"%>
<%@page import="sh.model.ShQbbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <%
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);
%>    --%> 
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Qbbsdetail.jsp</title>

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

#_backBtn {
	width: 100px;
}

.list_table textarea {
	border: none;
	resize: none;
}

</style>

	<!-- <style type="text/css">
	table.type01 {
	    border-collapse: collapse;
	    text-align: left;
	    line-height: 1.5;
	    margin : 20px 10px;
	}
	table.type01 th {
	    /* width: 150px; */
	    padding: 10px;
	    font-weight: bold;
	    vertical-align: top;
	    border: 1px solid #ccc;
	    text-align: center;
	}
	table.type01 td {
	    /* width: 350px; */
	    padding: 10px;
	    vertical-align: top;
	    border: 1px solid #ccc;
	}
	</style> -->
	
</head>
<body>

<%
Object ologin = session.getAttribute("login");
ShMemberDto mem = (ShMemberDto)ologin;
%>

<%

ShQbbsDto qbbs = (ShQbbsDto)request.getAttribute("Qbbs");
/* // readcount 갱신
dao.readcount(seq); */
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
			<td align="center">
				<textarea rows="5" cols="90" readonly="readonly"><%=qbbs.getContent() %></textarea>
				<form action="Qanswer.do" method="get">
					<input type="hidden" name="seq" value="<%=qbbs.getSeq() %>">
					<input type="submit" class="btn btn-default btn-block" value="댓글  달기 ">
				</form>
			</td>
		</tr>
	</table>
	<table>
		<!-- <col width="300"><col width="300"> -->
		<tr style="width: 800px">
			<td>
				<button type="button" name="backBtn" id="_backBtn" value="back"
					class="btn btn-default btn-block" onclick="location.href='Qbbslist.do'">목록 보기</button>
			</td>
<%-- 			<td>
				<form action="Qanswer.do" method="get">
					<input type="hidden" name="seq" value="<%=qbbs.getSeq() %>">
					<input type="submit" value="댓글">
				</form>
			</td> --%>
			<td>
		
			<%
			if(qbbs.getId().equals(mem.getId())){
				%>
				<button type="button" onclick="deleteQbbs('<%=qbbs.getSeq() %>')">삭제</button>
				<button type="button" onclick="updateQbbs('<%=qbbs.getSeq() %>')">수정</button>
				<%
			}
			%>	
			</td>
		</tr>
	</table>

</div>

	<script type="text/javascript">
		function deleteQbbs( seq ) {
			location.href = "Qbbsdelete.do?seq=" + seq;
		}
		
		function updateQbbs( seq ) {
			location.href = "Qbbsupdate.do?seq=" + seq;
		}
	
	</script>

</body>
</html>
