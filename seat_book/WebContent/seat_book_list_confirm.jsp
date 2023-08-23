<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%

request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pw = "1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);
String empno = request.getParameter("empno");

String sql = "select e.empno, e.empname, r.resvdate, r.seatno, s.office, s.callno from tbl_emp_202108 e, tbl_seat_202108 s, tbl_resv_202108 r where e.empno = r.empno and s.seatno = r.seatno and  e.empno ="+ empno;

pstmt = conn.prepareStatement(sql);

rs = pstmt.executeQuery();

if(rs.next()) {
	response.sendRedirect("seat_book_list.jsp?empno="+ empno);
}else {
	response.sendRedirect("seat_book_fail.jsp");
}
%>