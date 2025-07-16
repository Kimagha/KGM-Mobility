<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ include file="dbconn.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
    <title>회원가입 처리</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    String year = request.getParameter("birthyy");
    String month = request.getParameterValues("birthmm")[0];
    String day = request.getParameter("birthdd");
    String birth = year + "/" + month + "/" + day;
    String mail1 = request.getParameter("mail1");
    String mail2 = request.getParameterValues("mail2")[0];
    String mail = mail1 + "@" + mail2;
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String number = request.getParameter("number");
    
    PreparedStatement pstmt = null;

    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String registDay = dateFormat.format(new Date());

    String sql = "INSERT INTO member(id, password, name, gender, birth, mail, phone, address, registDay, number) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    pstmt=conn.prepareStatement(sql);
    pstmt.setString(1, id);
    pstmt.setString(2, password);
    pstmt.setString(3, name);
    pstmt.setString(4, gender);
    pstmt.setString(5, birth);
    pstmt.setString(6, mail);
    pstmt.setString(7, phone);
    pstmt.setString(8, address);
    pstmt.setString(9, registDay);
    pstmt.setString(10, number);

    int resultSet = pstmt.executeUpdate();

    if (resultSet >= 1) {
        response.sendRedirect("resultMember2.jsp?msg=1");
    } else {
        out.println("<h2 class='alert alert-danger'>회원가입에 실패했습니다. 다시 시도해주세요.</h2>");
    }

    if (pstmt != null) pstmt.close();
    if (conn != null) conn.close();
    
    
%>