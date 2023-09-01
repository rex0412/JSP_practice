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
String pwd = "1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pwd);

String person = request.getParameter("person");

String sql = "select pl.registration_code, pl.name, hi.game_numbers, hi.appearance, hi.hit_numbers, hi.home_runs, round(((((hi.hit_numbers+hi.home_runs)/hi.appearance)*100)+hi.home_runs), 2) as attack, hi.put_out, hi.double_play, hi.error_count, hi.put_out+(hi.double_play*2)-(hi.error_count*5) as defend from tbl_player_info pl, tbl_hitter_info hi where pl.registration_code = hi.registration_code and pl.registration_code=?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, person);
rs = pstmt.executeQuery();
%>
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<section>
	<h1>
		선수 등록 코드 :
		<%=person%>
		성적 조회
	</h1>
	<table border="1">
		<tr>
			<td>선수등록코드</td>
			<td>선수명</td>
			<td>게임 수</td>
			<td>타석 수</td>
			<td>안타 수</td>
			<td>홈런 수</td>
			<td>공격 포인트</td>
			<td>아웃 카운트 수</td>
			<td>더블 플레이 수</td>
			<td>에러 수</td>
			<td>수비 포인트</td>
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
			<td><%=rs.getString(6)%></td>
			<td><%=rs.getString(7)%></td>
			<td><%=rs.getString(8)%></td>
			<td><%=rs.getString(9)%></td>
			<td><%=rs.getString(10)%></td>
			<td><%=rs.getString(11)%></td>
		</tr>
		<%
			}
		%>
	</table>
	<input type="button" value="돌아가기"
		onclick="location.href='self_regis_grade_list.jsp'">
</section>
<jsp:include page="footer.jsp" />