<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <title>KGM Mobility</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/pretendard@1.3.8/dist/web/static/pretendard.css" rel="stylesheet">
  <link rel= "stylesheet" href="./resources/css/index_style.css">
</head>

<body>
  <!-- 상단 내비게이션 -->
  <div class="top-nav">
    <%@ include file= "menu.jsp" %>
    </div>

  <!-- 비디오 배경 -->
  <div class="container py-4">
  
    <video class="video-bg" autoplay muted loop>
       <source src="https://210.119.103.168:8080/uploads/gg551098/KGM.mp4" type="video/mp4"> 
    <!-- <source src="resources/video/KGM.mp4" type="video/mp4"> -->
    </video>
    
    <div class="main-text">
      <p>
    <a href="resources/pdf/KGMPRICEINFO.pdf" target="_blank" style="text-decoration: none; color: white;">
      가격정보 >
    </a>
    &nbsp;&nbsp;&nbsp;
    <a href="./car.jsp?id=CAR0001" style="text-decoration: none; color: white;">
      자세히 보기 >
    </a>
  </p>
    </div>
  </div>
  
  <!-- 그라데이션 -->
  <div class="gradient-fade-purple"></div>

  <!-- 모델 카드 영역 -->
  <div class="model-wrapper">
    <div class="model-header-wrapper">
      <div class="model-header">
        <p class="subtitle">KGM이 제안하는 대표 모델을 소개합니다</p>
        <h2 class="title">New Insight</h2>
      </div>
      <div class="model-more">
        <a href="./cars.jsp" class="more-link">다른 모델 더 보기 &gt;</a>
      </div>
    </div>

    <div class="model-cards">
      <!-- 카드 1 -->
      <div class="model-card">
      <a href="./car.jsp?id=CAR0001">
      	 <img class="img" src="https://210.119.103.168:8080/uploads/gg551098/CAR0001.png"  alt="토레스">
      </a>
        <div class="model-info">
          <p><strong>토레스</strong><br>온라인 스토어 전용 모델,<br>블랙엣지 스타일링 기본 장착</p>
          
        </div>
      </div>

      <!-- 카드 2 -->
      <div class="model-card">
      <a href="./car.jsp?id=CAR0002">
        <img class="img" src="https://210.119.103.168:8080/uploads/gg551098/CAR0002.png"  alt="엑티언">
      </a>
        <div class="model-info">
          <p><strong>엑티언</strong><br>온라인 스토어 전용 모델,<br>블랙 & 다이내믹 패키지 기본 장착</p>
          
        </div>
      </div>

      <!-- 카드 3 -->
      <div class="model-card">
      <a href="./car.jsp?id=CAR0003">
        <img class="img" src="https://210.119.103.168:8080/uploads/gg551098/CAR0003.png"  alt="티볼리">
      </a>
        <div class="model-info">
          <p><strong>티볼리</strong><br>온라인 스토어 전용 모델,<br>밸류업 & Navi. 패키지 기본 장착</p>
        </div>
      </div>
    </div>
  </div>
  <%@ include file= "footer.jsp" %>
</body>
</html>
