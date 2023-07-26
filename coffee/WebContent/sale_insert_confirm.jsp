<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/hetml; charset=UTF-8");
	
	int saleno = Integer.parseInt(request.getParameter("saleno"));
	String pcode = request.getParameter("pcode");
	String saledate = request.getParameter("saledate");
	String scode = request.getParameter("scode");
	int amount = Integer.parseInt(request.getParameter("amount"));
	
	Connection conn = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "1234";
	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
	String sql = "insert into tbl_salelist_01(saleno, pcode, saledate, scode, amount) values(?, ?, ?, ?, ?)";
	
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setInt(1, saleno);
	pstmt.setString(2, pcode);
	pstmt.setString(3, saledate);
	pstmt.setString(4, scode);
	pstmt.setInt(5, amount);
	
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
	
	response.sendRedirect("sale_insert.jsp");
%>