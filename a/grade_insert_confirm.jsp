<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	String registration_code = request.getParameter("registration_code");
	String game_numbers = request.getParameter("game_numbers");
	String appearance = request.getParameter("appearance");
	String hit_numbers = request.getParameter("hit_numbers");
	String home_runs = request.getParameter("home_runs");
	String put_out = request.getParameter("put_out");
	String double_play = request.getParameter("double_play");
	String error_count = request.getParameter("error_count");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	Class.forName("oracle.jdbc.OracleDriver");
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "1234";
	
	conn = DriverManager.getConnection(url, user, pw);
	String sql = "insert into tbl_hitter_info values(?, ?, ?, ?, ?, ?, ?, ?)";
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, registration_code);
	pstmt.setString(2, game_numbers);
	pstmt.setString(3, appearance);
	pstmt.setString(4, hit_numbers);
	pstmt.setString(5, home_runs);
	pstmt.setString(6, put_out);
	pstmt.setString(7, double_play);
	pstmt.setString(8, error_count);
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
	
	response.sendRedirect("index.jsp");
%>