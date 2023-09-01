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

String sql ="select pi.pcode, pi.pname, to_char(sum(pi.cost*sa.amount), '999,999,999') as cost " +
			"from tbl_pizza_01 pi, tbl_shop_01 sh, tbl_salelist_01 sa " +
			"where sh.scode = sa.scode and pi.pcode = sa.pcode " +
			"group by pi.pcode, pi.pname " +
			"order by cost desc";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();
%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<section>
<h1>지점별 매출 현황</h1>
<center>
<table border="1">
<tr>
<td>피자 코드</td>
<td>피자 명</td>
<td>총매출액</td>
</tr>
<%
while(rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2)%></td>
<td><%="￦"+rs.getString(3) %></td>
</tr>
<%
}
%>
</table>
</center>
</section>
<jsp:include page="footer.jsp"></jsp:include>