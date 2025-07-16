<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Car" %>
<%@ page import="dao.CarRepository" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<%
	String id=request.getParameter("id");
	String selectedOutColor = request.getParameter("selectedOutColor");
	String selectedInColor = request.getParameter("selectedInColor");
	String selectedOptions = request.getParameter("selectedOptions");
	String selectedMotor = request.getParameter("selectedMotor");
	
	/* System.out.println("📥 받은 옵션값: [" + selectedOptions + "]"); */
	
	if(id==null || id.trim().equals("")) {
		response.sendRedirect("cars.jsp");
		return;
	}
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "SELECT * FROM car WHERE c_carId = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();

	if (!rs.next()) {
		response.sendRedirect("exceptionNoCarId.jsp");
		return;
	}
	
/* 	CarRepository dao=CarRepository.getInstance();	
	Car originalCar = dao.getCarById(id);
	
	if (originalCar == null) {
		response.sendRedirect("exceptionNoCarId.jsp");
		return;
	} */

	// ✅ 객체 복사
	Car goods = new Car();
	
	goods.setCarId(id);
	goods.setName(rs.getString("c_name"));
	goods.setUnitPrice(rs.getInt("c_unitPrice"));
	goods.setEngine(rs.getString("c_engine"));
	goods.setReleaseDate(rs.getString("c_releaseDate"));
	goods.setFilename(rs.getString("c_filename"));
	
	goods.setSelectedOutColor(selectedOutColor);
	goods.setSelectedInColor(selectedInColor);
	goods.setSelectedOptions(selectedOptions);
	goods.setSelectedMotor(selectedMotor);

	// 🔧 옵션 가격 추가 계산
	int extraPrice = 0;
	if (selectedOptions != null) {
		if (selectedOptions.contains("벨류업 패키지")) extraPrice += 1200000;
		if (selectedOptions.contains("12.3인치 KGM링크 내비게이션 패키지")) extraPrice += 2000000;
	}
	goods.setUnitPrice(goods.getUnitPrice() + extraPrice);

	ArrayList<Car> list=(ArrayList<Car>) session.getAttribute("cartlist");
	if(list==null) {
		list=new ArrayList<Car>();
		session.setAttribute("cartlist", list);
	}

	boolean alreadyInCart = false;
	for (int i = 0; i < list.size(); i++) {
		Car existing = list.get(i);
		if (existing.getCarId().equals(id) &&
		    selectedOutColor != null && selectedOutColor.equals(existing.getSelectedOutColor()) &&
		    selectedInColor != null && selectedInColor.equals(existing.getSelectedInColor()) &&
			selectedOptions != null && selectedOptions.equals(existing.getSelectedOptions()) &&
			selectedMotor != null && selectedMotor.equals(existing.getSelectedMotor())){
			
			existing.setQuantity(existing.getQuantity() + 1);
			alreadyInCart = true;
			break;
		}
	}

	if (!alreadyInCart) {
	    goods.setQuantity(1);
	    list.add(goods);
	}
	
	// 자원 해제
		if (rs != null) rs.close();
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();

	response.sendRedirect("car.jsp?id=" +id);

/* 	Enumeration<String> paramNames = request.getParameterNames();
	while (paramNames.hasMoreElements()) {
	    String name = paramNames.nextElement();
	    System.out.println("🔍 파라미터: " + name + " = " + request.getParameter(name));
	} */
%>