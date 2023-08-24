<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<meta charset="UTF-8">
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	String sale_no = request.getParameter("sale_no");
	String sale_ymd = request.getParameter("sale_ymd");
	String sale_fg = request.getParameter("sale_fg");
	String store_cd = request.getParameter("store_cd");
	String goods_cd = request.getParameter("goods_cd");
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
	String sql = "insert into sale_tbl_003 (sale_no, sale_ymd, sale_fg, store_cd, goods_cd, sale_cnt, pay_type) values(?, ?, ?, ?, ?, ?, ?)";
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, sale_no);
	pstmt.setString(2, sale_ymd);
	pstmt.setString(3, sale_fg);
	pstmt.setString(4, store_cd);
	pstmt.setString(5, goods_cd);
	pstmt.setString(6, sale_cnt);
	pstmt.setString(7, pay_type);
	
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
	
	response.sendRedirect("product_list.jsp");
 %> 