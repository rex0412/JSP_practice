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
ResultSet rs = null;
PreparedStatement pstmt = null;

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);
String sql = "select me.m_no, me.m_name, pa.p_name, me.p_school, me.m_jumin, me.m_city, pa.p_tel1, pa.p_tel2, pa.p_tel3 from tbl_member_202005 me, tbl_party_202005 pa where me.p_code = pa.p_code";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

String school = null;
%>

 <section>
 	<table border=1>
 		<tr>
 			<td>후보번호</td>
 			<td>성명</td>
 			<td>소속정당</td>
 			<td>학력</td>
 			<td>주민번호</td>
 			<td>지역구</td>
 			<td>대표전화</td>
 		</tr>
 		<%while(rs.next()){ 
 	 		String m_jumin = rs.getString(5).substring(0,6);
 	 		String m_jumin2 = rs.getString(5).substring(6,13);
 	 		if(rs.getString(4).equals("1")){
 	 			school = "고졸";
 	 		}else if(rs.getString(4).equals("2")){
 	 			school = "학사";
 	 		}else if(rs.getString(4).equals("3")){
 	 			school = "석사";
 	 		}else if(rs.getString(4).equals("4")){
 	 			school = "박사";
 	 		}
 		%>
 		<tr>
 			<td><%=rs.getString(1) %></td>
 			<td><%=rs.getString(2) %></td>
 			<td><%=rs.getString(3) %></td>
 			<td><%=school %></td>
 			<td><%=m_jumin+"-"+m_jumin2%></td>
 			<td><%=rs.getString(6) %></td>
 			<td><%=rs.getString(7)+"-"+rs.getString(8)+"-"+rs.getString(9) %></td>
 		</tr>
 		<%} %>
 	</table>
 </section>

<jsp:include page="footer.jsp" />