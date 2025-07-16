<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.BoardDTO"%>
<%
	/* session.setAttribute("sessionId","user"); */
	String userId = (String) session.getAttribute("userId");
	List boardList = (List) request.getAttribute("boardlist");
	int total_record = ((Integer) request.getAttribute("total_record")).intValue();
	int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
	int total_page = ((Integer) request.getAttribute("total_page")).intValue();
%>
<html>
<head>
<!-- <link rel="stylesheet" href="./resources/css/bootstrap.min.css" /> -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/pretendard@1.3.8/dist/web/static/pretendard.css" rel="stylesheet">
  <link rel= "stylesheet" href="./resources/css/index_style.css">
<title>Board</title>
<style>
body {
    background: url('https://210.119.103.168:8080/uploads/gg551098/KGMBACK.png');
    background-size: cover;
  }
  
  table.table,
table.table th,
table.table td {
  background-color: transparent !important;
  color: white;
  border: 1px solid rgba(255, 255, 255, 0.2); /* 줄 표시 */
}
</style>
<script type="text/javascript">
	function checkForm() {	
		var userId = "<%=userId%>";
		if (userId == null || userId == "null" || userId.trim() == "") {
			alert("로그인 해주세요.");
			return false;
		}
		/* if (${sessionId==null}) {
			alert("로그인 해주세요.");
			return false;
		} */

		location.href = "./BoardWriteForm.do?id=<%=userId%>"
	}
</script>
</head>
<body>
<div class="top-nav">
	<jsp:include page="../menu.jsp" />
</div>

<div class="p-5 mb-4 bg rounded-3">
	<div class="jumbotron">
		<div class="container">
			<h1 class="p-5 mb-4 display-3 text-white">문의 게시판</h1>
		</div>
	</div>
</div>

	<div class="container">
		<form action="<c:url value="./BoardListAction.do"/>" method="post">
			<div>
				<div class="text-right">
					<span class="badge badge-success text-white">전체 <%=total_record%>건	</span>
				</div>
			</div>
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<tr>
						<th class="text-white">번호</th>
						<th class="text-white">제목</th>
						<th class="text-white">작성일</th>
						<th class="text-white">조회</th>
						<th class="text-white">글쓴이</th>
					</tr>
					<%
						for (int j = 0; j < boardList.size(); j++) {
							BoardDTO notice = (BoardDTO) boardList.get(j);
					%>
					<tr>
						<td class="text-white"><%=notice.getNum()%></td>
						<td><a href="./BoardViewAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>" style="color:#B2EBF4"><%=notice.getSubject()%></a></td>
						<td class="text-white"><%=notice.getRegist_day()%></td>
						<td class="text-white"><%=notice.getHit()%></td>
						<td class="text-white"><%=notice.getName()%></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			<div align="center">
				<c:set var="pageNum" value="<%=pageNum%>" />
				<c:forEach var="i" begin="1" end="<%=total_page%>">
					<a href="<c:url value="./BoardListAction.do?pageNum=${i}" /> ">
						<c:choose>
							<c:when test="${pageNum==i}">
								<font color='FFFFFF'><b> [${i}]</b></font>
							</c:when>
							<c:otherwise>
								<font color='FFFFFF'> [${i}]</font>

							</c:otherwise>
						</c:choose>
					</a>
				</c:forEach>
			</div>
			<div align="left">
				<table>
					<tr>
						<td width="100%" align="left">&nbsp;&nbsp; 
						<select name="items" class="txt">
								<option value="subject">제목에서</option>
								<option value="content">본문에서</option>
								<option value="name">글쓴이에서</option>
						</select> <input name="text" type="text" /> <input type="submit" id="btnAdd" class="btn btn-primary" value="검색 " />
						</td>
						<td width="100%" align="right">
							<input type="submit" onclick="checkForm(); return false;" class="btn btn-primary" value= "글쓰기"/>
						</td>
					</tr>
				</table>
			</div>
		</form>
		<hr>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>





