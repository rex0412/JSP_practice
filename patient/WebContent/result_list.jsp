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
	String result = null;
	String status = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "1234";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
	String sql = "select re.p_no, pa.p_name, la.t_name, re.t_sdate, re.t_status, re.t_ldate, re.t_result from tbl_patient_202004 pa, tbl_result_202004 re, tbl_lab_test_202004 la where pa.p_no = re.p_no and la.t_code = re.t_code order by re.p_no asc";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
%>
<section>
<h2>검사결과조회</h2>
	<table style="text-align:center" border=1>
		<tr>
			<td>환자 코드</td>
			<td>환자 이름</td>
			<td>검사 명</td>
			<td>검사 시작일</td>
			<td>검사 상태</td>
			<td>검사 완료일</td>
			<td>검사 결과</td>
		</tr>
		<% while(rs.next()){ 
			String year = rs.getString(4).substring(0, 4);
			String month = rs.getString(4).substring(5, 7);
			String day = rs.getString(4).substring(8, 10); 
			System.out.println(rs.getString(5));
			System.out.println(rs.getString(7));
			if(rs.getString(5).equals("1   ")){
				status = "검사 중";
			}else if (rs.getString(5).equalsIgnoreCase("2   ")){
				status = "검사 완료";
			}
			
			if(rs.getString(7).equals("X   ")){
				result = "미입력";
			}else if(rs.getString(7).equals("P   ")){
				result = "양성";
			}else if(rs.getString(7).equals("N   ")){
				result = "음성";
			}
		%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=year+"-"+month+"-"+day%></td>
			<td><%=status %></td>
			<td><%=rs.getString(6) %></td>
			<td><%=result %></td>
		</tr>
		<%} %>
	</table>
</section>

<jsp:include page="footer.jsp" />