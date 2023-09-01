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

String sql = "select teacher_code, teacher_name, class_name, to_char(class_price, '999,999,999'), teacher_regist_date from tbl_teacher_202201";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

String year = null;
String month = null;
String day = null;
%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<section>
	<h1>강사조회</h1>
	<table border="1">
		<tr>
			<td>강사코드</td>
			<td>강사명</td>
			<td>강의명</td>
			<td>수강료</td>
			<td>강사자격취득일</td>
		</tr>
		<%
			while (rs.next()) {
			year = rs.getString(5).substring(0, 4);
			month = rs.getString(5).substring(4, 6);
			day = rs.getString(5).substring(6, 8);
		%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%="￦" + rs.getString(4)%></td>
			<td><%=year + "년" + month + "월" + day + "일"%></td>
		</tr>
		<%
			}
		%>
	</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>