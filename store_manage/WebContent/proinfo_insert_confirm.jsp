<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	String goods_cd = request.getParameter("goods_cd");
	String goods_nm = request.getParameter("goods_nm");
	String goods_price = request.getParameter("goods_price");
	String cost = request.getParameter("cost");
	String sysdate = request.getParameter("sysdate");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "1234";
	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
	String sql = "insert into tbl_goods_01(goods_cd, goods_nm, goods_price, cost, sysdate) values(?, ?, ?, ?, ?)";
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, goods_cd);
	pstmt.setString(2, goods_nm);
	pstmt.setString(3, goods_price);
	pstmt.setString(4, cost);
	pstmt.setString(5, sysdate);
	
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
	
	response.sendRedirect("product_manage.jsp");
%>