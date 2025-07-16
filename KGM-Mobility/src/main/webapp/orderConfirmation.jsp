<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="dto.Car" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	String cartId=session.getId();
	
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
			
			if (n.equals("Shipping_name"))
				shipping_name=URLDecoder.decode((thisCookie.getValue()), "utf-8");
			
			if (n.equals("Shipping_shippingDate"))
				shipping_shippingDate=URLDecoder.decode((thisCookie.getValue()), "utf-8");
			
			if (n.equals("Shipping_country"))
				shipping_country=URLDecoder.decode((thisCookie.getValue()), "utf-8");
			
			if (n.equals("Shipping_zipCode"))
				shipping_zipCode=URLDecoder.decode((thisCookie.getValue()), "utf-8");
			
			if (n.equals("Shipping_addressName"))
				shipping_addressName=URLDecoder.decode((thisCookie.getValue()), "utf-8");
		}
	}
	
	
%>



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

</style>

<title>주문 정보</title>
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
            	<h1 class="display-5 fw-bold text-white">주문 정보</h1>
            	<p class="col-md-8 fs-4 text-white">Order Info</p>
        	</div>
		</div>
		
		<div class="row align-items-md-stretch alert" style="background-color: purple; color: white;">
			<div class="text-center">
				<h1>영수증</h1>
			</div>
			<div class="row justify-content-between">
				<div class="col-4" align="left">
					<strong>배송 주소</strong> <br> 성명 : <%= shipping_name %><br>
					우편번호 : <%= shipping_zipCode %><br>
					주소 : <%= shipping_addressName %> (<%= shipping_country %>)<br>
				</div>
				<div class="col-4" align="right">
					<p><em>배송일 : <%= shipping_shippingDate %></em>
				</div>
			</div>
			<div class="py-5">
				<table class="table table-hover">
				<tr>
					<th class="text-center">차량</th>
					<th class="text-center">#</th>
					<th class="text-center">가격</th>
					<th class="text-center">소계</th>
				</tr>
				
<%-- 				<%
					int sum=0;
					ArrayList<String[]> cartList=(ArrayList<String[]>) session.getAttribute("cartlist");
					if (cartList==null)
						cartList=new ArrayList<String[]>();
					for (int i=0; i<cartList.size(); i++) {
						String[] car=cartList.get(i);
						int total=Integer.parseInt(car[3]) * Integer.parseInt(car[2]);
						sum=sum + total;
				%> --%>

					<%
						int sum = 0;
  						ArrayList<Car> cartList = (ArrayList<Car>) session.getAttribute("cartlist");
  						if (cartList == null)
      						cartList = new ArrayList<Car>();
					%>
					
					<%
  						for (Car car : cartList) {
    						int total = car.getUnitPrice() * car.getQuantity();
    					sum += total; 
					%>

					<tr>
      					<td class="text-center"><%= car.getName() %></td>
      					<td class="text-center"><%= car.getQuantity() %></td>
      					<td class="text-center"><%= car.getUnitPrice() %>원</td>
      					<td class="text-center"><%= total %>원</td>
    				</tr>
					<%
  						}
					%>


<%-- 					<tr>
				<td class="text-center"><em><%= car[1] %></em></td>
				<td class="text-center"><%= car[2] %></td>
				<td class="text-center"><%= car[3] %>원</td>
				<td class="text-center"><%= total %>원</td>
				</tr> --%>
				
<%-- 				<%
					}
				%>
				 --%>
				<tr>
				<td> </td>
				<td> </td>
				<td class="text-end"><strong> </strong></td>
				<td class="text-center">
  <strong>
    <span style="color: light-black;">총액 :</span>
    <span class="text-danger"><%= sum %>원</span>
  </strong>
</td>
				</tr>
				</table>
				<a href="./shippingInfo.jsp?cartId=<%=shipping_cartId %>" class="btn btn btn-warning" role="button"> 이전 </a>
				<a href="./thankCustomer.jsp" class="btn btn-success" role="button"> 주문 완료 </a>
				<a href="./checkOutCancelled.jsp" class="btn btn-danger" role="button"> 취소 </a>
			</div>
			
		</div>	
	</div>
<%@ include file="footer.jsp" %>
</body>
</html>