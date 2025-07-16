<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/pretendard@1.3.8/dist/web/static/pretendard.css" rel="stylesheet">
  <link rel= "stylesheet" href="./resources/css/index_style.css">
<meta charset="UTF-8">
<title>차량 편집</title>

<style>
  body {
    background: url('https://210.119.103.168:8080/uploads/gg551098/KGMBACK.png');
    background-size: cover;
  }
</style>

<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 차량를 삭제합니다!!")==true)
			location.href="./deleteCar.jsp?id=" + id;
		else
			return;
	}
</script>

</head>

<%
	String edit=request.getParameter("edit");
%>

<body>
<div class="top-nav">
    <%@ include file= "menu.jsp" %>
    </div>
    
<div class="container py-4">
	
	<div class="p-5 mb-4 bg rounded-3">
		<div class="container-fluid py-5 text-white">
			<h1 class="display-5 fw-bold ">차량 편집</h1>
			<p class="col-md-8 fs-4">CarEditing</p>
		</div>
	</div>
	<%@ include file="dbconn.jsp" %>
	<div class="row align-items-md-stretch text-center">
	<%
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="SELECT * FROM car";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while (rs.next()) {
	%>
	<div class="col-md-4">
		<div class="h-100 p-2 round-3 text-white">
			<img src="https://210.119.103.168:8080/uploads/gg551098/<%=rs.getString("c_filename") %>" style="width : 100%; height :300px;" />
			
			<p><h5><b><%=rs.getString("c_name") %></b></h5>
			<p> <%=rs.getString("c_engine") %>
			<%-- <p> <%=rs.getString("c_unitPrice") %>원 --%>
			<p><%=rs.getString("c_releaseDate") %>
			<p><%= String.format("%,d", rs.getInt("c_unitPrice")) %>원</p>
			

			
			<p> <%
					if (edit.equals("update")) {
				%>
			<a href="./updateCar.jsp?id=<%=rs.getString("c_id")%>" class="btn btn-success" role="button">수정 &raquo;></a>
			
			<%
				} else if (edit.equals("delete")) {
			%>
			<a href="#" onclick="deleteConfirm('<%=rs.getString("c_id") %>')" class="btn btn-danger" role="button">삭제 &raquo;></a>
			
			<%
				}
			%>
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
	</div>
</div>
	<%@ include file="footer.jsp" %>

</body>
</html>