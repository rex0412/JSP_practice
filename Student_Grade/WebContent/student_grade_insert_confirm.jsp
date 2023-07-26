<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");

String id = request.getParameter("id");
String korean = request.getParameter("korean");
String math = request.getParameter("math");
String english = request.getParameter("english");
String history = request.getParameter("history");

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String db_id = "system";
String pwd = "1234";

ResultSet rs = null;
Connection conn = null;
PreparedStatement pstmt = null;

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, db_id, pwd);

String sql = "insert into score_tbl(id, korean, math, english, history) values(?, ?, ?, ?, ?)";
pstmt = conn.prepareStatement(sql);

pstmt.setString(1, id);
pstmt.setString(2, korean);
pstmt.setString(3, math);
pstmt.setString(4, english);
pstmt.setString(3, history);

pstmt.executeUpdate();
response.sendRedirect("index.jps?secion=student_grad_insert");
%>