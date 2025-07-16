<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/pretendard@1.3.8/dist/web/static/pretendard.css" rel="stylesheet">
  <link rel= "stylesheet" href="./resources/css/index_style.css">
<meta charset="UTF-8">
<title>페이지 오류</title>
</head>
<body>

<div class="top-nav">
    <%@ include file= "menu.jsp" %>
    </div>

	<%-- <jsp:include page="menu.jsp"/> --%>
	<div class="p-5 mb-4 bg rounded-3">
		<div class="container-fluid py-5">
		</div>
		</div>
	<div class="jumbotron">
		<div class="container">
			<h2 class="alert alert-danger">요청하신 페이지를 찾을 수 없습니다.</h2>
		</div>
	</div>
	<div class="container">
		<p><%=request.getRequestURL() %></p>
		<p><a href="index.jsp" class="btn btn-secondary"> 홈으로&raquo;</a>
	</div>
	<div class="p-5 mb-4 bg rounded-3">
		<div class="container-fluid py-5">
		
		</div>
</div>

	<%@ include file="footer.jsp" %>
</body>
</html>