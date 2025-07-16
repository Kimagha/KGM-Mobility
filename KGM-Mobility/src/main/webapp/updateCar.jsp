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
<title>차량 수정</title>
</head>
<body>
<div class="top-nav">
    <%@ include file= "menu.jsp" %>
    </div>

<div class="container py-4">
	
	<div class="p-5 mb-4 bg rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">차량 편집</h1>
			<p class="col-md-8 fs-4">CarEditing</p>
		</div>
	</div>
	<%@ include file="dbconn.jsp" %>
	<%
		String carId=request.getParameter("id");
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="SELECT * FROM car WHERE c_id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, carId);
		rs=pstmt.executeQuery();
		if (rs.next()) {
	%>
	<div class="row align-items-md-stretch">
		<div class="col-md-5">
			<img src="https://210.119.103.168:8080/uploads/gg551098/<%=rs.getString("c_filename") %>" alt="image" style="width: 100%" />
		</div>
		<div class="col-md-7">
			<form name="newCar" action="./processUpdateCar.jsp" method="post" enctype="multipart/form-data">
				<div class="mb-3 row">
					<label class="col-sm-2">차량코드</label>
					<div class="col-sm-5">
						<input type="text" name="carId" id="carId" class="form-control" value='<%=rs.getString("c_carId") %>'>
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2">차량명</label>
					<div class="col-sm-5">
						<input type="text" name="name" id="name" class="form-control" value='<%=rs.getString("c_name") %>'>
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2">가격</label>
					<div class="col-sm-5">
						<input type="text" name="unitPrice" id="unitPrice" class="form-control" value='<%=rs.getString("c_unitPrice") %>'>
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2">출고일</label>
					<div class="col-sm-5">
						<input type="text" name="releaseDate"  class="form-control" value='<%=rs.getString("c_releaseDate") %>'>
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2">엔진</label>
					<div class="col-sm-5">
						<input type="text" name="engine"  class="form-control" value='<%=rs.getString("c_engine") %>'>
					</div>
				</div>

				<div class="mb-3 row">
					<label class="col-sm-2">이미지</label>
					<div class="col-sm-8">
						<input type="file" name="carImage"  class="form-control">
					</div>
				</div>
				<div class="mb-3 row">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-primary" value="등록">
					</div>
				</div>
			</form>
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
<jsp:include page="footer.jsp"/>
</body>
</html>