<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Car" %>
<%@ page import="dao.CarRepository" %>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" href="./resources/css/bootstrap.min.css" /> -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/pretendard@1.3.8/dist/web/static/pretendard.css" rel="stylesheet">
  <link rel= "stylesheet" href="./resources/css/index_style.css">

<%-- <%
	String cartId=session.getId();
%> --%>
<%
    // 세션에 cartId 저장
    session.setAttribute("cartId", session.getId());
%>

<meta charset="UTF-8">
<title>장바구니</title>

<style>
body {
    background: url('https://210.119.103.168:8080/uploads/gg551098/KGMBACK.png');
    background-size: cover;
  }
  
.table-transparent th,
  .table-transparent td {
    background-color: rgba(255, 255, 255, 0.05) !important;
    border: 1px solid rgba(255, 255, 255, 0.2);
    color: white;
  }
</style>
</head>
<body>

<div class="top-nav">
    <%@ include file= "menu.jsp" %>
    </div>

<div class="container py-4">
	
	<div class="p-5 mb-4 bg rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold text-white">장바구니</h1>
			<p class="col-md-8 fs-4 text-white">Cart</p>
		</div>
	</div>
	
	<div class="row align-items-md-stretch">
		<div class="row">
			<table width="100%">
			<tr>
			<td align="left"><a href="./deleteCart.jsp?cartId=<%= session.getId() %>" class="btn btn-danger">삭제하기</a></td>
			<td align="right"><a href="./shippingInfo.jsp?cartId=<%= session.getId() %>" class="btn btn-success">주문하기</a></td></tr>
			</table>
		</div>
		<div style="padding-top: 50px">
		<table class="table table-hover table-transparent">
		<tr>
			<th class="text-white">차량</th>
			<th class="text-white">가격</th>
			<th class="text-white">수량</th>
			<th class="text-white">소계</th>
			<th class="text-white">선택 삭제</th>
		</tr>
		<%
			int sum=0;
			ArrayList<Car> cartList=(ArrayList<Car>) session.getAttribute("cartlist");
			if(cartList==null)
				cartList=new ArrayList<Car>();
			for(int i=0; i < cartList.size(); i++) {
				Car car=cartList.get(i);
				int total=car.getUnitPrice() * car.getQuantity();
				sum=sum + total;
			
		%>
		<tr>
		<%-- <td><%=car.getCarId()%> - <%=car.getName()%> (<%=car.getSelectedOutColor()%>)</td> --%>
		<%-- <td><%=car.getCarId()%> - <%=car.getName()%>
  			(<%=car.getSelectedOutColor() != null ? car.getSelectedOutColor() : "색상없음" %>)
		</td> --%>
		
		<td class="text-white">
	<%=car.getCarId()%> - <%=car.getName()%>
	(<%=car.getSelectedOutColor() != null ? car.getSelectedOutColor() : "외부색상 없음" %> /
	 <%=car.getSelectedInColor() != null ? car.getSelectedInColor() : "내부색상 없음" %>)<br>

	<small>
  옵션:
  <%
    String selected = car.getSelectedOptions();
    if (selected != null && !selected.trim().equals("")) {
      String[] optArray = selected.split(",");
      for (int j = 0; j < optArray.length; j++) {
        out.print(optArray[j].trim());
        if (j < optArray.length - 1) out.print(", ");
      }
    } else {
      out.print("없음");
    }
  %>
  <br>
  구동 방식: <%= car.getSelectedMotor() != null && !car.getSelectedMotor().isEmpty() ? car.getSelectedMotor() : "없음" %>
</small>
</td>
		
		<td class="text-white"><%=String.format("%,d", car.getUnitPrice()) %> </td>
		<td class="text-white"><%=car.getQuantity() %> </td>
		<td class="text-white"><%=String.format("%,d", total )%></td>
		<td><a href="./removeCart.jsp?id=<%=car.getCarId() %>" class="badge text-danger">삭제</a></td>
		</tr>
		<%
			}
		%>
		<tr>
			<th></th>
			<th></th>
			<th class="text-white">총액</th>
			<th class="text-white"><%=String.format("%,d", sum )%></th>
			<th></th>
		</tr>
		</table>
		<a href="./cars.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
		</div>
	</div>
	
	
</div>
<jsp:include page="footer.jsp" />
</body>
</html>