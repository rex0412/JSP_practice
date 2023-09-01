<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<meta charset="UTF-8">
<style>
section {
	position: fixed;
	top: 80px;
	width: 100%;
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
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="system";
String pw="1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);

String sql="select po.serial_no, ar.artist_id, ar.artist_name, substr(ar.artist_birth, 0, 4)||'년'||substr(ar.artist_birth, 5, 2)||'월'||substr(ar.artist_birth, 7, 2)||'일', "+
			"po.point, po.point, me.mento_name from tbl_artist_201905 ar, tbl_mento_201905 me, tbl_point_201905 po "+
			"where ar.artist_id = po.artist_id and me.mento_id = po.mento_id";
pstmt = conn.prepareStatement(sql);

rs = pstmt.executeQuery();

String avg = null;
%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<section>
<h1>참가자목록조회</h1>
<table border="1">
<tr>
<td>채점번호</td>
<td>참가번호</td>
<td>참가자명</td>
<td>생년월일</td>
<td>점수</td>
<td>평점</td>
<td>멘토</td>
</tr>
<%
while(rs.next()){
	if(rs.getInt(6)>=90){
		avg = "A";
	} else if(rs.getInt(6)>=80){
		avg = "B";
	} else if(rs.getInt(6)>=70){
		avg = "C";
	} else if(rs.getInt(6)>=60){
		avg = "D";
	} else{
		avg = "F";
	}
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>
<td><%=avg %></td>
<td><%=rs.getString(7) %></td>
</tr>
<%
}
%>
</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>