<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/pretendard@1.3.8/dist/web/static/pretendard.css" rel="stylesheet">
  <link rel= "stylesheet" href="./resources/css/index_style.css">
<script type="text/javascript" src="./resources/js/validation.js"></script>
<meta charset="UTF-8">
<title>자동차 등록</title>
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
     		<h1 class="display-5 fw-bold text-white">자동차 등록</h1>
     		<p class="col-md-8 fs-4 text-white">Car Addition</p>
     	</div>
    </div>
     
    <div class="row align-items-md-stretch">
    
    	<form name="newCar" action="./processAddCar.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
    
    	<a href="logout.jsp" class="btn btn-sm btn-secondary pull right">logout</a>
    
    	<form name="newCar" action="./processAddCar.jsp" method="post">
    	
    		<div class="mb-3 row">
    			<label class="col-sm-2 text-white">자동차 코드</label>
    			<div class="col-sm-3">
    				<input type="text" id="carId" name="carId" class="form-control" placeholder="ex) CAR0000">
    			</div>
    		</div>
    		<div class="mb-3 row">
    			<label class="col-sm-2 text-white">자동차 이름</label>
    			<div class="col-sm-3">
    				<input type="text" id="name" name="name" class="form-control">
    			</div>
    		</div>
    		<div class="mb-3 row">
    			<label class="col-sm-2 text-white">가격</label>
    			<div class="col-sm-3">
    				<input type="text" id="unitPrice" name="unitPrice"	class="form-control">
    			</div>
    		</div>
    		<!-- <div class="mb-3 row">
    			<label class="col-sm-2">외부 색상</label>
    			<div class="col-sm-5">
    				<input type="checkbox" name="outColor" value="블랙"> 블랙
    				<input type="checkbox" name="outColor" value="화이트"> 화이트
    				<input type="checkbox" name="outColor" value="아이언"> 아이언
    			</div>
    		</div>
    		<div class="mb-3 row">
    			<label class="col-sm-2">내부 색상</label>
    			<div class="col-sm-5">
    				<input type="checkbox" name="inColor" value="블랙"> 블랙
    				<input type="checkbox" name="inColor" value="화이트"> 화이트
    				<input type="checkbox" name="inColor" value="브라운"> 브라운
    			</div>
    		</div> -->
    		<div class="mb-3 row">
    			<label class="col-sm-2 text-white">출고일</label>
    			<div class="col-sm-3">
    				<input type="text" id="releaseDate" name="releaseDate" class="form-control" placeholder="ex) 20250422" />
    			</div>
    		</div>
    		<!-- <div class="mb-3 row">
    			<label class="col-sm-2">구동</label>
    			<div class="col-sm-5">
    				<input type="checkbox" name="motor" value="2WD"> 2WD
    				<input type="checkbox" name="motor" value="AWD"> AWD
    			</div>
    		</div>
    		<div class="mb-3 row">
    			<label class="col-sm-2">옵션</label>
    			<div class="col-sm-5">
    				<input type="checkbox" name="option" value="하이패스"> 하이패스
    				<input type="checkbox" name="option" value="터치스크린 내비게이션"> 터치스크린 내비게이션
    				<input type="checkbox" name="option" value="애플 카플레이"> 애플 카플레이
    			</div>
    		</div> -->
    		<div class="mb-3 row">
    			<label class="col-sm-2 text-white">엔진</label>
    			<div class="col-sm-3">
    				<input type="text"  id="engine" name="engine"	class="form-control">
    			</div>
    		</div>

    		<div class="mb-3 row">
    			<label class="col-sm-2 text-white">이미지</label>
    			<div class="col-sm-5">
    				<input type="file" id="CarImage" name="CarImage" class="form-control">
    			</div>
    		</div>
    		<div class="mb-3 row">
    			<div class="col-sm-offset-2 col-sm-10">
    				<input type="button" class="btn btn-success" value="등록" onclick="CheckAddCar()">
    			</div>
    		</div>
    	</form>
    	</form>
    </div>		
</div>
<jsp:include page="footer.jsp"/>
     		
</body>
</html>