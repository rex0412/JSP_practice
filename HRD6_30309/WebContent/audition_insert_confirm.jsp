<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<meta charset="UTF-8">
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="system";
String pw="1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);

String sql="insert into tbl_artist_201905 values (?, ?, ?, ?, ?, ?)";
pstmt = conn.prepareStatement(sql);

String id = request.getParameter("id");
String name = request.getParameter("name");
String birth = request.getParameter("birth_1")+request.getParameter("birth_2")+request.getParameter("birth_3");
String gender = request.getParameter("gender");
String talent = request.getParameter("talent");
String agency = request.getParameter("agency");

pstmt.setString(1, id);
pstmt.setString(2, name);
pstmt.setString(3, birth);
pstmt.setString(4, gender);
pstmt.setString(5, talent);
pstmt.setString(6, agency);

pstmt.executeUpdate();
response.sendRedirect("member_list.jsp");
%>