<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">

<style>

	.bg-purple {
        background-color: purple;
    }
    
    .custom-btn {
        background-color: purple; 
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

<title>배송 정보</title>
</head>
<body>
<div class="top-nav">
    <%@ include file= "menu.jsp" %>
    </div>
<div class="container-fluid py-5">
</div>
<div class="container py-4">
    
    <div class="p-5 mb-4 bg-purple rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold text-white">배송 정보</h1>
            <p class="col-md-8 fs-4 text-white">Shipping Info</p>
        </div>
    </div>
    
    <div class="row align-items-md-stretch">
        <form action="./processShippingInfo.jsp" method="post">
            <input type="hidden" name="cartId" value="<%=request.getParameter("cartId")%>">
            
            <div class="mb-3 row">
                <label class="col-sm-2">성명</label>
                <div class="col-sm-3">
                    <input type="text" name="name" class="form-control">
                </div>
            </div>
            
            <div class="mb-3 row">
                <label class="col-sm-2">배송일</label>
                <div class="col-sm-3">
                    <input type="text" name="shippingDate" class="form-control">
                </div>
            </div>
            
            <div class="mb-3 row">
                <label class="col-sm-2">국가명</label>
                <div class="col-sm-3">
                    <input type="text" name="country" class="form-control">
                </div>
            </div>
            
            <div class="mb-3 row">
                <label class="col-sm-2">우편번호</label>
                <div class="col-sm-3">
                    <input type="text" name="zipCode" class="form-control">
                </div>
            </div>
            
            <div class="mb-3 row">
                <label class="col-sm-2">주소</label>
                <div class="col-sm-5">
                    <input type="text" name="addressName" class="form-control">
                </div>
            </div>
            
            <div class="mb-3 row">
                <div class="col-sm-offset-2 col-sm-10">
                    <a href="./cart.jsp?cartId=<%=request.getParameter("cartId") %>" class="btn custom-btn" role="button"> 이전 </a>
                    <input type="submit" class="btn btn-primary" value="등록" />
                    <a href="./checkOutCancelled.jsp" class="btn btn-danger" role="button"> 취소 </a>
                </div>
            </div>
            
        </form>
    </div>
   
</div>
 <jsp:include page="footer.jsp" />
</body>
</html>
