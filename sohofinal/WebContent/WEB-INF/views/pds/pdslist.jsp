<%@page import="sh.model.ShMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 코어 테그나 el테그 3줄 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />

<!-- 검색 키워드와 카테고리 값을 받는곳 -->
<%
	String category = (String) request.getAttribute("s_category");
	if (category == null)
		category = "";

	String keyword = (String) request.getAttribute("s_keyword");
	if (keyword == null)
		keyword = "";
%>

<%
// ShMemberDto login = (ShMemberDto)request.getAttribute("login");
//ShMemberDto login =null;
%>
<script>
var category = "<%=category%>";
var keyword = "<%=keyword %>";
	$(document).ready(function() {
		$("#_s_category").val(category);

		document.frmForm1.s_keyword.value = keyword;
	});
</script>

<style type="text/css">
@import
url
(
"/css/table.css"
);
.list_table a {
	color: #000000;
}
</style>

<div align="center">
	<table class="list_table">
		<colgroup>
			<col width="50">
			<col width="100">
			<col width="300">
			<col width="50">
			<col width="50">
			<col width="50">
			<col width="100">
			<col width="50">
		</colgroup>

		<thead>
			<!-- 표의 머리부분 -->
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>다운로드</th>
				<th>조회수</th>
				<th>다운수</th>
				<th>작성일</th>
				<th>삭제</th>
			</tr>
		</thead>

		<tbody>

			<!-- 
for (int i  = 0; i < 10; i++){
   i == varStatus OK?
}

 -->

			<c:forEach var="pds" items="${pdslist }" varStatus="pdsS">
				<!-- var은 사용할 변수명, items는 Collection 객체(List, ArrayList), varStatus은 반복상태를 알수 있는 변수 -->

				<tr>
					<!-- 반드시 위에서 써 놓은 거를 맞춰서 작상할것 -->
					<td>${pdsS.count }</td>
					<!-- 카운트를 가져올거고 -->
					<td>${pds.id  }</td>
					<!-- 아이디를 가져올거고 -->
					<td style="text-align: left;">
						<!-- 왼쪽 정렬 --> <a href="pdsdetail.do?seq=${pds.seq }"> <!-- seq값을 가지고 디테일러 갈거임 -->
							<%-- ${pds.title } --%> <!-- 화면에 타이틀을 보여줄거임 --> <c:if
								test="${pds.del eq 1 }">
               이 글은 게시자에 의해서 삭제 되었습니다    
         </c:if> <c:if test="${pds.del eq 0 }">
								<a href="pdsdetail.do?seq=${pds.seq }"> ${pds.title }</a>
							</c:if> <!-- 화면에 타이틀을 보여줄거임 -->

					</a>
					<td><input type="button" name="btnDown" value="다운로드"
						onclick="filedowns('${pds.filename}', '${pds.seq }')"> <!-- 다운하면 filename과 seq를 보냄 -->
					</td>
					<td>${pds.readcount }</td>
					<td>${pds.downcount }</td>
					<td><font size="1">${pds.wdate }</font> <!-- 작성일(Written by) -->
					</td>


				</tr>

			</c:forEach>

		</tbody>

	</table>

	<!-- 추가 버튼(데이터 추가) -->
	<div id="buttons.wrap" align="center">
		<span class="button blue">
			<button type="button" id="_btnAdd">자료추가</button>
		</span>
	</div>
	<!-- 페이징 처리 -->
	<div id="paging_wrap">
		<jsp:include page="/WEB-INF/views/pds/paging.jsp" flush="false">
			<jsp:param value="${pageNumber }" name="pageNumber" />
			<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen" />
			<jsp:param value="${recordCountPerPage }" name="recordCountPerPage" />
			<jsp:param value="${totalRecordCount }" name="totalRecordCount" />
		</jsp:include>
	</div> 
	<div class="box_border" style="margin-top: 5px; margin-bottom: 10px">

		<form action="" name="frmForm1" id="_frmFormSearch" method="post">

			<table
				style="margin-left: auto; margin-right: auto; margin-top: 3px; margin-bottom: 3px;">
				<tr>
					<td>검색:</td>
					<td style="padding-left: 5px"><select id="_s_category"
						name="s_category">

							<option value="" selected="selected">선택</option>
							<option value="title">제목</option>
							<option value="contents">내용</option>
							<option value="writer">작성자</option>
					</select></td>
					<td style="padding-left: 5px"><input type="text"
						id="_s_keyword" name="s_keyword"></td>
					<td style="padding-left: 5px"><span class="button blue">
							<button type="button" id="_btnSearch">검색</button>
					</span></td>
				</tr>

			</table>

			<input type="hidden" name="pageNumber" id="_pageNumber"
				value="${(empty pageNumber)?0:pageNumber }"> <input
				type="hidden" name="recordCountPerPage" id="_recordCountPerPage"
				value="${(empty recordCountPerPage)?10:recordCountPerPage }">

		</form>

		<!-- 다운로드 버튼 클릭시에 동작이 되는 폼을 만들어줄수도 있음 (파일 다운은 포스트 밖에 안됨-->
		<form name="file_Down" action="fileDownload.do" method="post">
			<!-- 왜 히든으로 숨겼는 지는 알지? 값을 필요로 하는데 보여줄 필요는 없기 때문이야 -->
			<input type="hidden" name="filename"> <input type="hidden"
				name="seq">
		</form>

	</div>


</div>

<script type="text/javascript">
// 	$("#_btnAdd").click(function() { /* 위에 자료 추가에 아이디랑 동일 */
/*		if($("login.id") == null){
			alert("로그인을 해야합니다");
		//	return false;
		}else{
		location.href = "pdswrite.do";
	}
	}); */
	$("#_btnAdd").click(function() { /* 위에 자료 추가에 아이디랑 동일 */
		if(${login.id ne null}){
			location.href = "pdswrite.do";
		//	return false;
		}else{
			alert("로그인을 해야합니다");
		
	}
	});

	$(".btn_fileDelete").click(function() { /* 여기는 클래스를 줬기 때문에 .을 찍었음 */

		var seq = document.getElementById('zz'); /* del부분에 아이디 값이 똑같아야함 */

		location.href = "pdsdelete.do?seq=" + seq.dataset.seq;
		/* seq.dataset.seq이 부분 모를거야 아마도? 컨트롤러 부분에서 파라미터는 seq이고 그 seq는 seq.dataset.seq로 받아오는 거고
		      델리트 하는 순간에 데이터를 없에고 말고는 pdsdelete.do 코드를 봐봐 
		그리고 sql문을 보고 delete로 할지 update로 지우는지를 결정하면 돼 아마도 보통은 update로 처리한다는 걸로 알고 있는데 ...확실하지는 않아 ㅋㅋ */

	});

	function filedowns(filename, seq) {
		alert("filename"); /* 꼭 한번 찍어봐 seq로 찍어봐도 되고 */
		var doc = document.file_Down; //이름으로 접근(폼으로 하기 때문에 네임으로 가능하다는 거)
		doc.filename.value = filename;
		doc.seq.value = seq;
		doc.submit();

	}

	function goPage(pageNumber) {

		$("#_pageNumber").val(pageNumber);
		$("#_frmFormSearch").attr("action", "pdslist.do").submit();
	}

	$("#_btnSearch").click(function() {
		//  alert("_btnSearch");   
		$("#_frmFormSearch").attr("action", "pdslist.do").submit();
	});
</script>
