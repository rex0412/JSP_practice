<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	String resvno = request.getParameter("resvno");
	String empno = request.getParameter("empno");
	String resvdate = request.getParameter("resvdate");
	String seatno = request.getParameter("seatno");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "1234";
	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
	String sql = "insert into tbl_vaccresv_202108 (resvno, empno, resvdate, seatno) values(?, ?, ?, ?)";
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, resvno);
	pstmt.setString(2, empno);
	pstmt.setString(3, resvdate);
	pstmt.setString(4, seatno);
	
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
	
	response.sendRedirect("index.jsp");
 %> 