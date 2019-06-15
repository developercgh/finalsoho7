<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<%-- request.setCharacterEncoding("utf-8"); --%>
<jsp:useBean id="nows" class="java.util.Date"/>
<div align="center" id="_title_image" class="center">
      <img alt="이미지" src="image/nlogo1.png" title="소호펜션"
         style="height: 100px; cursor: pointer;" onclick="location.href='main.do'">   
   </div>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
    <ul class="navbar-nav">
    <c:if test="${login.id != null }">
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="main.tiles" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Mypage
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="main.do">홈으로</a>
          <a class="dropdown-item" href="mypage.do">마이페이지</a>
          <a class="dropdown-item" href="pwdup.do">비번변경</a>
          <a class="dropdown-item" href="myup.do">정보수정</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="toDeletePage.do">회원탈퇴</a>
        </div>
      </li>
      </c:if>
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" data-toggle="dropdown">
             펜션소개
        </a>
        <div class="dropdown-menu" >
          <a class="dropdown-item" href="pensionView.do">펜션소개</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
             객실상세
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="rbbslist.do">전체보기</a>
          <a class="dropdown-item" href="rbbsOne.do">베를린[101]</a>
          <a class="dropdown-item" href="rbbsTwo.do">런던[102]</a>
          <a class="dropdown-item" href="rbbsThree.do">파리[103]</a>
          <a class="dropdown-item" href="rbbsFour.do">로마[201]</a>
          <a class="dropdown-item" href="rbbsFive.do">프라하[202]</a>
          <a class="dropdown-item" href="rbbsSix.do">아테네[203]</a>
        </div>
      </li>
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="boo.do" id="navbarDropdownMenuLink" role="button" >
            부대시설
        </a>
      </li>
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="nearlist.do" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
             여행지
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="nearyong.do">용문산</a>
          <a class="dropdown-item" href="nearse.do">세미원</a>
          <a class="dropdown-item" href="neardo.do">두물머리</a>
        </div>
      </li>
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
             교통안내
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="map.do">오시는길</a>
        </div>
      </li>
      <c:if test="${login.id != null }">
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
             예약안내
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="Bookingwrite.do">예약하기</a>
          <c:if test="${login.auth eq 1 }">
          <a class="dropdown-item" href="Bookinglist.do">예약확인</a>
          </c:if>
        </div>
        
      </li>
      </c:if>
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
             커뮤니티
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="nbbslist.do">공지사항</a>
          <a class="dropdown-item" href="pdslist.do">추억남기기</a>
          <a class="dropdown-item" href="Ebbslist.do">이벤트게시판</a>
          <a class="dropdown-item" href="Qbbslist.do">자주하는질문</a>
          <c:if test="${login.id != null }">
          <a class="dropdown-item" href="polllist.do">고객만족도</a>
          </c:if>
        </div>
      </li>
    </ul>

   <div id="_title_today" style="width: 90%; float: right; text-align: right;">
      <div style="position: relative;">
      
      <c:if test="${login.id ne null}">
         <a href="logout.do" title="로그아웃">[로그아웃]</a>&nbsp;&nbsp;&nbsp;
      </c:if>
      <c:if test="${login.id eq null}">
         <a href="login.do" title="로그인" >[로그인]</a>&nbsp;&nbsp;&nbsp;
      </c:if>
      
      <c:if test="${login.name ne null }">
         <b>${login.name }</b>님 환영합니다 
      </c:if>
      
      <c:if test="${login.name eq null }">
         <a href="regi.do" title="회원가입">[회원가입]</a>
      </c:if>
      
      </div>   
   </div>
</nav>
   

