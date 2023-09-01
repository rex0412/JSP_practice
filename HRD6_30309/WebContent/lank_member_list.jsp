<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<meta charset="UTF-8">
<style>
section {
	position: fixed;
	top: 80px;
	width: 100%;
	height: 100%;
}

h1 {
	text-align: center;
}

table {
	margin: 0 auto;
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

String sql = "select ar.artist_id, ar.artist_name, sum(po.point) as sum, round(avg(po.point),2) as avg, "+
			"rank() over(order by round(avg(po.point),2) desc) from tbl_artist_201905 ar, tbl_point_201905 po "+
			"where ar.artist_id = po.artist_id "+
			"group by ar.artist_id, ar.artist_name";
pstmt = conn.prepareStatement(sql);

rs = pstmt.executeQuery();
%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<section>
	<h1>참가자등수조회</h1>
	<table border="1">
		<tr>
			<td>참가번호</td>
			<td>참가자명</td>
			<td>총점</td>
			<td>평균</td>
			<td>등수</td>
		</tr>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
		</tr>
		<%
			}
		%>
	</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>