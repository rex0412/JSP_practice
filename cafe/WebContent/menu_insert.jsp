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

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);
String sql = "select max(menu_cd)+1 from menu_tbl_007";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

rs.next();

%>

<section>
<h2>매출 등록</h2>
<form name="form" action="menu_insert_confirm.jsp">
	<table border=1>
		<tr>
			<td>메뉴코드(자동체번)</td>
			<td><input type="text" name="menu_cd" value="<%=rs.getString(1) %>"></td>
		</tr>
		<tr>
			<td>메뉴명</td>
			<td><input type="text" name="menu_nm"></td>
		</tr>
		<tr>
			<td>메뉴가격</td>
			<td><input type="text" name="price"></td>
		</tr>
		<tr>
			<td>메뉴구분</td>
			<td>
				<select name="menu_fg">
					<option value="menu_fg_no" selected>선택
					<option value="0"> 커피
					<option value="1"> 티 
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