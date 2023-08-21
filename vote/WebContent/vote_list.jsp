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
table {
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

String sql = "select v_name, v_jumin, v_jumin, v_jumin, m_no, v_time, v_confirm from tbl_vote202005";
pstmt = conn.prepareStatement(sql);

rs = pstmt.executeQuery();

String confirm = null;

String gender = null;
%>
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<section>
<h1>후보조회</h1>
<table border="1">
<tr>
<td>성명</td>
<td>생년월일</td>
<td>나이</td>
<td>성별</td>
<td>후보번호</td>
<td>투표시간</td>
<td>유권자확인</td>
</tr>
<%
while(rs.next()) {
	
	if(rs.getString(7).equals("Y   ")) {
		confirm = "확인";
	} else if(rs.getString(7).equals("N   ")) {
		confirm = "미확인";
	}
	
	String year = rs.getString(2).substring(0, 2);
	String month = rs.getString(2).substring(2, 4);
	String day = rs.getString(2).substring(4, 6);
	
	String fronttime = rs.getString(6).substring(0, 2);
	String backtime = rs.getString(6).substring(2, 4);
	
	String male = rs.getString(4).substring(6, 7);
	
	if(male.equals("1")){
		gender = "남";
 	}else if(male.equals("2")){
 		gender = "여";
 	}
%>
<tr>
<td><%= rs.getString(1) %></td>
<td><%= 19 + year + "년" + month + "월" + day + "일" %></td>
<%
if(818<Integer.parseInt(rs.getString(2).substring(0, 2))) {
%>
	<td>만 <%= 2023 - (1900 + Integer.parseInt(rs.getString(2).substring(0, 2))) - 1 %>세</td>
<%
}else{
%>
<td>만 <%= 2023 - (1900 + Integer.parseInt(rs.getString(2).substring(0, 2))) %>세</td>
<%} %>
<td><%= gender %></td>
<td><%= rs.getString(5) %></td>
<td><%= fronttime + ":" + backtime %></td>
<td><%= confirm %></td>
</tr>
<%
}
%>
</table>
</section>
<jsp:include page="footer.jsp" />