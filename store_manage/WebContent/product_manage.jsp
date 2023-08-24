<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<style>
section {
position: fixed;
top: 80px;
width: 100%;
left: 0px;
height: 100%;
}
h1 {
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
String sql = "select goods_cd, goods_nm, to_char(goods_price,'l999,999,999'), to_char(cost,'l999,999,999'), to_char(sysdate, 'YYYY-MM-DD') from tbl_goods_01";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
%>

<section>
<h1>상품관리</h1>
<table border=1>
	<tr>
		<td>상품코드</td>
		<td>상품명</td>
		<td>단가</td>
		<td>원가</td>
		<td>입고일자</td>
	</tr>
	<%while(rs.next()){ 
	%>
	<tr>
		<td><a href="product_update.jsp?goods_cd=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
	</tr>
	<%} %>
	<tr>
		<td colspan=5><input type="button" value="등록" onClick="location.href='proinfo_insert.jsp'"></td>
	</tr>
</table>
</section>

<jsp:include page="footer.jsp" />