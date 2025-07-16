<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">

<style>

	.custom-btn {
        background-color: lightblue; 
        color: #fff;
        border-radius: 20px;
        padding: 10px 20px;
        font-size: 16px;
        margin-right: 10px;
        transition: background-color 0.3s ease, box-shadow 0.3s ease;
    }
    .custom-btn:hover {
    	color: #fff;
        background-color: #4169E1; /* 진한 블루 */
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
    }
    
    .custom-bg-half {
            background: linear-gradient(to right, #C8E6FF 50%, #DAF0FF 50%);
            padding: 5rem;
            border-radius: .3rem;
            margin-bottom: 1rem;
        }

</style>

<title>도서 목록</title>
</head>
<body>

<c:if test="${param.success != null}">
    <script>
        alert('성공적으로 ${param.success} 계좌를 개설하였습니다.');
    </script>
</c:if>

<div class="container py-4">
	<%@ include file="bankMenu.jsp" %>
	
	<div class="container-fluid py-5">
  <div class="row">
    
    <!-- 왼쪽: YouTube 영상 -->
    <div class="col-md-6 text-center">
      <iframe width="560" height="315" src="https://www.youtube.com/embed/vBmj8lpZPhI?si=kVDFSUVV8L8X7zXp" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
    </div>
    
     <!-- 오른쪽: 이미지 Carousel -->
    <div class="col-md-6">
  <div id="imageCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="2000">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="https://210.119.103.168:8080/uploads/gg551098/D_nhslide1.png" class="d-block w-100" style="height: 300px;" />
      </div>
      <div class="carousel-item">
        <img src="https://210.119.103.168:8080/uploads/gg551098/D_nhslide2.png" class="d-block w-100" style="height: 300px;" />
      </div>
      <div class="carousel-item">
        <img src="https://210.119.103.168:8080/uploads/gg551098/D_nhslide3.png" class="d-block w-100" style="height: 300px;" />
      </div>
      <div class="carousel-item">
        <img src="https://210.119.103.168:8080/uploads/gg551098/D_nhslide4.png" class="d-block w-100" style="height: 300px;" />
      </div>
      <div class="carousel-item">
        <img src="https://210.119.103.168:8080/uploads/gg551098/D_nhslide5.png" class="d-block w-100" style="height: 300px;" />
      </div>
    </div>

    <!-- 좌우 버튼 정상 작동 -->
    <button class="carousel-control-prev" type="button" data-bs-target="#imageCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#imageCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
</div>
    
  </div>
</div>
</div>

 <div class="row text-center">
 <div class="col-md-12">
	<img src="https://210.119.103.168:8080/uploads/gg551098/D_nhmiddle1.png" style="width : 100%; height :100%;"/>
 </div>
 </div>
 
  <div class="row align-items-md-stretch   text-center">
 <div class="col-md-12">
 <div class="h-100 p-5">
	<img src="https://210.119.103.168:8080/uploads/gg551098/D_nhmiddle2.png" style="width : 100%; height :100%;"/>
 </div>
 </div>
 </div>
 
   <div class="row text-center">
 <div class="col-md-12">
	<img src="https://210.119.103.168:8080/uploads/gg551098/D_nhfoot.png" style="width : 100%; height :100%;"/>
  </div>
 </div>
	
	




</body>
</html>