<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%@ include file="dbconn.jsp" %>
<%

	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String carId=request.getParameter("id");

	String sql="SELECT * FROM car";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	if (rs.next()) {
		sql="DELETE FROM car WHERE c_id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,carId);
		pstmt.executeUpdate();
	} else
		out.println("일치하는 차량이 없습니다.");
	
	if (rs!=null)
		rs.close();
	if (pstmt!=null)
		pstmt.close();
	if (conn!=null)
		conn.close();
	
	response.sendRedirect("editCar.jsp?edit=delete");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>