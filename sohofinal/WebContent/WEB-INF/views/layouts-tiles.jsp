<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<tiles:insertAttribute name="header"/>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/css/main.css">
</head>
<body>

<div id="body_wrap">
	<div id="main_wrap">
		<div id="header_wrap" style="background-color : #b0dbd2;">
			<tiles:insertAttribute name="top_inc"/>
		</div>
		
		<div id="middle_wrap">
		
			<div id="content_wrap">
				<div id="content_title_wrap">
				
				</div>
				
				<tiles:insertAttribute name="bbstop"/>
				<tiles:insertAttribute name="main"/>
				
			</div>		
		</div>	
		
		<div id="footer_wrap">
			<tiles:insertAttribute name="bottom_inc"/>
		</div>		
	</div>
</div>

<script type="text/javascript">
 $(document).ready(function () {	
	$("#content_title_wrap div.title").css("background-image", "url('<%=request.getContextPath() %>/image/ico_sub_sb.gif')");
}); 
</script>


</body>
</html>



