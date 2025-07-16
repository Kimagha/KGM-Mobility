<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Car" %>
<%@ page import="dao.CarRepository" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%@ page errorPage="exceptionNoCarID.jsp" %>


<%-- <%
	String id=request.getParameter("id");
	CarRepository dao=CarRepository.getInstance();
	Car car=dao.getCarById(id);
	
	if (car == null) { 		
		throw new Exception("해당 ID의 자동차 없음");
	}
%> --%>
<%
	String id = request.getParameter("id");
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = "SELECT * FROM car WHERE c_carId = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();

	if (!rs.next()) {
		throw new Exception("해당 ID의 자동차 없음");
	}

	// 데이터 추출
	String carId = rs.getString("c_carId");
	String Name = rs.getString("c_name");
	int unitPrice = rs.getInt("c_unitPrice");
	String engine = rs.getString("c_engine");
	String releaseDate = rs.getString("c_releaseDate");
	String filename = rs.getString("c_filename");

	// DB 닫기는 나중에 footer.jsp 포함 전에
%>
<!DOCTYPE html>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/pretendard@1.3.8/dist/web/static/pretendard.css" rel="stylesheet">
  <link rel= "stylesheet" href="./resources/css/index_style.css">

<meta charset="UTF-8">
<title>자동차 정보</title>

<style>
body {
    background: url('https://210.119.103.168:8080/uploads/gg551098/KGMBACK.png');
    background-size: cover;
  }
  
.option-btn {
  padding: 10px 15px;
  border: 2px solid #ccc;
  border-radius: 5px;
  background-color: white;
  cursor: pointer;
}

.option-btn.selected {
  background-color: #0d6efd;
  color: white;
  border-color: #0d6efd;
}

.motor-btn {
  padding: 10px 15px;
  border: 2px solid #ccc;
  border-radius: 5px;
  background-color: white;
  cursor: pointer;
}

.motor-btn.selected {
  background-color: #6c5ce7;
  color: white;
  border-color: #6c5ce7;
}
</style>

<script>

  const selectedOptions = new Set();
  let selectedMotor = "";
  <%-- const basePrice = <%=car.getUnitPrice()%>; --%>
  const basePrice = <%=unitPrice%>;

  function updateTotalPrice() {
    let extra = 0;
    if (selectedOptions.has("벨류업 패키지")) extra += 1200000;
    if (selectedOptions.has("12.3인치 KGM링크 내비게이션 패키지")) extra += 2000000;
    const total = basePrice + extra;
    document.getElementById("priceDisplay").innerText = total.toLocaleString() + "원";
  }

  function toggleOption(button) {
    const value = button.getAttribute("data-value");

    if (selectedOptions.has(value)) {
      selectedOptions.delete(value);
      button.classList.remove("selected");
    } else {
      // 선택사항 없음 선택 시 다른 옵션 해제
      if (value === "선택사항 없음") {
        selectedOptions.clear();
        document.querySelectorAll(".option-btn").forEach(btn => btn.classList.remove("selected"));
      } else {
        selectedOptions.delete("선택사항 없음");
        document.querySelectorAll(".option-btn").forEach(btn => {
          if (btn.getAttribute("data-value") === "선택사항 없음") {
            btn.classList.remove("selected");
          }
        });
      }

      selectedOptions.add(value);
      button.classList.add("selected");
    }

    document.getElementById("selectedOptions").value = Array.from(selectedOptions).join(",");
    updateTotalPrice();
  }

  function toggleMotor(button) {
    document.querySelectorAll(".motor-btn").forEach(btn => btn.classList.remove("selected"));
    button.classList.add("selected");

    selectedMotor = button.getAttribute("data-motor");
    document.getElementById("selectedMotor").value = selectedMotor;

    console.log("🔧 선택된 구동 방식:", selectedMotor);
  }

  function selectColor(group, element) {
    const groupSelector = group === 'out' ? '.out-color' : '.in-color';
    const boxes = document.querySelectorAll(groupSelector);
    boxes.forEach(box => box.style.border = "2px solid #ccc");
    element.style.border = "3px solid red";

    const input = element.previousElementSibling;
    if (input) input.checked = true;
  }

  function handleFormSubmit() {
    const outColor = document.querySelector('input[name="outColor"]:checked');
    const inColor = document.querySelector('input[name="inColor"]:checked');
    if (!outColor || !inColor) {
      alert("외부/내부 색상을 선택해주세요.");
      return false;
    }

    document.getElementById("selectedOutColor").value = outColor.value;
    document.getElementById("selectedInColor").value = inColor.value;

    const optionValues = Array.from(document.querySelectorAll(".option-btn.selected:not(.motor-btn)"))
      .map(btn => btn.getAttribute("data-value"));
    const selectedOptStr = optionValues.join(",");
    document.getElementById("selectedOptions").value = selectedOptStr;

    if (!selectedOptStr || selectedOptStr.trim() === "") {
      alert("옵션을 하나 이상 선택해주세요.");
      return false;
    }

    const selectedMotorValue = document.getElementById("selectedMotor").value;
    if (!selectedMotorValue || selectedMotorValue.trim() === "") {
      alert("구동 방식을 선택해주세요.");
      return false;
    }

    if (!confirm("자동차를 장바구니에 추가하시겠습니까?")) {
      return false;
    }

    return true;
  }

  window.onload = function () {
    document.querySelectorAll(".option-btn").forEach(button => {
      button.addEventListener("click", function () {
        toggleOption(this);
      });
    });

    document.querySelectorAll(".motor-btn").forEach(button => {
      button.addEventListener("click", function () {
        toggleMotor(this);
      });
    });

    updateTotalPrice();
  };
  

</script>

</head>
<body>
<div class="top-nav">
    <%@ include file= "menu.jsp" %>
    </div>

<div class="container py-4">
	
	<div class="p-5 mb-4 bg-body-tretiary rounded-3">
		<div class="container-fluid py-5">
		<h1 class="display-5 fw-bold text-white">자동차 정보</h1>
		<p class="col-md-8 fs-4 text-white">CarInfo</p>
		
		</div>
	</div>

	<div class="row align-items-md-stretch">
		<div class="col-md-5">
			<img src="https://210.119.103.168:8080/uploads/gg551098/<%=filename%>" style="width : 100%">
		</div>
		<div class="col-md-12">
			<h3 class="text-white"><b><%=Name%></b></h3>
				<p>
					<b class="text-white">자동차 코드 : </b><span class="badge text-bg-danger"><%=carId %></span>

				<p class="text-white"><b>외부색상:</b></p>
        <div style="display: flex; gap: 10px; margin-bottom: 10px;">
          <% String[] outColors = {"Black", "White", "Silver"};
             for (String color : outColors) { %>
            <label>
              <input type="radio" name="outColor" value="<%=color%>" style="display: none;">
              <div class="out-color" style="width: 40px; height: 40px; background-color: <%=color.toLowerCase()%>; border-radius: 5px; border: 2px solid #ccc; cursor: pointer;" onclick="selectColor('out', this)"></div>
            </label>
          <% } %>
        </div>

        <p class="text-white"><b>내부색상:</b></p>
        <div style="display: flex; gap: 10px; margin-bottom: 10px;">
          <% String[] inColors = {"Black", "White", "#654321"};
          for (String color : inColors) {
              String value = color.equals("#654321") ? "Brown" : color; %>
            <label>
              <input type="radio" name="inColor" value="<%=value%>" style="display: none;">
              <div class="in-color" style="width: 40px; height: 40px; background-color: <%=color.toLowerCase()%>; border-radius: 5px; border: 2px solid #ccc; cursor: pointer;" onclick="selectColor('in', this)"></div>
            </label>
          <% } %>
        </div>
			<p class="text-white"> <b>출고일</b> : <%=releaseDate %>
			<p class="text-white"><b>구동</b>:</p>
<div style="display: flex; gap: 10px;">
  <button type="button" class="motor-btn" data-motor="2WD">2WD</button>
  <button type="button" class="motor-btn" data-motor="AWD">AWD</button>
</div>
 
<p class="text-white"><b>옵션:</b><a href="https://210.119.103.168:8080/uploads/gg551098/KGMPACKAGE.pdf" target="_blank" class="btn btn-link" style="text-decoration: underline; color:#1D8B15;">
      <span class="fs-6 custom-font">패키지 설명</span>
    </a></p>

        <div style="display: flex; gap: 10px;">
          <% String[] options = {"선택사항 없음", "벨류업 패키지", "12.3인치 KGM링크 내비게이션 패키지"};
             for (String opt : options) { %>
            <button type="button" class="option-btn" data-value="<%=opt%>"><%=opt%></button>
          <% } %>
        </div>

 			<b class="text-white">엔진</b> <b class="text-white"> : </b> <b class="text-white"><%=engine %></b>
			<h4 class="text-white" id="priceDisplay"><%=String.format("%,d", unitPrice) %>원</h4>

				<p>
						
				<form id="addForm" action="./addCart.jsp?id=<%=carId %>" method="post" onsubmit="return handleFormSubmit();">
          <input type="hidden" name="selectedOutColor" id="selectedOutColor">
          <input type="hidden" name="selectedInColor" id="selectedInColor">
          <input type="hidden" name="selectedOptions" id="selectedOptions">
          <input type="hidden" name="selectedMotor" id="selectedMotor">

          <button type="submit" class="btn btn-success ">자동차 주문 &raquo;</button>
          <a href="./cart.jsp" class="btn btn-info">장바구니 &raquo;</a>
          <a href="./cars.jsp" class="btn btn-secondary">자동차 목록 &raquo;</a>
        </form>


			</div>
	</div>
	
	<div class="p-5 mb-4 bg rounded-3">
		<div class="container-fluid py-5">
		
		</div>
</div>
<%
	if (rs != null) rs.close();
	if (pstmt != null) pstmt.close();
	if (conn != null) conn.close();
%>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>