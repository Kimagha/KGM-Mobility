<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
    
<%
    request.setCharacterEncoding("UTF-8");

    String cartId = (String) session.getAttribute("cartId");
    String name = request.getParameter("name");
    String shippingDate = request.getParameter("shippingDate");
    String country = request.getParameter("country");
    String zipCode = request.getParameter("zipCode");
    String addressName = request.getParameter("addressName");

    Cookie cartIdCookie = new Cookie("Shipping_cartId", URLEncoder.encode(cartId, "utf-8"));
    Cookie nameCookie = new Cookie("Shipping_name", URLEncoder.encode(name, "utf-8"));
    Cookie shippingDateCookie = new Cookie("Shipping_shippingDate", URLEncoder.encode(shippingDate, "utf-8"));
    Cookie countryCookie = new Cookie("Shipping_country", URLEncoder.encode(country, "utf-8"));
    Cookie zipCodeCookie = new Cookie("Shipping_zipCode", URLEncoder.encode(zipCode, "utf-8"));
    Cookie addressNameCookie = new Cookie("Shipping_addressName", URLEncoder.encode(addressName, "utf-8"));

    cartIdCookie.setMaxAge(24 * 60 * 60);
    nameCookie.setMaxAge(24 * 60 * 60);
    shippingDateCookie.setMaxAge(24 * 60 * 60);
    countryCookie.setMaxAge(24 * 60 * 60);
    zipCodeCookie.setMaxAge(24 * 60 * 60);
    addressNameCookie.setMaxAge(24 * 60 * 60);

    response.addCookie(cartIdCookie);
    response.addCookie(nameCookie);
    response.addCookie(shippingDateCookie);
    response.addCookie(countryCookie);
    response.addCookie(zipCodeCookie);
    response.addCookie(addressNameCookie);

    response.sendRedirect("orderConfirmation.jsp");
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
