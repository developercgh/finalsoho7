<%@page import="sh.model.ShNbbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<%
ShNbbsDto nbbs = (ShNbbsDto)request.getAttribute("nbbs");
%>

<script>
alert("제목 또는 내용이 비어있습니다. 다시 확인해주세요");
location.href = "nbbsupload.do=" + <%=nbbs.getSeq() %>;
</script>
