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

String goods_cd = request.getParameter("goods_cd");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String store_cd = request.getParameter("store_cd");

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);
String sql = "select sa.sale_fg, sa.sale_no, to_char(sa.sale_ymd, 'YYYY-MM-DD'), go.goods_nm, sa.sale_cnt, to_char(go.goods_price, '999,999,999'), sa.pay_type " +
             "from tbl_goods_01 go, sale_tbl_003 sa, store_tbl_003 st where (go.goods_cd = sa.goods_cd and st.store_cd = sa.store_cd) and st.store_cd = ?";
pstmt = conn.prepareStatement(sql);

pstmt.setString(1, store_cd);

rs = pstmt.executeQuery();

String sale = null;
String pay = null;
%>

<section>
<%
String store = null;
if(store_cd.equals("A001")) {
	store = "이태원점";
} else if(store_cd.equals("A002")) {
	store = "한남점";
} else if(store_cd.equals("A003")) {
	store = "도원점";
} else if(store_cd.equals("B001")) {
	store = "혜화점";
} else if(store_cd.equals("C001")) {
	store = "방배점";
} else if(store_cd.equals("D001")) {
	store = "사당점";
} else if(store_cd.equals("D002")) {
	store = "흑석점";
} else if(store_cd.equals("E001")) {
	store = "금호점";
}
%>
<h1><%= store %>&nbsp;점포 매출 현황</h1>
	<table border=1>
		<tr>
			<td>판매구분</td>
			<td>판매번호</td>
			<td>판매일자</td>
			<td>상품명</td>
			<td>판매수량</td>
			<td>판매금액</td>
			<td>수취구분</td>
		</tr>
		<%
		while(rs.next()){
			if(rs.getString(1).equals("1")) {
				sale = "판매";
			} else if(rs.getString(1).equals("2")) {
				sale = "판매취소";
			}
			if(rs.getString(7).equals("01")) {
				pay = "현금";
			} else if(rs.getString(7).equals("02")) {
				pay = "카드";
			}
		%>
		<tr>
			<td><%= sale %></td>
			<td><%= rs.getString(2) %></td>
			<td><%= rs.getString(3) %></td>
			<td><%= rs.getString(4) %></td>
			<td><%= rs.getString(5) %></td>
			<td><%= rs.getString(6) + "원" %></td>
			<td><%= pay %></td>
		</tr>
		<%
		}
		%>
	</table>
</section>

<jsp:include page="footer.jsp" />