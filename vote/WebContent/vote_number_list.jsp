<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<meta charset="UTF-8">
<style>
section {
position: fixed;
top: 80px;
width: 100%;
left: 0px;
height: 100%;
font-size: 30px;
}
h1 {
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

String sql = "select m.m_no, m.m_name, count(v.m_no) as count from tbl_vote202005 v, tbl_member_202005 m where v.m_no = m.m_no and v.v_confirm = 'Y' group by m.m_no, m.m_name order by count desc";
pstmt = conn.prepareStatement(sql);

rs = pstmt.executeQuery();
%>
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<section>
<h1>후보자등수</h1>
<table border="1">
<tr>
<td>후보번호</td>
<td>성명</td>
<td>총투표건수</td>
</tr>
<%
while(rs.next()) {
%>
<tr>
<td><%= rs.getString(1) %></td>
<td><%= rs.getString(2) %></td>
<td><%= rs.getString(3) %></td>
</tr>
<%
}
%>
</table>
</section>
<jsp:include page="footer.jsp" />