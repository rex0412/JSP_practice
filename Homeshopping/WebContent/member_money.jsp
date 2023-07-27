<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<style>
section {
	position: fixed;
	top: 80px;
	height: 100%;
	width: 100%;
	font-size: 15px;
	text-align: center;
	background-color: darkgray;
	color: black;
	left: 0px;
}

table {
	margin: auto;
	text-align: center;
}
</style>
<jsp:include page="header.jsp" />

<jsp:include page="nav.jsp" />

<section>
	<%
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "1234";

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);

	String sql = "select me.custno, me.custname, me.grade, sum(mo.price) from member_tbl_02 me, money_tbl_02 mo where me.custno = mo.custno group by me.custno, me.custname, me.grade order by sum(mo.price) desc";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	%>
	<h2>회원 매출 조회</h2>
	<table border=1>
		<tr>
			<td><b>회원번호</b></td>
			<td><b>회원성명</b></td>
			<td><b>고객등급</b></td>
			<td><b>매출</b></td>
		</tr>

		<%
			String grade_check = null;
		while (rs.next()) {

			if (rs.getString(3).equals("A")) {
				grade_check = "VIP";
			} else if (rs.getString(3).equals("B")) {
				grade_check = "일반";
			} else if (rs.getString(3).equals("C")) {
				grade_check = "직원";
			}
		%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=grade_check%></td>
			<td><%=rs.getString(4)%></td>
		</tr>
		<%
			}
		%>
	</table>
</section>

<jsp:include page="footer.jsp" />