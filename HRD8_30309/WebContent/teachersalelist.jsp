<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<meta charset="UTF-8">
<style>
section {
	position: fixed;
	top: 80px;
	height: 100%;
	width: 100%;
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

String sql = "select te.teacher_code, te.class_name, te.teacher_name, sum(cl.tuition) " +
			"from tbl_teacher_202201 te, tbl_class_202201 cl " +
			"where te.teacher_code = cl.teacher_code " +
			"group by te.teacher_code, te.class_name, te.teacher_name " +
			"order by te.teacher_code";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

String year = null;
String month = null;
%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<section>
	<h1>강사매출현황</h1>
	<table border="1">
		<tr>
			<td>강사코드</td>
			<td>강의명</td>
			<td>강사명</td>
			<td>총매출</td>
		</tr>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%="￦" + rs.getString(4)%></td>
		</tr>
		<%
			}
		%>
	</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>