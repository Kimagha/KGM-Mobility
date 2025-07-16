<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<title>회원 정보</title>
</head>
<body>
<div class="container py-4">
	<jsp:include page="./bankMenu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원정보</h1>
		</div>
	</div>
	
	</div>

	<div class="container" align="center">
		<%
			String msg = request.getParameter("msg");

			if (msg != null) {
				if (msg.equals("0"))
					out.println(" <h2 class='alert alert-danger'>회원정보가 수정되었습니다.</h2>");
				else if (msg.equals("1"))
					out.println(" <h2 class='alert alert-danger'>회원가입을 축하드립니다.</h2>");
				else if (msg.equals("2")) {
					String loginId = (String) session.getAttribute("userId");
					out.println(" <h2 class='alert alert-danger'>" + loginId + "님 환영합니다</h2>");
				}				
			} else {
				out.println("<h2 class='alert alert-danger'>회원정보가 삭제되었습니다.</h2>");
			}
		%>
	</div>	
</body>
</html>