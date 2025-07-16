<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ include file="dbconn.jsp" %>

<%
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");
    String password = request.getParameter("password");

    try {
        String sql = "SELECT * FROM member WHERE id=? AND password=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        pstmt.setString(2, password);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            // 로그인 성공 시 세션에 사용자 ID를 저장
            session.setAttribute("userId", id);
            // 로그인 성공 시 books.jsp로 이동
            response.sendRedirect("cars.jsp");
        } else {
            // 인증 실패 시 로그인 페이지로 이동하며 오류 메시지 전달
            response.sendRedirect("loginMember.jsp?error=1");
        }

        rs.close();
        pstmt.close();
    } catch (SQLException e) {
        e.printStackTrace();
        // 예외 처리
    }
%>
