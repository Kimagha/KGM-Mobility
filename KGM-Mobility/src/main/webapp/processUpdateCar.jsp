<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<%
    request.setCharacterEncoding("UTF-8");

    String uploadpath;
    if(System.getProperty("os.name").toLowerCase().startsWith("windows")) uploadpath = "C://uploads";
    else uploadpath = System.getProperty("catalina.base") + "/webapps/uploads/gg551098";
    MultipartRequest multi = new MultipartRequest(request, uploadpath, 5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());

    String carId = multi.getParameter("carId");
    String name = multi.getParameter("name");
    String unitPrice = multi.getParameter("unitPrice");
    String releaseDate = multi.getParameter("releaseDate");
    String engine = multi.getParameter("engine");

    Enumeration files = multi.getFileNames();
    String fname = (String) files.nextElement();
    String fileName = multi.getFilesystemName(fname);

    int price = unitPrice.isEmpty() ? 0 : Integer.parseInt(unitPrice);

    // 디버그 출력
    System.out.println("carId: " + carId);
    System.out.println("name: " + name);
    System.out.println("unitPrice: " + unitPrice);
    System.out.println("releaseDate: " + releaseDate);
    System.out.println("engine: " + engine);
    System.out.println("fileName: " + fileName);

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        String sql = "SELECT * FROM car WHERE c_carId=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, carId);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            if (fileName != null) {
                sql = "UPDATE car SET c_name=?, c_unitPrice=?, c_releaseDate=?, c_engine=?, c_filename=? WHERE c_carId=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, name);
                pstmt.setInt(2, price);
                pstmt.setString(3, releaseDate);
                pstmt.setString(4, engine);
                pstmt.setString(5, fileName);
                pstmt.setString(6, carId);

            } else {
                sql = "UPDATE car SET c_name=?, c_unitPrice=?, c_releaseDate=?, c_engine=? WHERE c_carId=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, name);
                pstmt.setInt(2, price);
                pstmt.setString(3, releaseDate);
                pstmt.setString(4, engine);
                pstmt.setString(5, carId);

            }
            int rowsUpdated = pstmt.executeUpdate();
            System.out.println("Rows updated: " + rowsUpdated);
        } else {
            System.out.println("No car found with carId: " + carId);
        }
    } catch (SQLException e) {
        e.printStackTrace(System.out);
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }

    response.sendRedirect("editCar.jsp?edit=update");
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
