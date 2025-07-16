<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" >
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>Login</title>
<style>
body {
    background: url('https://210.119.103.168:8080/uploads/gg551098/KGMLOGINBACK.png');
    background-size: cover;
  }
</style>
</head>
<body>

<div class="top-nav">
    <%@ include file= "menu.jsp" %>
    </div>

<div class="container py-4">
	
	<div class="p-5 mb-4 bg">
   		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">관리자 로그인</h1>
			<p class="col-md-8 fs-4">Login</p>
		</div>
	</div>
	
	<div class="row align-items-md-stretch   text-center">
		<div class="row justify-content-center align-items-center">
			<div class="h-100 p-5 col-md-6">
				<h3>Please sign in</h3>
				
				<%
					String error=request.getParameter("error");
					if(error!=null) {
						out.println("<div class='alert alert-danger'>");
						out.println("아이디와 비밀번호를 확인해 주세요.");
						out.println("</div>");
					}
				%>
				<form class="form-signin" action="j_security_check" method="post">
					<div class="form-floating mb-3 row">
						<input type="text" class="form-control" name='j_username' required autofocus>
						<label for="floatingInput">ID</label>
					</div>
					<div class="form-floating mb-3 row">
						<input type="password" class="form-control" name='j_password'>
						<label for="floatingInput">Password</label>
					</div>
					<button class="btn btn-lg btn-success" type="submit">로그인</button>
				</form>
			</div>
		</div>
	</div>
	
	<div class="p-5 mb-4 bg rounded-3">
		<div class="container-fluid py-5">
		
		</div>
</div>

</div>
<%@ include file="footer.jsp" %>
</body>
</html>