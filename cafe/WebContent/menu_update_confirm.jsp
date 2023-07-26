<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");

	String menu_cd = request.getParameter("menu_cd");
	String menu_nm = request.getParameter("menu_nm");
	int price = Integer.parseInt(request.getParameter("price"));
	String menu_fg = request.getParameter("menu_fg");
	
	Connection conn = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "1234";
	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
	String sql = "update menu_tbl_007 set menu_nm = ?, price = ?, menu_fg = ? where menu_cd = ?";
	pstmt = conn.prepareStatement(sql);
	
	System.out.println(menu_cd);
	System.out.println(menu_nm);
	System.out.println(price);
	System.out.println(menu_fg);
	
	
	pstmt.setString(1, menu_nm);
	pstmt.setInt(2, price);
	pstmt.setString(3, menu_fg);
	pstmt.setString(4, menu_cd);
	
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
	
	response.sendRedirect("menu_list.jsp");
%>