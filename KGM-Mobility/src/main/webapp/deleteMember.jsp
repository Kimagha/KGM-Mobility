<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%@ include file="dbconn.jsp" %>
<%
    String userId = (String) session.getAttribute("userId");

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        String sql = "SELECT * FROM member WHERE id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            sql = "DELETE FROM member WHERE id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            int rowsDeleted = pstmt.executeUpdate();

            if (rowsDeleted > 0) {
            	session.invalidate();
                response.sendRedirect("resultMember.jsp");
            } else {
                out.println("<h2 class='alert alert-danger'>회원 탈퇴에 실패했습니다. 다시 시도해주세요.</h2>");
            }
        } else {
            out.println("<h2 class='alert alert-danger'>일치하는 회원이 없습니다.</h2>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
</body>
</html>
