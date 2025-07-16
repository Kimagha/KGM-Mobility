<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Random" %>
<%@ page import="mvc.model.TransactionDTO" %>
<%@ page import="mvc.model.TransactionDAO" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />

<style>
		.custom-bg-half {
            background: linear-gradient(to right, #C8E6FF 50%, #DAF0FF 50%);
            padding: 5rem;
            border-radius: .3rem;
            margin-bottom: 1rem;
        }
</style>


    <title>Transfer</title>
</head>
<body>


<c:if test="${param.error eq '금액오류'}">
    <script>alert('0원 이하 금액은 입금할 수 없습니다.');</script>
</c:if>

<%-- <c:if test="${param.error eq '계좌없음'}">
    <script>alert('계좌번호가 올바르지 않습니다.');</script>
</c:if>

<c:if test="${param.error eq '정보불일치'}">
    <script>alert('은행 또는 비밀번호를 확인해주세요.');</script>
</c:if> --%>


 	<div class="container py-4">
 	<%@ include file="bankMenu.jsp" %>
 	
        <div class="container-fluid py-5">
 	
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
 	
		<form action="Transfer.do" method="post">

        	<div class="form-group row">
            	<label for="accountNumber" class="col-sm-2 col-form-label">계좌번호</label>
           		<div class="col-sm-3">
                	<input type="text" id="accountNumber" name="accountNumber" class="form-control" placeholder="계좌번호">
            	</div>
        	</div>
        	
        	<div class="form-group row">
				<label for="password" class="col-sm-2 col-form-label">비밀번호</label>
				<div class="col-sm-3">
					<input type="text" id="password" name="password" class="form-control" placeholder="비밀번호">
				</div>
			</div>		
		
        	<div class="form-group  row">
				<label for="name" class="col-sm-2 col-form-label">성명</label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control" placeholder="성명">
				</div>
			</div>
			

            <div class="form-group row">
                <label class="col-sm-2">은행</label>
				<div class="col-sm-10">
					<select name="bank">
						<option value="농협">농협</option>
						<option value="국민">국민</option>
						<option value="하나">하나</option>
						<option value="신한">신한</option>
						<option value="카카오뱅크">카카오뱅크</option>
					</select>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2">입출금 종류</label>
                <div class="col-sm-10">
                    <select name="type">
                        <option value="입금">입금</option>
                    </select>
                </div>
            </div>

        	<div class="form-group row">
            	<label for="money" class="col-sm-2 col-form-label">금액</label>
            	<div class="col-sm-3">
                	<input name="money" type="text" class="form-control" placeholder="money">
            	</div>
        	</div>
        
        
        	<div class="form-group row">
            	<div class="col-sm-offset-2 col-sm-10">
                	<input type="submit" class="btn btn-primary" value="등록"> 
                	<input type="reset" class="btn btn-secondary" value="취소">
            	</div>
        	</div>
    	</form>
    	
    	<%
			}
		%>
		
    	</div>
    	</div>
    	
    	 <div class="row text-center">
 <div class="col-md-12">
	<img src="https://210.119.103.168:8080/uploads/gg551098/D_nhmiddle1.png" style="width : 100%; height :100%;"/>
 </div>
 </div>
 
  <div class="row align-items-md-stretch   text-center">
 <div class="col-md-12">
 <div class="h-100 p-5">
	<img src="https://210.119.103.168:8080/uploads/gg551098/D_nhmiddle2.png" style="width : 100%; height :100%;"/>
 </div>
 </div>
 </div>
 
   <div class="row text-center">
 <div class="col-md-12">
	<img src="https://210.119.103.168:8080/uploads/gg551098/D_nhfoot.png" style="width : 100%; height :100%;"/>
  </div>
 </div>
</body>
</html>