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
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<%
	Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pwd = "1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pwd);

String sql = "select pl.registration_code, pl.name, pl.birth_day, pl.height, pl.weight, pl.registration_code, (((((hi.hit_numbers+hi.home_runs) / hi.appearance) *100)+hi.home_runs) + (hi.put_out + (hi.double_play*2) - (hi.error_count*5)))/2 as grade , rank() over(order by (((((hi.hit_numbers+hi.home_runs)/hi.appearance)*100)+hi.home_runs)+(hi.put_out+(hi.double_play*2)-hi.error_count*5))) asc) as lank from tbl_player_info pl, tbl_hitter_info hi where pl.registration_code = hi.registration_code";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

String year= null;
String month= null;
String day= null;

String code = null;
%>
<section>
	<h1>전체 타자 성적 조회</h1>
	<table border="1">
		<tr>
			<td>선수등록코드</td>
			<td>선수명</td>
			<td>생년월일</td>
			<td>키</td>
			<td>몸무게</td>
			<td>소속</td>
			<td>선수 등급</td>
			<td>순위</td>
		</tr>
		<%
		while(rs.next()){
			year = rs.getString(3).substring(0,4);
			month = rs.getString(3).substring(4,6);
			day = rs.getString(3).substring(6,8);
			
			if(rs.getString(6).equals("A001")){
				code = "1군";
			} else if(rs.getString(6).equals("A005")){
				code = "1군";
			} else if(rs.getString(6).equals("B002")){
				code = "2군";
			} else if(rs.getString(6).equals("B006")){
				code = "2군";
			}
		%>
		<tr><%= rs.getString(1) %></tr>
		<tr><%= rs.getString(2) %></tr>
		<tr><%= year+"년"+month+"월"+day+"일" %></tr>
		<tr><%= rs.getString(4) %></tr>
		<tr><%= rs.getString(5) %></tr>
		<tr><%= code %></tr>
		<tr><%= rs.getString(7) %></tr>
		<tr><%= rs.getString(8) %></tr>
		<%
		}
		%>
	</table>
</section>
<jsp:include page="footer.jsp" />