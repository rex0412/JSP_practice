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

String sql = "select st.store_nm, sum(case when sa.pay_type = '01' then go.goods_price*sa.sale_cnt else 0 end) as a, " +
"sum(case when sa.pay_type = '02' then go.goods_price*sa.sale_cnt else 0 end) as b, " +
"sum(go.goods_price*sa.sale_cnt) as c, st.store_cd " +
"from sale_tbl_003 sa, tbl_goods_01 go, store_tbl_003 st " +
"where st.store_cd = sa.store_cd and go.goods_cd = sa.goods_cd " +
"group by st.store_nm, st.store_cd " +
"order by c desc";

pstmt = conn.prepareStatement(sql);

rs = pstmt.executeQuery();
%>

<section>
<h1>점포별 매출현황</h1>
<table border="1">
<tr>
<td>점포명</td>
<td>현금매출</td>
<td>카드매출</td>
<td>총매출</td>
</tr>
<%
while(rs.next()){
%>
<tr>
<td><a href="store_info.jsp?store_cd=<%=rs.getString(5) %>"><%=rs.getString(1) %></a></td>
<td><%= rs.getString(2) %></td>
<td><%= rs.getString(3) %></td>
<td><%= rs.getString(4) %></td>
</tr>
<%
}
%>
</table>
</section>

<jsp:include page="footer.jsp" />