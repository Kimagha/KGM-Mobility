<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Car" %>
<%@ page import="dao.CarRepository" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
	//String filename="";
	//String realFolder = System.getProperty("catalina.base") + "/webapps/uploads/gg551098";
	//int maxSize = 5 * 1024 * 1024;
	//String encType = "utf-8";
	//MultipartRequest multi = new MultipartRequest(request, realFolder, 5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
	
	
	
	String uploadpath;
	if(System.getProperty("os.name").toLowerCase().startsWith("windows")) uploadpath = "C://uploads";	// 윈도우 업로드경로
	else uploadpath = System.getProperty("catalina.base") + "/webapps/uploads/gg551098";	// 우분투 업로드경로
	MultipartRequest multi = new MultipartRequest(request, uploadpath, 5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
	
	
	
	
	String carId=multi.getParameter("carId");
	String name=multi.getParameter("name");
	String unitPrice=multi.getParameter("unitPrice");
	String[] outColor=multi.getParameterValues("outColor");
	String[] inColor=multi.getParameterValues("inColor");
	String releaseDate=multi.getParameter("releaseDate");
	String[] motor=multi.getParameterValues("motor");
	String[] option=multi.getParameterValues("option");
	String engine=multi.getParameter("engine");

	
	Enumeration files=multi.getFileNames();
	String fname=(String) files.nextElement();
	String fileName=multi.getFilesystemName(fname);
	
	Integer price;
	
	if (unitPrice.isEmpty())
		price=0;
	else
		price=Integer.valueOf(unitPrice);
	
	long stock;
	
	/* if (unitsInStock.isEmpty())
		stock=0;
	else
		stock=Long.valueOf(unitsInStock); */
		
	PreparedStatement pstmt=null;
		
	String sql="INSERT INTO car(c_carId, c_name, c_unitPrice, c_releaseDate, c_engine, c_filename) VALUES(?,?,?,?,?,?)";	
	
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, carId);
	pstmt.setString(2, name);
	pstmt.setInt(3, price);
	pstmt.setString(4, releaseDate);
	pstmt.setString(5, engine);
	pstmt.setString(6, fileName);

	pstmt.executeUpdate();
	
	if (pstmt!=null)
		pstmt.close();
	if (conn!=null)
		conn.close();
	
/* 	CarRepository dao=CarRepository.getInstance();
	
	Car newCar=new Car();
	newCar.setCarId(carId);
	newCar.setName(name);
	newCar.setUnitPrice(price);
	newCar.setOutColor(outColor);
	newCar.setInColor(inColor);
	newCar.setReleaseDate(releaseDate);
	newCar.setMotor(motor);
	newCar.setOption(option);
	newCar.setEngine(engine);
	newCar.setFilename(fileName);
	
	dao.addCar(newCar); */
	
	response.sendRedirect("cars.jsp");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>