<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
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

<title>주문 완료</title>
</head>
<body>
<%
	String shipping_cartId="";
	String shipping_name="";
	String shipping_shippingDate="";
	String shipping_country="";
	String shipping_zipCode="";
	String shipping_addressName="";
	
	
	Cookie[] cookies=request.getCookies();
	
	if (cookies!=null) {
		for (int i=0; i<cookies.length; i++) {
			Cookie thisCookie=cookies[i];
			String n=thisCookie.getName();
			
			if (n.equals("Shipping_cartId"))
				shipping_cartId=URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_shippingDate"))
				shipping_shippingDate=URLDecoder.decode((thisCookie.getValue()), "utf-8");
		}
	}
%>
<div class="top-nav">
    <%@ include file= "menu.jsp" %>
    </div>
<div class="container py-4">
	<div class="container-fluid py-5">
		
		</div>
		
		<div class="p-5 mb-4 bg-purple rounded-3">
			<div class="container-fluid py-5">
            	<h1 class="display-5 fw-bold text-white">주문 완료</h1>
            	<p class="col-md-8 fs-4 text-white">Order Completed</p>
        	</div>
		</div>

		<div class="row align-items-md-stretch">
			<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
			<p> 주문은<% out.println(shipping_shippingDate); %>에 배송될 예정입니다!
			<p> 주문번호 :<% out.println(shipping_cartId); %>
		</div>
		
		<div class="container">
			<p> <a href="./cars.jsp" class="btn custom-btn"> &laquo;차량 목록</a>
		</div>
		

</div>
<%@ include file="footer.jsp" %>

</body>
</html>

<%
	session.invalidate();

	for (int i=0; i<cookies.length; i++) {
		Cookie thisCookie=cookies[i];
		String n=thisCookie.getName();
		
		if (n.equals("Shipping_cartId"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_name"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_shippingDate"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_country"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_zipCode"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_addressName"))
			thisCookie.setMaxAge(0);
		
		response.addCookie(thisCookie);
	}
%>





