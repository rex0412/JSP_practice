<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");

String registration_code = request.getParameter("registration_code");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

Class.forName("oracle.jdbc.OracleDriver");

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pw = "1234";

System.out.println(registration_code);

conn = DriverManager.getConnection(url, user, pw);
String sql = "select registration_code from tbl_player_info where registration_code = " + registration_code;
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

while(rs.next()){
	System.out.println(rs.getString(1));
}
%>