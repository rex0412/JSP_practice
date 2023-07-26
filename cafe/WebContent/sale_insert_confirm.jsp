<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	String sale_ymd = request.getParameter("sale_ymd");
	String sale_no = request.getParameter("sale_no");
	String store_cd = request.getParameter("store_cd");
	String menu_cd = request.getParameter("menu_cd");
	String size_cd = request.getParameter("size_cd");
	String sale_cnt = request.getParameter("sale_cnt");
	String pay_type = request.getParameter("pay_type");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "1234";
	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
	String sql = "insert into sale_tbl_003(sale_ymd, sale_no, store_cd, menu_cd, size_cd, sale_cnt, pay_type) values(?, ?, ?, ?, ?, ?, ?)";
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, sale_ymd);
	pstmt.setString(2, sale_no);
	pstmt.setString(3, store_cd);
	pstmt.setString(4, menu_cd);
	pstmt.setString(5, size_cd);
	pstmt.setString(6, sale_cnt);
	pstmt.setString(7, pay_type);
	
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
	
	response.sendRedirect("sale_insert.jsp");
%>