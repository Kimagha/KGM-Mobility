<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Car"%>
<%@ page import="dao.CarRepository" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/pretendard@1.3.8/dist/web/static/pretendard.css" rel="stylesheet">
  <link rel= "stylesheet" href="./resources/css/index_style.css">
<meta charset="UTF-8">
<title>자동차 목록</title>

<style>
  body {
    background: url('https://210.119.103.168:8080/uploads/gg551098/KGMBACK.png');
    background-size: cover;
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
		
		</div>
	</div>
	<%@include file="dbconn.jsp" %>

<%
	CarRepository dao=CarRepository.getInstance();
	ArrayList<Car> listOfCars=dao.getAllCars();
%>


<div class="row align-items-md-stretch text-center">
<%-- 	<%
		for (int i=0; i < listOfCars.size(); i++){
			Car car=listOfCars.get(i);
			
	%> --%>
		<%
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="SELECT * FROM car";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while (rs.next()) {
	%>	
	<div class="col-md-4">
		<div class="h-100 p-2">
		 <img src="https://210.119.103.168:8080/uploads/gg551098/<%=rs.getString("c_filename") %>" style="width : 100%; height :300px;" />
			<h5 class="text-white"><b><%=rs.getString("c_name") %></b></h5>
			<p class="text-white"> <%=rs.getString("c_engine") %>		
			<p class="text-white"><%=rs.getString("c_releaseDate") %>

			<p class="text-white"><%= String.format("%,d", rs.getInt("c_unitPrice")) %>원</p>

<%-- 			<p class="text-white"> <%=String.format("%,d", car.getUnitPrice()) %>원 --%>
			<p class="text-white"> <a href="./car.jsp?id=<%=rs.getString("c_carId") %>"
			class="btn btn-light" role="button"> 상세 정보 &raquo;</a>
		</div>
	</div>
		<% 
		}
		if (rs!=null)
			rs.close();
		if (pstmt!=null)
			pstmt.close();
		if (conn!=null)
			conn.close();
	%>
	
<%-- 	<% 
	}
	%> --%>
</div>

<div class="p-5 mb-4 bg rounded-3">
		<div class="container-fluid py-5">
		
		</div>
</div>

</div>
<%@ include file="footer.jsp" %>
</body>
</html>