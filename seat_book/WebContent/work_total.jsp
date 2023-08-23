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

String sql = "select empno, empname, deptcode, position from tbl_emp_202108 order by deptcode";

pstmt = conn.prepareStatement(sql);

rs = pstmt.executeQuery();

String job = null;
%>
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<section>
<h1>부서별 근무일 수집계</h1>
<table border="1">
<tr>
<td>사원번호</td>
<td>이름</td>
<td>부서명</td>
<td>근무일수</td>
</tr>
<%
while(rs.next()){
	if(rs.getString(3).equals("10")){
		job = "영업팀";
	} else if(rs.getString(3).equals("20")){
		job = "총무팀";
	} else if(rs.getString(3).equals("30")){
		job = "구매팀";
	}
%>
<tr>
<td><%= rs.getString(1) %></td>
<td><%= rs.getString(2) %></td>
<td><%= job %></td>
<td><%= rs.getString(4) %></td>
</tr>
<%
}
%>
</table>
</section>
<jsp:include page="footer.jsp" />