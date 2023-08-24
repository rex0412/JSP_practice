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
String sql = "select max(goods_cd)+1, to_char(sysdate, 'YYYY-MM-DD') from tbl_goods_01";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

rs.next();

%>

<section>
<h1>상품정보 등록</h1>
<form name="form" action="proinfo_insert_confirm.jsp">
	<table border=1>
		<tr>
			<td>상품코드(자동채번)</td>
			<td><input type="text" name="goods_cd" value="<%=rs.getString(1) %>"></td>
		</tr>
		<tr>
			<td>상품명</td>
			<td><input type="text" name="goods_nm"></td>
		</tr>
		<tr>
			<td>단가</td>
			<td><input type="text" name="goods_price"></td>
		</tr>
		<tr>
			<td>원가</td>
			<td><input type="text" name="cost"></td>
		</tr>
		<tr>
			<td>입고일자(자동세팅)</td>
			<td><input type="text" name="in_date" value="<%=rs.getString(2) %>"></td>
		</tr>
		<tr>
			<td colspan=2>
				<input type="button" value="저장" onclick="update();">
				<input type="button" value="상품목록" onClick="location.href='product_manage.jsp' ">
			</td>
		</tr>
	</table>
</form>
</section>

<jsp:include page="footer.jsp" />