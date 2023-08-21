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

String sql = "select m.m_no, m.m_name, m.p_code, m.p_school, m.m_jumin, m.m_city, p.p_tel1, p.p_tel2, p.p_tel3 from tbl_member_202005 m, tbl_party_202005 p where m.p_code = p.p_code";
pstmt = conn.prepareStatement(sql);

rs = pstmt.executeQuery();

String party = null;

String education = null;
%>
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<section>
<h1>후보조회</h1>
<table border="1">
<tr>
<td>후보번호</td>
<td>성명</td>
<td>소속정당</td>
<td>학력</td>
<td>주민번호</td>
<td>지역구</td>
<td>대표전화</td>
</tr>
<%
while(rs.next()) {
	if(rs.getString(3).equals("P1")) {
		party = "A정당";
	} else if(rs.getString(3).equals("P2")) {
		party = "B정당";
	} else if(rs.getString(3).equals("P3")) {
		party = "C정당";
	} else if(rs.getString(3).equals("P4")) {
		party = "D정당";
	} else if(rs.getString(3).equals("P5")) {
		party = "E정당";
	}
	
	if(rs.getString(4).equals("1")) {
		education = "고졸";
	} else if(rs.getString(4).equals("2")) {
		education = "학사";
	} else if(rs.getString(4).equals("3")) {
		education = "석사";
	} else if(rs.getString(4).equals("4")) {
		education = "박사";
	}
	
	String frontnumber = rs.getString(5).substring(0, 6);
	String backnumber = rs.getString(5).substring(6, 13);
%>
<tr>
<td><%= rs.getString(1) %></td>
<td><%= rs.getString(2) %></td>
<td><%= party %></td>
<td><%= education %></td>
<td><%= frontnumber + "-" + backnumber %></td>
<td><%= rs.getString(6) %></td>
<td><%= rs.getString(7) + "-" + rs.getString(8) + "-" + rs.getString(9) %></td>
</tr>
<%
}
%>
</table>
</section>
<jsp:include page="footer.jsp" />