<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<style>
	section{
		position: fixed;
		top: 200px;
		width: 100%;
		height: 100%;
	}
</style>

<jsp:include page="header.jsp" />

<jsp:include page="nav.jsp" />
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	ResultSet rs = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "1234";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
	
	String sql = "select pa.p_city, count(pa.p_city) from tbl_patient_202004 pa group by pa.p_city order by pa.p_city asc";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	String city = null;
%>

<section>
<h2>지역별검사건수</h2>
<table style="text-align:center" border=1>
	<tr>
		<td>지역 코드</td>
		<td>지역명</td>
		<td>검사건수</td>
	</tr>
	<%while(rs.next()){ 
		if(rs.getString(1).equals("10")){
			city = "서울";
		}else if(rs.getString(1).equals("20")){
			city = "경기";
		}else if(rs.getString(1).equals("30")){
			city = "강원";
		}else if(rs.getString(1).equals("40")){
			city = "대구";
		}
	%>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=city %></td>
		<td><%=rs.getString(2) %></td>
	</tr>
	<%} %>
</table>
</section>

<jsp:include page="footer.jsp" />