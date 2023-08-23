<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script>
function updatee() {
	if(document.forms.form.resvno.value.trim()=="") {
		form.resvno.focus();
		alert("예약번호가 입력되지 않았습니다.");
		return false;
	} else if(document.forms.form.empno.value.trim()=="") {
		form.empno.focus();
		alert("사원번호가 입력되지 않았습니다.");
		return false;
	} else if(document.forms.form.resvdate.value.trim()=="") {
		form.resvdate.focus();
		alert("근무일자가 입력되지 않았습니다.");
		return false;
	} else if(document.forms.form.seatno.value.trim()=="") {
		form.seatno.focus();
		alert("좌석번호가 입력되지 않았습니다.");
		return false;
	} else {
		alert("좌석예약정보가 등록되었습니다!");
		document.forms.form.submit();
		conn.commit();
		return true;
	}
}
function reset1() {
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	document.forms.form.reset();
	form.resvno.focus();
	return true;
}
</script>
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<section>
<h1>근무좌석예약</h1>
<form name="form" action="seat_book_insert_confirm.jsp">
<table border="1">
<tr>
<td>예약번호</td>
<td><input type="text" name="resvno">예) 202110001</td>
</tr>
<tr>
<td>사원번호</td>
<td><input type="text" name="empno">예) 1001</td>
</tr>
<tr>
<td>근무일자</td>
<td><input type="text" name="resvdate">예) 20211231</td>
</tr>
<tr>
<td>좌석번호</td>
<td><input type="text" name="seatno">예) S001 ~ S009</td>
</tr>
<tr>
<td colspan="2">
<input type="button" value="등록" onclick="update()">
<input type="button" value="다시쓰기" onclick="reset1()">
</td>
</tr>
</table>
</form>
</section>
<jsp:include page="footer.jsp" />