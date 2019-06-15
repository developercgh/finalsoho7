<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body {
	margin : 0;
	padding : 0;
	background : url (img.jpg) center center fixed no-repeat;
}
video {
	position : fixed;
	top : 0; 
	left : 0;
	min-width : 100 %;
	min-height : 100 %;
	width : auto;
	height : auto;
	z-index : -1;
}
	</style>
</head>
<body>
	<video autoplay loop poster = "img.jpg">
		<source src = "movie.mp4"type = "video / mp4">
	</video>
</body>
</html>