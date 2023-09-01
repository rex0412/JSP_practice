<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<meta charset="UTF-8">
<style>
section {
position: fixed;
top: 80px;
width: 100%;
height: 100%;;
}
h1 {
text-align: center;
}
table {
margin 0 auto;
text-align: center;
}
</style>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="system";
String pw="1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);

String sql ="select sa.saleno, sa.scode, sh.sname, to_char(sa.saledate, 'YYYY-MM-DD'), pi.pcode, pi.pname, sa.amount, to_char(sum(pi.cost*sa.amount), '999,999,999') " +
			"from tbl_pizza_01 pi, tbl_shop_01 sh, tbl_salelist_01 sa " +
			"where sh.scode = sa.scode and pi.pcode = sa.pcode " +
			"group by sa.saleno, sa.scode, sh.sname, sa.saledate, pi.pcode, pi.pname, sa.amount " +
			"order by sa.saleno";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();
%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<section>
<h1>통합매출현황조회</h1>
<table border="1">
<tr>
<td>매출전표번호</td>
<td>지점</td>
<td>판매일자</td>
<td>피자코드</td>
<td>피자명</td>
<td>판매수량</td>
<td>매출액</td>
</tr>
<%
while(rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2)+"-"+rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>
<td><%=rs.getString(6) %></td>
<td><%=rs.getString(7) %></td>
<td>￦<%=rs.getString(8) %></td>
</tr>
<%
}
%>
</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>