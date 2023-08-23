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
function update(){
	if(document.forms.form.resvno.value.trim() == ""){
		form.resvno.focus();
		alert("접종예약번호가 입력되지 않았습니다.");
		return false;
	}else{
		document.forms.form.submit();
		conn.commit();
		return true;
	}
</script>
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<section>
<h1>접종예약조회</h1>
<form name="form" action="inoculation_book_confirm.jsp">
<table border="1">
<tr>
<td>예약번호를 입력하시오.</td>
<td><input type="text" name="resvno"></td>
</tr>
<tr>
<td colspan="2">
<input type="submit" value="예약조회" onclick="update();">
<input type="button" value="홈으로" onclick="location.href='index.jsp'"></td>
</tr>
</table>
</form>
</section>
<jsp:include page="footer.jsp" />