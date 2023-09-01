<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<meta charset="UTF-8">
<style>
section {
	position: fixed;
	top: 80px;
	height: 100%;
	width: 100%;
}

h1 {
	text-align: center;
}

table {
	margin: 0 auto;
	text-align: center;
}
</style>
<script>
	function change_cno(a) {
		document.forms.form.c_no.value = a;
		return true;
	}

	function tuition_write(form, tc, cp) {
		var c_no = form.c_no.value;

		if (c_no >= 20000)
			cp = cp * 50 / 100;
		
		form.tuition.value = cp;
		return true;
	}

	function update() {
		if (document.forms.form.regist_month.value.trim() == "") {
			alert("수강월이 입력되지 않았습니다!");
			form.regist_month.focus();
			return false;
		} else if (document.forms.form.c_no.value.trim() == "") {
			alert("회원 번호가 입력되지 않았습니다!");
			form.c_no.focus();
			return false;
		} else if (document.forms.form.class_area.value.trim() == "") {
			alert("강의 장소가 입력되지 않았습니다!");
			form.class_area.focus();
			return false;
		} else if (document.forms.form.class_name.value.trim() == "") {
			alert("강의명이 입력되지 않았습니다!");
			form.class_name.focus();
			return false;
		} else if (document.forms.form.tuition.value.trim() == "") {
			alert("수강료가 입력되지 않았습니다!");
			form.tuition.focus();
			return false;
		} else {
			alert("수강신청이 정상적으로 완료되었습니다!");
			document.forms.form.submit();
			conn.commit;
			return true;
		}
	}

	function reset1() {
		alert("정보를 지우고 처음부터 다시 입력합니다!");
		document.forms.form.reset1();
		form.regist_month.focus();
		conn.commit;
		return true;
	}
</script>
<%
	Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
ResultSet rs2 = null;
ResultSet rs3 = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pw = "1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);

String sql = "select c_name, c_no from tbl_member_202201";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

String sql2 = "select distinct(class_area) from tbl_class_202201";
pstmt = conn.prepareStatement(sql2);
rs2 = pstmt.executeQuery();

String sql3 = "select teacher_code, class_name, class_price from tbl_teacher_202201";
pstmt = conn.prepareStatement(sql3);
rs3 = pstmt.executeQuery();
%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<section>
	<h1>수강신청</h1>
	<form name="form" action="class_confirm.jsp">
		<table border="1">
			<tr>
				<td>수강월</td>
				<td><input type="text" name="regist_month">2022년03월
					예)202203</td>
			</tr>
			<tr>
				<td>회원명</td>
				<td><select name="c_name" onchange="change_cno(this.value)">
						<option value="">회원명
							<%
							while (rs.next()) {
						%>
						
						<option value="<%=rs.getString(2)%>"><%=rs.getString(1)%>
							<%
								}
							%>
						
				</select></td>
			</tr>
			<tr>
				<td>회원번호</td>
				<td><input type="text" name="c_no">예)10001</td>
			</tr>
			<tr>
				<td>강의장소</td>
				<td><select name="class_area">
						<option value="">강의장소
							<%
							while (rs2.next()) {
						%>
						
						<option value="<%=rs2.getString(1)%>"><%=rs2.getString(1)%>
							<%
								}
							%>
						
				</select></td>
			</tr>
			<tr>
				<td>강의명</td>
				<td><select name="class_name"
					onchange="tuition_write(this.form, this.value, this.options[this.selectedIndex].getAttribute('a'))">
						<option value="">강의신청
							<%
							while (rs3.next()) {
						%>

							<option value="<%=rs3.getString(1)%>" a="<%=rs3.getString(3)%>">
				<%=rs3.getString(2)%>
							<%
								}
							%></select></td>
			</tr>
			<tr>
				<td>수강료</td>
				<td><input type="text" name="tuition">원</td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="수강신청"
					onclick="update()"> <input type="reset" value="다시쓰기"
					onclick="reset1()"></td>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>