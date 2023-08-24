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
	function update() {
		if (document.forms.form.saleno.value.trim() == "") {
			alert("판매번호 입력되지 않았습니다.");
			form.saleno.focus();
			return false;
		} else if (document.forms.form.sale_ymd.value.trim() == "") {
			alert("판매일자가 입력되지 않았습니다.");
			form.sale_ymd.focus();
			return false;
		} else if (document.forms.form.sale_fg.value.trim() == "sale") {
			alert("판매구분이 입력되지 않았습니다.");
			form.sale_fg.focus();
			return false;
		} else if (document.forms.form.store_cd.value.trim() == "store") {
			alert("점포코드가 입력되지 않았습니다.");
			form.store_cd.focus();
			return false;
		} else if (document.forms.form.goods_nm.value.trim() == "goods") {
			alert("판매상품이 입력되지 않았습니다.");
			form.goods_nm.focus();
			return false;
		} else if (document.forms.form.sale_cnt.value.trim() == "") {
			alert("판매수량이 입력되지 않았습니다.");
			form.sale_cnt.focus();
			return false;
		} else if (document.forms.form.pay_type.value.trim() == "pay") {
			alert("수취구분이 입력되지 않았습니다.");
			form.pay_type.focus();
			return false;
		} else {
			alert("매출이 정상적으로 저장되었습니다.");
			document.forms.form.submit();
			conn.commit();
			return true;
		}
	}
</script>

<jsp:include page="header.jsp" />

<jsp:include page="nav.jsp" />

<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe"; 
String user = "system";
String pw = "1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);

String sql = "select lpad(max(sale_no)+1, 4, 0), to_char(sysdate, 'YYYYMMDD') from sale_tbl_003";
pstmt = conn.prepareStatement(sql);

rs = pstmt.executeQuery();

int max_saleno = 0;
%>

<section>
	<h1 style="text-align: center;">매출등록</h1>
	<form name="form" action="product_insert_confirm.jsp">
		<table border=1>
		<%
		while(rs.next()){
		%>
			<tr>
				<td>판매번호(자동발생)</td>
				<td><input type="text" name="saleno" value="<%= rs.getString(1) %>"></td>
			</tr>
			<tr>
				<td>판매일자(자동발생)</td>
				<td><input type="text" name="sale_ymd" value="<%= rs.getString(2) %>"></td>
			</tr>
			<%
			}
			%>
			<tr>
				<td>판매구분</td>
				<td>
				<select name = "sale_fg">
					<option value="sale" selected>선택
					<option value="1">판매
					<option value="2">판매취소
				</select>
				</td>
			</tr>
			<tr>
				<td>판매점포</td>
				<td>
				<select name = "store_cd">
					<option value="store" selected>선택
					<option value="1">이태원점
					<option value="2">한남점
					<option value="3">도원점
					<option value="4">혜화점
					<option value="5">방배점
					<option value="6">사당점
					<option value="7">흑석점
					<option value="8">금호점
				</select>
				</td>
			</tr>
			<tr>
				<td>판매상품</td>
				<td>
				<select name = "goods_cd">
					<option value="goods" selected>선택
					<option value="110001">라면
					<option value="110002">빵
					<option value="110003">과자
					<option value="110004">탄산음료
					<option value="110005">삼각김밥
					<option value="110006">초콜릿
					<option value="110007">우유
				</select>
				</td>
			</tr>
			<tr>
				<td>판매수량</td>
				<td><input type="text" name="sale_cnt"></td>
			</tr>
			<tr>
				<td>수취구분</td>
				<td>
				<select name = "pay_type">
					<option value="pay" selected>선택
					<option value="01">현금
					<option value="02">카드
				</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="button" value="등록" onclick="update();">
				<input type="button" value="조회" onclick="location.href='product_list.jsp';"></td>
			</tr>
		</table>
	</form>
</section>

<jsp:include page="footer.jsp" />