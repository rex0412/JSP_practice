<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<meta charset="UTF-8">
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="system";
String pwd="1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pwd);

String sql="insert into tbl_hitter_info values (?, ?, ?, ?, ?, ?, ?, ?)";
pstmt=conn.prepareStatement(sql);

String registraction_code = request.getParameter("registraction_code");
int game = Integer.parseInt(request.getParameter("game"));
int appear = Integer.parseInt(request.getParameter("appear"));
int hit = Integer.parseInt(request.getParameter("hit"));
int homerun = Integer.parseInt(request.getParameter("homerun"));
int out_count = Integer.parseInt(request.getParameter("out_count"));
int double_count = Integer.parseInt(request.getParameter("double_count"));
int error = Integer.parseInt(request.getParameter("error"));

pstmt.setString(1, registraction_code);
pstmt.setInt(2, game);
pstmt.setInt(3, appear);
pstmt.setInt(4, hit);
pstmt.setInt(5, homerun);
pstmt.setInt(6, out_count);
pstmt.setInt(7, double_count);
pstmt.setInt(8, error);

pstmt.executeUpdate();
%>