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
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pw = "1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);

String sql = "select j.pname, j.jumin, j.jumin, j.tel, v.resvdate, v.resvtime, h.hospname, h.hosptel, h.hospaddr, v.vcode from tbl_jumin_201808 j, tbl_hosp_202108 h, tbl_vaccresv_202108 v where j.jumin = v.jumin and h.hospcode = v.hospcode and v.resvno = ?";

pstmt = conn.prepareStatement(sql);


String resvno = request.getParameter("resvno");
pstmt.setString(1, resvno);

rs = pstmt.executeQuery();

String gender = null;
String vaccine = null;

%>
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<section>
<h1>예약번호: <%= resvno %> 의 접종예약조회</h1>
<table border="1">
<tr>
<td>이름</td>
<td>주민번호</td>
<td>성별</td>
<td>전화번호</td>
<td>예약일자</td>
<td>예약시간</td>
<td>병원명</td>
<td>대표전화</td>
<td>병원주소</td>
<td>백신종류</td>
</tr>
<%
while(rs.next()) {
	
 	String male = rs.getString(3).substring(7, 8);
	
	if(male.equals("1")){
 		gender = "남";
 	}else if(male.equals("2")){
 		gender = "여";
 	}
	
	String year = rs.getString(5).substring(0, 4);
	String month = rs.getString(5).substring(4, 6);
	String day = rs.getString(5).substring(6, 8);
	
	String fronttime = rs.getString(6).substring(0, 2);
	String backtime = rs.getString(6).substring(2, 4);
	
	if(rs.getString(10).equals("V001")){
		vaccine = "A백신";
	} else if(rs.getString(10).equals("V002")){
		vaccine = "B백신";
	} else if(rs.getString(10).equals("V003")){
		vaccine = "C백신";
	}
%>
<tr>
<td><%= rs.getString(1) %></td>
<td><%= rs.getString(2) %></td>
<td><%= gender %></td>
<td><%= rs.getString(4) %></td>
<td><%= year + "년" + month + "월" + day + "일" %></td>
<td><%= fronttime + ":" + backtime %></td>
<td><%= rs.getString(7) %></td>
<td><%= rs.getString(8) %></td>
<td><%= rs.getString(9) %></td>
<td><%= vaccine %></td>
</tr>
<%
}
%>
</table>
<input type="button" value="돌아가기" onclick="location.href='book_list.jsp'">
</section>
<jsp:include page="footer.jsp" />