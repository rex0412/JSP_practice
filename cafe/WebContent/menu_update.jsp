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
<script>
function update(){
		document.forms.form.submit();
		conn.commit();
		return true;
}	
</script>

<jsp:include page="header.jsp" />

<jsp:include page="nav.jsp" />
<%
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pw = "1234";

int menu_cd = Integer.parseInt(request.getParameter("menu_cd"));
String menu_fg = request.getParameter("menu_fg");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);
String sql = "select menu_cd, menu_nm, price, menu_fg from menu_tbl_007 where menu_cd =" + menu_cd;
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

rs.next();

%>

<section>
<h2>매출 등록</h2>
<form name="form" action="menu_update_confirm.jsp">
	<table border=1>
		<tr>
			<td>메뉴코드(자동체번)</td>
			<td><input type="text" name="menu_cd" value="<%=rs.getString(1) %>" readonly></td>
		</tr>
		<tr>
			<td>메뉴명</td>
			<td><input type="text" name="menu_nm" value="<%=rs.getString(2) %>"></td>
		</tr>
		<tr>
			<td>메뉴가격</td>
			<td><input type="text" name="price" value="<%=rs.getString(3) %>"></td>
		</tr>
		<tr>
			<td>메뉴구분</td>
			<td>
				<select name="menu_fg">
				<%if(menu_fg.equals("커피")){ %>
					<option value="menu_fg_no">선택
					<option value="0" selected> 커피
					<option value="1"> 티 
					<%}else if(menu_fg.equals("차")){ %>
					<option value="menu_fg_no">선택
					<option value="0"> 커피
					<option value="1" selected> 티 
					<%} %>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan=2>
				<input type="button" value="등록" onclick="update();">
				<input type="button" value="조회" onClick="location.href='menu_list.jsp' ">
			</td>
		</tr>
	</table>
</form>
</section>

<jsp:include page="footer.jsp" />