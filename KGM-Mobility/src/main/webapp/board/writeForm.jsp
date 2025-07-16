<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String name = (String) request.getAttribute("name");
	
%>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/pretendard@1.3.8/dist/web/static/pretendard.css" rel="stylesheet">
  <link rel= "stylesheet" href="./resources/css/index_style.css">
<title>Board</title>
<style>
body {
    background: url('https://210.119.103.168:8080/uploads/gg551098/KGMBACK.png');
    background-size: cover;
  }
</style>
</head>
<script type="text/javascript">
	function checkForm() {
		if (!document.newWrite.name.value) {
			alert("성명을 입력하세요.");
			return false;
		}
		if (!document.newWrite.subject.value) {
			alert("제목을 입력하세요.");
			return false;
		}
		if (!document.newWrite.content.value) {
			alert("내용을 입력하세요.");
			return false;
		}		
	}
</script>
<body>
<div class="top-nav">
	<jsp:include page="../menu.jsp" />
</div>

<div class="p-5 mb-4 bg rounded-3">
	<div class="jumbotron">
		<div class="container">
			<h1 class="p-5 mb-4 display-3 text-white">글쓰기</h1>
		</div>
	</div>
</div>

	<div class="container">

		<form name="newWrite" action="./BoardWriteAction.do"
			class="form-horizontal" method="post" onsubmit="return checkForm()">
			<%-- <input name="id" type="hidden" class="form-control"
				value="${sessionId}"> --%>
				<input name="id" type="hidden" class="form-control" value="${sessionScope.userId}">
			<div class="form-group row">
				<label class="col-sm-2 control-label text-white" >성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" value="<%=name %>"
						placeholder="name">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label text-white" >제목</label>
				<div class="col-sm-5">

					<input name="subject" type="text" class="form-control"
						placeholder="subject">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label text-white" >내용</label>
				<div class="col-sm-8">
					<textarea name="content" cols="50" rows="5" class="form-control"
						placeholder="content"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
				 <input type="submit" class="btn btn-success " value="등록 ">				
					 <button type="button" class="btn btn-danger" onclick="history.back()">취소</button>
				</div>
			</div>
		</form>
		<hr>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>



