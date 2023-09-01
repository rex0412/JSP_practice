<%@page import="jdk.nashorn.internal.ir.ForNode"%>
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
String pw="1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);

String sql="insert into tbl_salelist_01 values (?, ?, ?, ?, ?)";
pstmt=conn.prepareStatement(sql);

int saleno = Integer.parseInt(request.getParameter("saleno"));
String scode = request.getParameter("scode");
String saledate = request.getParameter("saledate");
String pcode = request.getParameter("pcode");
int amount = Integer.parseInt(request.getParameter("amount"));

pstmt.setInt(1, saleno);
pstmt.setString(2, scode);
pstmt.setString(3, saledate);
pstmt.setString(4, pcode);
pstmt.setInt(5, amount);
pstmt.executeUpdate();

response.sendRedirect("all_salelist.jsp");
%>