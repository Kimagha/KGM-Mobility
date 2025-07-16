<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="mvc.model.TransactionDTO" %>
<%@ page import="mvc.model.TransactionDAO" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

    <title>Transaction History</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">

 <style>
        /* 테이블 행 배경색 변경 */
        .container .table-striped tbody tr:nth-of-type(odd) {
            background-color: #C8E6FF !important; /* 라이트 블루 */
        }
        .container .table-striped tbody tr:nth-of-type(even) {
            background-color: #DAF0FF !important; /* 더 연한 블루 */
        }
        /* 테이블 헤더 스타일 */
        .container .table thead th {
            background-color: #E0E0E0 !important; /* 헤더 배경색 */
            color: #000 !important; /* 헤더 글자색 */
        }
    </style>

</head>
<body>
    <div class="container py-4">
 	<%@ include file="bankMenu.jsp" %>
 	
 	<%
		// 세션에서 현재 로그인된 사용자의 ID 가져오기
		String loggedInUserId = (String) session.getAttribute("userId");
		if (loggedInUserId == null) {
    		// 로그인되지 않은 경우 로그인 메시지 출력
	%>
    	<div class="alert alert-warning" role="alert">
        	로그인이 필요합니다.
    	</div>
	<%
		} else {
    		// 로그인된 경우 계좌 생성 양식 출력
	%>
 	<!-- <form action="Transaction.do" method="post"> -->
        <h2>출금, 입금, 이체 거래내역</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>계좌번호</th>
                    <th>비밀번호</th>
                    <th>이름</th>
                    <th>종류</th>
                    <th>은행</th>
                    <th>금액</th>
                    <th>이체계좌</th>
                    <th>거래시간</th>
                </tr>
            </thead>
            <tbody>
                <%
                List<TransactionDTO> transactionList = new TransactionDAO().getAllTransactions();
    				if (transactionList != null) {
        				for (TransactionDTO transaction : transactionList) {
				%>
                <tr>
                    <td><%= transaction.getAccountNumber() %></td>
                    <td><%= transaction.getPassword() %></td>
                    <td><%= transaction.getName() %></td>
                    <td><%= transaction.getType() %></td>
                    <td><%= transaction.getBank() %></td>
                    <td><%= transaction.getMoney() %></td>
                    <td><%= transaction.getOtherAccount() %></td>
                    <td><%= transaction.getTransactionTime() %></td>
                </tr>
    <%
            } // for 끝
        } // if 끝
    %>
            </tbody>
        </table>
        <%
    } // ← 이걸 추가해야 합니다!
%>
        <!-- </form> -->

    </div>
 
   <div class="row text-center">
 <div class="col-md-12">
	<img src="https://210.119.103.168:8080/uploads/gg551098/D_nhfoot.png" style="width : 100%; height :100%;"/>
  </div>
 </div>
		
</body>
</html>
