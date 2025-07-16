<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String userId=(String) session.getAttribute("userId");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Bank</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
    
    .custom-btn {
            background-color: green; 
            color: #fff;
            border-radius: 20px;
            padding: 10px 20px;
            font-size: 16px;
            margin-right: 10px;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
            margin-bottom: 20px; /* 여백 추가 */
        }
        .custom-btn:hover {
            color: #fff;
            background-color: #4169E1; /* 진한 블루 */
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }
        .custom-nav {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 10px;
        }
        .custom-nav .nav-link {
            color: #fff;
            transition: color 0.3s ease;
        }
        .custom-nav .nav-link:hover {
            color: #fff;
        }
        .custom-icon {
            margin-right: 8px;
        }
        
        /* .bank-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem;
        }
        .bank-header img {
            width: 800px;
            height: 100px;
        } */
    .btn-purple {
    background-color: #6f42c1;  /* 밝은 보라색 */
    color: #fff;
    border-radius: 20px;
    padding: 10px 20px;
    font-size: 16px;
    margin-right: 10px;
    transition: background-color 0.3s ease, box-shadow 0.3s ease;
    margin-bottom: 20px; /* 여백 추가 */
}

.btn-purple:hover {
    color: #fff;
    background-color: #5a32a3;  /* hover 시 진한 보라색 */
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}
    </style>
    
</head>
<body>

<header class="pb-3 mb-4 border-bottom bank-header">
    <a href="./bank.jsp" class="text-dark text-decoration-none">
        <img src="https://210.119.103.168:8080/uploads/gg551098/D_nhhome2.png" alt="Bank Icon">
    </a>
</header>

<div class="d-flex justify-content-between align-items-start px-3">
  <!-- 왼쪽: 계좌/출금/입금 메뉴 -->
  <ul class="nav custom-nav" style="padding: 0;">
    <li class="nav-item"><a href="./NewAccount.jsp" class="btn custom-btn" role="button">계좌 생성</a></li>
    <li class="nav-item"><a href="./Withdraw.jsp" class="btn custom-btn" role="button">출금</a></li>
    <li class="nav-item"><a href="./Transfer.jsp" class="btn custom-btn" role="button">입금</a></li>
    <li class="nav-item"><a href="./Send.jsp" class="btn custom-btn" role="button">이체</a></li>
    <li class="nav-item"><a href="./Transaction.jsp" class="btn custom-btn" role="button">입출금,이체 내역</a></li>
    
  </ul>

  <!-- 오른쪽: 로그인/회원 관련 메뉴 -->
  <ul class="nav nav-pills">
  <li class="nav-item"><a href="./index.jsp" class="btn btn-purple" role="button">KGM Mobility</a></li>
    <c:choose>
      <c:when test="${empty userId}">
        <li class="nav-item"><a class="nav-link" href="<c:url value='./loginMember2.jsp'/>" style="color: black;">로그인</a></li>
        <li class="nav-item"><a class="nav-link" href="<c:url value='./addMember2.jsp'/>" style="color: black;">회원가입</a></li>
      </c:when>
      <c:otherwise>
        <li class="nav-item" style="padding-top: 7px; color: white">[<%=userId%>님]</li>
        <li class="nav-item"><a class="nav-link" href="<c:url value='./logoutMember2.jsp'/>" style="color: black;">로그아웃</a></li>
        <li class="nav-item"><a class="nav-link" href="<c:url value='./updateMember2.jsp'/>" style="color: black;">회원 수정</a></li>
      </c:otherwise>
    </c:choose>
  </ul>
</div>

<!-- 부트스트랩 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
