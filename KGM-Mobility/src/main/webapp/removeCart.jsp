<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Car" %>
<%@ page import="dao.CarRepository" %>

<% 
	String id=request.getParameter("id");
	if (id==null || id.trim().equals("")) {
		response.sendRedirect("cars.jsp");
		return;
	}
	
/* 	CarRepository dao=CarRepository.getInstance();
	
	Car car=dao.getCarById(id);
	if(car==null) {
		response.sendRedirect("exceptionNoCarID.jsp");
	}
	 */
	ArrayList<Car> cartList=(ArrayList<Car>) session.getAttribute("cartlist");
	 
		if (cartList != null) {
			for (int i = 0; i < cartList.size(); i++) {
				Car c = cartList.get(i);
				if (c.getCarId().equals(id)) {
					cartList.remove(i);
					break;
				}
			}
		}
	 
/* 	Car goodsQnt=new Car();
	for (int i=0; i < cartList.size(); i++) {
		goodsQnt=cartList.get(i);
		if (goodsQnt.getCarId().equals(id)) {
			cartList.remove(goodsQnt);
		}
	} */
	
	response.sendRedirect("cart.jsp");
%>