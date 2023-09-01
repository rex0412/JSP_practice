<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<meta charset="UTF-8">
<%
	Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pw = "1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);

String sql = "insert into tbl_class_202201 values (?, ?, ?, ?, ?)";
pstmt = conn.prepareStatement(sql);

String regist_month = request.getParameter("regist_month");
String c_no = request.getParameter("c_no");
String class_area = request.getParameter("class_area");
String tuition = request.getParameter("tuition");
String teacher_code = request.getParameter("teacher_code");

pstmt.setString(1, regist_month);
pstmt.setString(2, c_no);
pstmt.setString(3, class_area);
pstmt.setString(4, tuition);
pstmt.setString(5, teacher_code);
pstmt.executeUpdate();

response.sendRedirect("index.jsp");
%>