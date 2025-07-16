<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String userId = (String) session.getAttribute("userId");
%>

<head>
<link href="https://cdn.jsdelivr.net/npm/pretendard@1.3.8/dist/web/static/pretendard.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</head>
<style>

body, html {
      height: 100%;
      font-family: 'Pretendard', sans-serif;
    }
    .top-nav {
	  position: absolute;
	  top: 0;
  	width: 100%;
  	padding: 17.5px 50px;
  	background: rgba(0, 0, 0, 0.3);
  	z-index: 10;
}

    .top-nav .menu {
      display: flex;
      gap: 30px;
      font-weight: 500;
    }

    .top-nav span {
      cursor: pointer;
    } 
</style>    

	<div class="d-flex justify-content-between align-items-center px" style="width: 100%;">

  <!-- 왼쪽: 모델/차량등록 -->
  <div class="d-flex align-items-center gap-4">
    <a href="./cars.jsp" class="text-white text-decoration-none">
      <span class="fs-6 custom-font">모델</span>
    </a>
<!--     <a href="./addCar.jsp" class="text-white text-decoration-none">
      <span class="fs-6 custom-font">차량 등록</span>
    </a> -->
    
   <a class="btn btn-sm btn-gray dropdown-toggle text-white" id="Dropdown" data-bs-toggle="dropdown" aria-expanded="false">
    수정/등록/삭제
  </a>
    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="Dropdown">
    	<li><a class="dropdown-item" href="addCar.jsp">차량 등록</a></li>
    	<li><a class="dropdown-item" href="editCar.jsp?edit=update">차량 수정</a></li>
    	<li><a class="dropdown-item" href="editCar.jsp?edit=delete">차량 삭제</a></li>
    </ul>
    
    
    <a class="btn btn-sm btn-gray dropdown-toggle text-white" id="BankDropdown" data-bs-toggle="dropdown" aria-expanded="false">
    게시판/은행
  </a>
  
  <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="BankDropdown">
  		<li><a class="dropdown-item" href="<c:url value='/BoardListAction.do?pageNum=1'/>">게시판</a></li>
  		<li><a class="dropdown-item" href="bank.jsp">은행</a></li>
  </ul>
    
    
<%--         <a href="<c:url value='/BoardListAction.do?pageNum=1'/>" class="text-white text-decoration-none">
      <span class="fs-6 custom-font">게시판</span>
    </a> --%>
    
    
    
  </div>

  <!-- 가운데: 로고 -->
  <div class ="ms-5">
     <a href="./index.jsp">
    <img src="resources/images/KGMLOGO03.png" alt="KGM Logo" style="height: 35px;">
  </a>
  </div>

  <!-- 오른쪽: 로그인/KOREA -->
  <div class = "d-flex gap-4">
  <ul class="nav nav-pails">
  <c:choose>
    		<c:when test="${empty sessionScope.userId}">
    			<li class="nav-item"><a class="nav-link" href="<c:url value="./loginMember.jsp"/>" style="color: white;">로그인</a></li>
    			<li class="nav-item"><a class="nav-link" href='<c:url value="./addMember.jsp"/>' style="color: white;">회원가입</a></li>
    		</c:when>
    		<c:otherwise>
    			<li style="padding-top: 7px; color: white">[${sessionScope.userId}님]</li>
    			</li>
    			<li class="nav-item"><a class="nav-link" href="<c:url value="./logoutMember.jsp"/>" style="color: white;">로그아웃</a></li>
    			<li class="nav-item"><a class="nav-link" href="<c:url value="./updateMember.jsp"/>" style="color: white;">회원 수정</a></li>
    		</c:otherwise>
    	</c:choose>
    	</ul>
  
<%--  <ul class="nav nav-pails">
  <c:choose>
  	<c:when test="${empty sessionId }">
  		<a class = "nav-link"  href = "<c:url value="./loginMember.jsp"/>" style="color: white;">로그인</a>
  	<a class="nav-link" href="<c:url value='./addMember.jsp'/>" style="color: white;">회원가입</a>
  </c:when>
  <c:otherwise>
        <li style="padding-top: 7px; color: white">[<%=sessionId%>님]</li>
        <li class="nav-item"><a class="nav-link" href="<c:url value='./logoutMember.jsp'/>" style="color: black;">로그아웃</a></li>
        <li class="nav-item"><a class="nav-link" href="<c:url value='./updateMember.jsp'/>" style="color: black;">회원 수정</a></li>
  </c:otherwise>
  </c:choose>
  </ul>  --%>
    <a href="./webChatClient.jsp" class="text-white text-decoration-none" style="margin-top: 8px;">
      <span class="fs-7 custom-font">채팅</span>
    </a>
    

  <a class="btn btn-sm btn-gray dropdown-toggle text-white" id="exceptionDropdown" data-bs-toggle="dropdown" aria-expanded="false" style="margin-top: 4px;">
    예외처리
  </a>
  <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="exceptionDropdown">
    <li><a class="dropdown-item" href="exceptionNoCarID.jsp">ID예외처리</a></li>
    <li><a class="dropdown-item" href="exceptionNoPage.jsp">예외처리</a></li>
  </ul>




  </div>

</div>