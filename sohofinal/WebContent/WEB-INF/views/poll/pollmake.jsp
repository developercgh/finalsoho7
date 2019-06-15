<%@page import="java.util.Calendar"%>
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
<style type="text/css">
@import url("/css/table.css");

.list_table {
	margin-bottom: 50px;
	width: 800px;
	float: center;
}

.list_table th {

}

.list_table td {
	text-align: left;
	padding-left: 20px;
}

.list_table input {
	border: none;
}

.list_table textarea {
	resize: none;
	border: none;
}

.question {
	font-size: 18px;
}

</style>
</head>
<body>

<script type="text/javascript">
$(document).ready(function () {
	
	for(i = 5; i <= 10; i++){		//처음에 화면이 나오면 보기의 갯수
		$("#poll" + i).hide();
	}
});

function pollchange( me ) {		//보기의 갯수를 갱신하는 함수
	
	var num = me.options[me.selectedIndex].value;
	alert(num + "개");
	
	for(i = 0;i <= 10; i++){	//초기화
		$("#poll" + i).val("");
		$("#poll" + i).hide();
	}
	
	for(i = 1;i < num; i++){	//선택한 갯수만을 보여준다
		$("#poll" + i).show();
	}
}

</script>

<%
Calendar cal = Calendar.getInstance();		//오늘 날짜에 대한 캘린더를 가져옴
int tyear = cal.get(Calendar.YEAR);				//tyear ==  today's year   // 2019. 5 . 17.
int tmonth = cal.get(Calendar.MONTH) + 1;		//잊어버렸을까봐 인식이 0 ~ 11이 되서 +1하는 거야
int tday = cal.get(Calendar.DATE);

//login이라는것도 하나의 session에서의 Object 형태. Session(Key = String, Value = Object)
/*
그래서 우리가 해줬던게 MemberDto login = (MemberDto)Request.getSession(login);
Model <- 



*/
%>

<form action="pollmakeAf.do" method="post">

<table class="list_table">
<colgroup>
	<col width="200px"><col width="500px">
</colgroup>

<tr>
	<th>아이디</th>
	<td style="text-align: left;">
		${login.id }		<!-- 혹시나 해서 적어 놓는데 컨트롤 부분보면 login인 받아오는 거 있어 -->
		<!-- login의 타입은 MemberDto login.id ==  login.getId(); -->
		<input type="hidden" name="id" value="${login.id }">
	</td>
</tr>

<tr>
	<th>투표기한</th>
	<td style="text-align: left;">
		<!-- 연도 -->
		<select name="syear">
			<%
			for(int i = tyear; i < tyear + 6; i++){ // for문이다보니까 시작날짜부터해서 6칸. +6이니까
				%>
				<option <%=(tmonth+"").equals(i+"")?"selected='selected'":"" %> value="<%=i %>" ><%=i %></option>
			<%
			}
			%>
			 
		
		</select>년
		
		<!-- 월 -->
		<select name="smonth">
			<%
			for(int i = 1;i <= 12; i++){
				%>
				<option <%=(tmonth + "").equals(i + "")?"selected='selected'":"" %> value="<%=i %>"><%=i %></option>
				<%
			} 	
			%>
		</select>월
		
		<!-- 일 -->
		<select name="sday">
			<%
			for(int i = 1; i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){
				%>
				<option <%=(tday + "").equals(i + "")?"selected='selected'":"" %> value="<%=i %>"><%=i %></option>
			<%	
			}
			%>
		</select>일
		~
		<!-- 연도 -->
		<select name="eyear">
			<%
			for(int i = tyear; i < tyear + 6; i++){
				%>
				<option <%=(tmonth+"").equals(i+"")?"selected='selected'":"" %> value="<%=i %>" ><%=i %></option>
			<%
			}
			%>
			 
		
		</select>년
		
		<!-- 월 -->
		<select name="emonth">
			<%
			for(int i = 1;i <= 12; i++){
				%>
				<option <%=(tmonth + "").equals(i + "")?"selected='selected'":"" %> value="<%=i %>"><%=i %></option>
				<%
			} 	
			%>
		</select>월
		
		<!-- 일 -->
		<select name="eday">
			<%
			for(int i = 1; i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){
				%>
				<option <%=(tday + "").equals(i + "")?"selected='selected'":"" %> value="<%=i %>"><%=i %></option>
			<%	
			}
			%>
		</select>일		
	</td>
</tr>

<tr>
	<th>투표내용</th>
	<td style="text-align: left;">
		<textarea rows="10" cols="50" name="question"></textarea>
	</td>
</tr>

<tr>
	<th>투표문항수</th>
	<td style="text-align: left;">
		<select name="itemcount" onchange="pollchange(this)">
			<%
			for(int i = 2;i <= 10; i++){		/* 최소 보기가 2개는 있어야 해서 */
				%>
				<option <%=(4 + "").equals(i + "")?"selected='selected'":"" %> value="<%=i %>"><%=i %></option>
				<%
			}
			%>
		</select>개
	</td>
</tr>

<tr>
	<th>투표상세문항</th>
	<td style="text-align: left;">
		<%
		for(int i = 1;i <= 10; i++){
			%>
			<div id="poll<%=i %>">
				<%=(i+"") %>번:<input type="text" name="poll<%=i %>" size="60"><br>
			</div>
			<%
		}
		%>
	</td>
</tr>

<tr align="center">
	<td colspan="2">
		<input type="submit" value="고객  후기">
	</td>
</tr>
		
</table>

</form>




</body>
</html>