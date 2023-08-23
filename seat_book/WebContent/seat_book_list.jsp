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

String sql = "select e.empno, e.empname, r.resvdate, s.seatno, s.office, s.callno from tbl_emp_202108 e, tbl_seat_202108 s, tbl_resv_202108 r where e.empno = r.empno and s.seatno = r.seatno and e.empno = ? order by s.seatno desc";

pstmt = conn.prepareStatement(sql);

String empno = request.getParameter("empno");
pstmt.setString(1, empno);

rs = pstmt.executeQuery();
%>
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<section>
<h1>사원번호 : <%= empno %> 님의 좌석예약조회</h1>
<table border="1">
<tr>
<td>사원번호</td>
<td>이름</td>
<td>근무일자</td>
<td>좌석번호</td>
<td>좌석위치</td>
<td>내선번호</td>
</tr>
<%
while(rs.next()) {
	String year = rs.getString(3).substring(0, 4);
	String month = rs.getString(3).substring(4, 6);
	String day = rs.getString(3).substring(6, 8);
%>
<tr>
<td><%= rs.getString(1) %></td>
<td><%= rs.getString(2) %></td>
<td><%= year + "년" + month + "월" + day + "일" %></td>
<td><%= rs.getString(4) %></td>
<td><%= rs.getString(5) %></td>
<td><%= rs.getString(6) %></td>
</tr>
<%
}
%>
</table>
<input type="button" value="돌아가기" onclick="location.href='seat_book_insert.jsp'">
</section>
<jsp:include page="footer.jsp" />