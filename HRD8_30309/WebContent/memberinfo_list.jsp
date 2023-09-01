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

String sql = "select cl.regist_month, me.c_no, me.c_name, te.class_name, cl.class_area, to_char(cl.tuition, '999,999,999'), me.grade "
		+ "from tbl_teacher_202201 te, tbl_member_202201 me, tbl_class_202201 cl "
		+ "where me.c_no = cl.c_no and te.teacher_code = cl.teacher_code";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

String year = null;
String month = null;
%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<section>
	<h1>회원정보조회</h1>
	<table border="1">
		<tr>
			<td>수강월</td>
			<td>회원번호</td>
			<td>회원명</td>
			<td>강의명</td>
			<td>강의장소</td>
			<td>수강료</td>
			<td>등급</td>
		</tr>
		<%
			while (rs.next()) {
			year = rs.getString(1).substring(0, 4);
			month = rs.getString(1).substring(4, 6);
		%>
		<tr>
			<td><%=year + "년" + month + "월"%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%="￦" + rs.getString(6)%></td>
			<td><%=rs.getString(7)%></td>
		</tr>
		<%
			}
		%>
	</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>