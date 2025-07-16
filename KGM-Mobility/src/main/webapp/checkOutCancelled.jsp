<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">


<meta charset="UTF-8">

<style>

	.bg-lightblue {
        background-color: lightblue;
    }
    
    .custom-btn {
        background-color: lightblue; 
        color: #fff;
        border-radius: 20px;
        padding: 10px 20px;
        font-size: 16px;
        margin-right: 10px;
        transition: background-color 0.3s ease, box-shadow 0.3s ease;
    }
    .custom-btn:hover {
    	color: #fff;
        background-color: #4169E1; /* 진한 블루 */
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
    }

</style>

<title>주문 취소</title>
</head>
<body>

<div class="container py-4">
	<%@ include file="menu.jsp" %>
		
		<div class="p-5 mb-4 bg-lightblue rounded-3">
			<div class="container-fluid py-5">
            	<h1 class="display-5 fw-bold text-white">주문 취소</h1>
            	<p class="col-md-8 fs-4 text-white">Order Cancellation</p>
        	</div>
		</div>

		<div class="row align-items-md-stretch">
			<h2 class="alert alert-danger">주문이 취소되었습니다.</h2>
		</div>
		
		<div class="container">
			<p> <a href="./cars.jsp" class="btn custom-btn"> &laquo;도서 목록</a>
		</div>
		
		<%@ include file="footer.jsp" %>

</div>

</body>
</html>