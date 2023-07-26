<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<style>
	section{
		position: fixed;
		top: 60px;
		width: 100%;
		height: 100%;
		background-color: lightgray;
		
	}
</style>

<jsp:include page="header.jsp" />

<jsp:include page="nav.jsp" />

<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
	String sql = "select me.m_no, me.m_name, count(vo.m_no) from tbl_vote202005 vo, tbl_member_202005 me where vo.m_no = me.m_no group by me.m_no, me.m_name, vo.m_no order by count(vo.m_no) desc";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
%>

 <section>
 <h2>후보자등수</h2>
 	<table border=1>
 		<tr>
 			<td>후보번호</td>
 			<td>성명</td>
 			<td>총투표건수</td>
 		</tr>
 		<%while(rs.next()){ %>
 		<tr>
 			<td><%=rs.getString(1) %></td>
 			<td><%=rs.getString(2) %></td>
 			<td><%=rs.getString(3) %></td>
 		</tr>
 		<%} %>
 	</table>
 </section>

<jsp:include page="footer.jsp" />