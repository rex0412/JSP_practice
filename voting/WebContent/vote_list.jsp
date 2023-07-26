<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<style>
	section{
		position: fixed;
		top: 60px;
		width: 100%;
		height: 100%;
		background-color: lightgray;
		
	}
</style>

<jsp:include page="header.jsp" />

<jsp:include page="nav.jsp" />
<%
	Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
	String strdate = simpleDate.format(date);
	
	Calendar cal = Calendar.getInstance();
	
	int intAge = cal.get(Calendar.YEAR);
	int intAgeM = cal.get(Calendar.MONTH) + 1;
	
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");


	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "1234";

	Connection conn = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;

	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
	String sql = "select v_name, v_jumin, m_no, v_time, v_confirm from tbl_vote202005";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	String confirm = null;
	
	String humanMAle = null;
%>

 <section>
 <table border=1>
 	<tr>
 		<td>성명</td>
 		<td>생년월일</td>
 		<td>나이</td>
 		<td>성별</td>
 		<td>후보번호</td>
 		<td>투표시간</td>
 		<td>유권자확인</td>
 	</tr>
 	<%while(rs.next()){ 
 	String juminAge = rs.getString(2).substring(0, 2);
 	String juminAgeM = rs.getString(2).substring(2, 4);
 	String juminAgeD = rs.getString(2).substring(4, 6);
 	String male = rs.getString(2).substring(6, 7);
 	
 	String timeH = rs.getString(4).substring(0, 2);
 	String timeM = rs.getString(4).substring(2, 4);
 	
 	int juminAgeInt = Integer.parseInt(juminAge) + 1900;
 	int juminAgeMInt = Integer.parseInt(juminAgeM);
 	
 	int ageInt = intAge - juminAgeInt;
 	if(intAgeM < juminAgeMInt){
 		ageInt = ageInt - 1;
 	}
 	
 	if(rs.getString(5).equals("N")){
 		confirm = "미확인";
 	}else if(rs.getString(5).equals("Y")){
 		confirm = "확인";
 	}
 	
 	if(male.equals("1")){
 		humanMAle = "남";
 	}else if(male.equals("2")){
 		humanMAle = "여";
 	}
 	%>
 	<tr>
 		<td><%=rs.getString(1) %></td>
 		<td><%=juminAgeInt+"년"+juminAgeM+"월"+juminAgeD+"일생" %></td>
 		<td><%="만 "+ageInt+"세" %></td>
 		<td><%=humanMAle %></td>
 		<td><%=rs.getString(3) %></td>
 		<td><%=timeH+":"+timeM %></td>
 		<td><%=confirm %></td>
 	</tr>
 	<%} %>
 </table>
 </section>

<jsp:include page="footer.jsp" />