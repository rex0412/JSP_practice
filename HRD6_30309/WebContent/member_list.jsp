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

String sql="select artist_id, artist_name, substr(artist_birth, 0, 4)||'년'||substr(artist_birth, 5, 2)||'월'||substr(artist_birth, 7, 2)||'일', artist_gender, talent, agency from tbl_artist_201905";
pstmt = conn.prepareStatement(sql);


rs = pstmt.executeQuery();

String gender = null;

String talent = null;
%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<section>
<h1>참가자목록조회</h1>
<table border="1">
<tr>
<td>참가번호</td>
<td>참가자명</td>
<td>생년월일</td>
<td>성별</td>
<td>특기</td>
<td>소속사</td>
</tr>
<%
while(rs.next()){

	
	if(rs.getString(4).equals("F")) {
		gender = "여";
	} else if(rs.getString(4).equals("M")) {
		gender = "남";
	}
	
	if(rs.getString(5).equals("1")) {
		talent = "보컬";
	} else if(rs.getString(5).equals("2")) {
		talent = "댄스";
	} else if(rs.getString(5).equals("3")) {
		talent = "랩";
	}
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=gender %></td>
<td><%=talent %></td>
<td><%=rs.getString(6) %></td>
</tr>
<%
}
%>
</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>