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
String sql = "select sa.sale_ymd, sa.sale_no, st.store_nm, me.menu_nm, si.size_nm, sa.sale_cnt, to_char(me.price * sa.sale_cnt, '999,999,999'), sa.pay_type from sale_tbl_003 sa, store_tbl_007 st, size_tbl_007 si, menu_tbl_007 me where sa.store_cd = st.store_cd and sa.menu_cd = me.menu_cd and sa.size_cd = si.size_cd order by sa.sale_no desc";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
String pay_type = null;

%>

<section>
<h2>매출현황</h2>
<table border=1>
	<tr>
		<td>판매일자</td>
		<td>판매번호</td>
		<td>점포명</td>
		<td>판매메뉴</td>
		<td>사이즈</td>
		<td>판매수량</td>
		<td>판매금액</td>
		<td>수취구분</td>
	</tr>
	<%while(rs.next()){ 
		if(rs.getString(8).equals("01")){
			pay_type = "현금";
		}else if(rs.getString(8).equals("02")){
			pay_type = "카드";
		}
	%>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><%=rs.getString(6) %></td>
		<td><%=rs.getString(7)+"원" %></td>
		<td><%=pay_type %></td>
	</tr>
	<%} %>
</table>
</section>

<jsp:include page="footer.jsp" />