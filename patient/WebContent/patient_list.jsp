<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<style>
	section{
		position: fixed;
		top: 200px;
		width: 100%;
		height: 100%;
	}
</style>

<jsp:include page="header.jsp" />

<jsp:include page="nav.jsp" />
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	ResultSet rs = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "1234";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
	
	String sql = "select p_no, p_name, p_birth, p_gender, p_tel1, p_tel2, p_tel3, p_city from tbl_patient_202004";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	String gender = null;
	String city = null;
%>

<section>
	<h2>환자 조회</h2>
	<table style="text-align:center" border=1>
		<tr>
			<td>환자 코드</td>
			<td>환자 이름</td>
			<td>환자 생년월일</td>
			<td>환자 성별</td>
			<td>환자 전화번호</td>
			<td>환자 거주지</td>
		</tr>
		<% while(rs.next()){ 
			String phon = rs.getString(5)+"-"+rs.getString(6)+"-"+rs.getString(7);
			
			String year = rs.getString(3).substring(0, 4);
			String month = rs.getString(3).substring(4, 6);
			String day = rs.getString(3).substring(6, 8);
			System.out.println(year);
			
			if(rs.getString(4).equals("M")){
				gender = "남자";
			}else if (rs.getString(4).equals("F")){
				gender = "여자";
			}
			
			if(rs.getString(8).equals("10")){
				city = "서울";
			}else if(rs.getString(8).equals("20")){
				city = "경기";
			}else if(rs.getString(8).equals("30")){
				city = "강원";
			}else if(rs.getString(8).equals("40")){
				city = "대구";
			}
		%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=year+"년"+month+"월"+day+"일" %></td>
			<td><%=gender %></td>
			<td><%=phon %></td>
			<td><%=city %></td>
		</tr>
		<%} %>
	</table>
</section>

<jsp:include page="footer.jsp" />