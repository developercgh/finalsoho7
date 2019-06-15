<%@page import="sh.model.ShPollSubDto"%>
<%@page import="sh.model.ShPollDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>    
    
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>    
    
    
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

<%
List<ShPollSubDto> list = (List<ShPollSubDto>)request.getAttribute("pollsublist");

//json생성
String jsonLike = "[";

for(ShPollSubDto p : list){
	jsonLike += "{name:'" + p.getAnswer() + "', y:" + p.getAcount() + "},";	
}
//이것도 설명이 필요함
jsonLike = jsonLike.substring(0,jsonLike.lastIndexOf(","));
jsonLike +="]";

System.out.println(jsonLike);		//모라고 찍힐까

request.setAttribute("jsonLike", jsonLike);		//생각해보기
%>

<table class="list_table">
<colgroup>
	<col width="100px"><col width="500px">
</colgroup>

<tr>
	<th>투표번호</th>
	<td style="text-align: left;">
		<input type="text" name="pollid" value="${poll.pollid }" size="50" readonly="readonly">
	</td>
</tr>

<tr>
	<th>아이디</th>
	<td style="text-align: left;">
		<input type="text" name="id" value="${login.id }" size="50" readonly="readonly">
	</td>
</tr>
 
<tr>
	<th>투표기한</th>
	<td>
		<input type="text" name="id" value="${poll.wdate }" size="50" readonly="readonly">
	</td>
</tr>

<tr>
	<th>투표내용</th>
	<td>
		<strong>
			<textarea rows="1" cols="80" name="question" id="question" readonly="readonly">${poll.question }</textarea>
		</strong>
	</td>
</tr>

<tr>
	<th>투표결과<br>(전체투표자<br>:${poll.polltotal }명)</th>
	<td>
		<div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
	</td>
</tr>

</table>

<script type="text/javascript">
$(function(){
	
	Highcharts.chart('container', {
		  chart: {
		    plotBackgroundColor: null,
		    plotBorderWidth: null,
		    plotShadow: false,
		    type: 'pie'
		  },
		  title: {
		    text: '투표통계결과'
		  },
		  tooltip: {
		    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		  },
		  plotOptions: {
		    pie: {
		      allowPointSelect: true,
		      cursor: 'pointer',
		      dataLabels: {
		        enabled: true,
		        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
		        style: {
		          color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
		        }
		      }
		    }
		  },
		  series: [{
		    name: 'Brands',
		    colorByPoint: true,
		    data: <%=request.getAttribute("jsonLike") %>
		  }]
		});
});

</script>

</body>
</html>

