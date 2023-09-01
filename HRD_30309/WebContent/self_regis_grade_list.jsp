<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<style>
section {
position: fixed;
top: 80px;
height: 100%;
width: 100%;
text-align: center;
}
table {
margin: 0 auto;
text-align: center;
}
</style>
<script>
function update() {
	if(document.forms.form.person.value.trim() == "") {
		alert("선수 등록 코드가 입력되지 않았습니다!");
		form.person.focus();
		return false;
	} else {
		document.forms.form.submit();
		conn.commit;
		return true;
	}
</script>
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<section>
<h1>개별 타자 성적 조회</h1>
<form name="form" action="regis_grade.jsp">
<table border="1">
<tr>
<td>선수 등록 코드를 입력하시오.</td>
<td><input type="text" name="person"></td>
</tr>
<tr>
<td colspan="2">
<input type="button" value="선수조회" onclick="update()">
<input type="button" value="홈으로" onclick="location.href='index.jsp'">
</td>
</tr>
</table>
</form>
</section>
<jsp:include page="footer.jsp" />