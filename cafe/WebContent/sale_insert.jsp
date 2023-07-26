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
	if(document.forms.form.sale_cnt.value.trim() == ""){
		alert("판매수량을 입력하지 않았습니다.");
		return false;
	}else{
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
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pw = "1234";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);
String sql = "select to_char(sysdate, 'yyyymmdd'), max(sale_no)+1 from dual, sale_tbl_003";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

rs.next();

String max_sale_no = "000"+rs.getString(2);
%>

<section>
<h2>매출 등록</h2>
<form name="form" action="sale_insert_confirm.jsp">
	<table border=1>
		<tr>
			<td>판매일자(자동발생)</td>
			<td><input type="text" name="sale_ymd" value="<%=rs.getString(1) %>" readonly></td>
		</tr>
		<tr>
			<td>판매번호(장동채변)</td>
			<td><input type="text" name="sale_no" value="<%=max_sale_no %>" readonly></td>
		</tr>
		<tr>
			<td>판매점포</td>
			<td><select name = "store_cd">
				<option value="no_store_cd" selected> 선택
				<option value="A001"> 동부이촌동점
				<option value="A002"> 이태원점
				<option value="A003"> 서울타워점
				<option value="A004"> 소공동점
				<option value="A005"> 명동길점
				<option value="A006"> 충무로역점
			</select></td>
		</tr>
		<tr>
			<td>메뉴코드</td>
			<td><select name = "menu_cd">
				<option value="no_menu_cd" selected> 선택
				<option value="10001"> 아메리카노
				<option value="10002"> 카페 라떼
				<option value="10003"> 카페 모카
				<option value="10004"> 카라멜 마키아또
				<option value="10005"> 호지 티 라떼
				<option value="10006"> 그린 티 라떼
				<option value="10007"> 차이 티 라떼
			</select></td>
		</tr>
		<tr>
			<td>사이즈</td>
			<td><select name = "size_cd">
				<option value="no_size_cd" selected> 선택
				<option value="S1"> Short
				<option value="T1"> Tall
				<option value="G1"> Grande
				<option value="V1"> Venti
			</select></td>
		</tr>
		<tr>
			<td>판매수량</td>
			<td><input type="text" name="sale_cnt"></td>
		</tr>
		<tr>
			<td>사이즈</td>
			<td><select name = "pay_type">
				<option value="no_pay_type" selected> 선택
				<option value="01"> 현금
				<option value="02"> 카드
			</select></td>
		</tr>
		<tr>
			<td colspan=2><input type="button" value="등록" onclick="update();">
				<input type="button" value="조회" onClick="location.href='sale_list.jsp' "></td>
		</tr>
	</table>
</form>
</section>

<jsp:include page="footer.jsp" />