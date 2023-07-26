<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
ResultSet rs = null;
Connection conn = null;
PreparedStatement pstmt = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "system";
String pw = "1234";

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, id, pw);
	
	String sql = "SELECT a.id, b.name, substr(b.id, 1, 1), substr(b.id, 2, 2), " +
		    "substr(b.id, 4, 2), b.gender, a.korean, a.math, a.english, a.history, " +
		    "(a.korean + a.math + a.english + a.history), (a.korean + a.math + a.english + a.history) / 4, " +
		    "rank() over (order by (a.korean + a.math + a.english + a.history) asc) sum_rank " +
		    "from score_tbl a inner join member_tbl b on a.id = b.id";
	
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
} catch(Exception e){
	e.printStackTrace();
}
%>
<section>
<table border=1>
	<tr>
		<td>학번</td>
		<td>이름</td>
		<td>학년</td>
		<td>반</td>
		<td>번호</td>
		<td>성별</td>
		<td>국어</td>
		<td>수학</td>
		<td>영어</td>
		<td>역사</td>
		<td>합계</td>
		<td>평균</td>
		<td>순위</td>
	</tr>
	<%
		while(rs.next()){
	%>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><%=rs.getString(6) %></td>
		<td><%=rs.getString(7) %></td>
		<td><%=rs.getString(8) %></td>
		<td><%=rs.getString(9) %></td>
		<td><%=rs.getString(10) %></td>
		<td><%=rs.getString(11) %></td>
		<td><%=rs.getString(12) %></td>
		<td><%=rs.getString(13) %></td>
	</tr>
	<% }%>
	<tr>
		<td colspan=6></td>
		<td>국어 총합</td>
		<td>수학 총합</td>
		<td>영어 총합</td>
		<td>역사 총합</td>
		<td>총합</td>
		<td>총평균</td>
		<td>------</td>
	</tr>
	<%
	String sql2 = 	"select sum(korean), sum(math), sum(english), sum(history), " +
					"(sum(korean) + sum(math) + sum(english) + sum(history)), " +
					"(sum(korean) + sum(math) + sum(english) + sum(history)) / 10 "+
					"from score_tbl";
	pstmt = conn.prepareStatement(sql2);
	rs = pstmt.executeQuery();
	%>
	
	<% while(rs.next()){ %>
	<tr>
		<td colspan=6></td>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><%=rs.getString(6) %></td>
		<td>------</td>
	</tr>
	<%
	}
	%>
</table>
</section>