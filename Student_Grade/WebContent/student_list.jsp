<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">

<%
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "system";
String pwd = "1234";

ResultSet rs = null;
Connection conn = null;
PreparedStatement pstmt = null;

Class.forName("oracle.jdbc.driver.OracleDriver");
conn = DriverManager.getConnection(url, id, pwd);

String sql = "select id, name, substr(id,1,1), substr(id,2,2), substr(id,4,2), gender from member_tbl";
pstmt = conn.prepareStatement(sql);

rs = pstmt.executeQuery();

%>
<center>
<h3>학생 조회</h3>
<section>
<table border=1>
<tr>
	<td>학번</td> 
	<td>이름</td> 
	<td>학년</td> 
	<td>반</td> 
	<td>번호</td> 
	<td>성별</td>
</tr>
<%
	while(rs.next()) {
%>
	<tr>
		<td><%=rs.getString(1) %></td> <!-- <%=rs.getString("id") %>  -->
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><%=rs.getString(6) %></td>
	</tr>
	<%
	}
	%>
</table>
</section>
</center>