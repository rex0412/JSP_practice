<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<meta charset="UTF-8">
<style>
section {
position: fixed;
top: 80px;
width: 100%;
left: 0px;
height: 100%;
font-size: 30px;
}
h1 {
text-align: center;
}
</style>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pw = "1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);

String sql = "select h.hospcode, h.hospname, count(v.hospcode) as count from tbl_hosp_202108 h, tbl_vaccresv_202108 v where h.hospcode = v.hospcode group by h.hospcode, h.hospname order by h.hospcode";

pstmt = conn.prepareStatement(sql);

rs = pstmt.executeQuery();
%>
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<section>
<h1>병원별 접종건수 통계</h1>
<table border="1">
<tr>
<td>병원코드</td>
<td>병원명</td>
<td>접종건수</td>
</tr>
<%
while(rs.next()) {
%>
<tr>
<td><%= rs.getString(1) %></td>
<td><%= rs.getString(2) %></td>
<td><%= rs.getString(3) %></td>
</tr>
<%
}
%>
<% 
String sql2 = "select count(*) from tbl_vaccresv_202108";

pstmt = conn.prepareStatement(sql2);

rs = pstmt.executeQuery();
%>
<%
while(rs.next()){
%>
<tr>
<td></td>
<td>누계</td>
<td><%=rs.getString(1) %></td>
</tr>
<%
}
%>
</table>
</section>
<jsp:include page="footer.jsp" />