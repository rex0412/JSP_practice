<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%

request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pw = "1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);
String resvno = request.getParameter("resvno");

String sql = "select * from tbl_vaccresv_202108 where resvno ="+resvno;

pstmt = conn.prepareStatement(sql);

rs = pstmt.executeQuery();

if(rs.next()) {
	response.sendRedirect("inoculation_book_list.jsp?resvno="+resvno);
}else {
	response.sendRedirect("inoculation_book_fail.jsp");
}
%>