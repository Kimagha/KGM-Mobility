<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="dbconn.jsp" %>
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
    int resultSet = 0;
    try {
        String sql = "UPDATE member SET password=?, name=?, gender=?, birth=?, mail=?, phone=?, address=?, number=? WHERE id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, password);
        pstmt.setString(2, name);
        pstmt.setString(3, gender);
        pstmt.setString(4, birth);
        pstmt.setString(5, mail);
        pstmt.setString(6, phone);
        pstmt.setString(7, address);
        pstmt.setString(8, number);
        pstmt.setString(9, id);
        resultSet = pstmt.executeUpdate();
        
        if (resultSet >= 1) {
			response.sendRedirect("resultMember.jsp?msg=0");
		} else {
			out.println("<h2 class='alert alert-danger'>회원정보 수정에 실패했습니다. 다시 시도해주세요.</h2>");
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
		if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
	}
%>
