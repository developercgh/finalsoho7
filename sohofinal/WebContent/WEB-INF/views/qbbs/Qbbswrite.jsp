<%@page import="sh.model.ShMemberDto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
table.type11 {
    border-collapse: separate;
    border-spacing: 1px;
    /* text-align: center; */
    line-height: 1.5;
    /* margin: 20px 10px; */
}
table.type11 th {
    width: 155px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background: #ce4869 ;
}
table.type11 td {
    width: 155px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #eee;
}
</style>

</head>
<body>

<%
Object ologin = session.getAttribute("login");
ShMemberDto mem = (ShMemberDto)ologin;
%>

<a href="logout.jsp">로그아웃</a>

<h1>글쓰기</h1>

<div align="center">

	<form action="QbbswriteAf.do" method="post">

		<table border="1" class="type11">
			<col width="200"><col width="400"> 
			
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
					<input type="text" name="title" size="50px">		
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="20" cols="50px" name="content"></textarea>		
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="글쓰기">
				</td>
			</tr>
		
		</table>
	
	</form>

</div>

<a href="Qbbslist.do">글목록</a>

</body>
</html>