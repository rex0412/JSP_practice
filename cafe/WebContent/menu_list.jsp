<%@ page import="java.sql.*" %>
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
String sql = "select menu_cd, menu_nm, price, menu_fg from menu_tbl_007";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

String drinkName = null;

%>

<section>
<h2>메뉴등록/수정</h2>
<table border=1>
	<tr>
		<td>메뉴코드</td>
		<td>메뉴명</td>
		<td>메뉴가격</td>
		<td>메뉴구분</td>
	</tr>
	<%while(rs.next()){ 
		if(rs.getString(4).equals("0")){
			drinkName = "커피";
		}else if(rs.getString(4).equals("1")){
			drinkName = "티";
		}
	%>
	<tr>
		<td><a href="menu_update.jsp?menu_cd=<%=rs.getString(1) %>&menu_fg=<%=drinkName%>"><%=rs.getString(1) %></a></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=drinkName %></td>
	</tr>
	<%} %>
	<tr>
		<td colspan=4><input type="button" value="등록" onClick="location.href='menu_insert.jsp' "></td>
	</tr>
</table>
</section>

<jsp:include page="footer.jsp" />