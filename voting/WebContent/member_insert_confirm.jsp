<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");

String v_jumin = request.getParameter("v_jumin");
String v_name = request.getParameter("v_name");
String m_no = request.getParameter("m_no");
String v_time = request.getParameter("v_time");
String v_area = request.getParameter("v_area");
String v_confirm = request.getParameter("v_confirm");

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pw = "1234";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);
String sql = "insert into tbl_vote202005(v_jumin, v_name, m_no, v_time, v_area, v_confirm) values(?, ?, ?, ?, ?, ?)";
pstmt = conn.prepareStatement(sql);

pstmt.setString(1, v_jumin);
pstmt.setString(2, v_name);
pstmt.setString(3, m_no);
pstmt.setString(4, v_time);
pstmt.setString(5, v_area);
pstmt.setString(6, v_confirm);

pstmt.executeUpdate();

pstmt.close();
conn.close();

response.sendRedirect("index.jsp");
%>