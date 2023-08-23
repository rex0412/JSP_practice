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
	}
	else if(document.forms.form.jumin.value.trim() == ""){
		form.jumin.focus();
		alert("주민번호가 입력되지 않았습니다.");
		return false;
	}
	else if(document.forms.form.vcode.value.trim() == ""){
		form.vcode.focus();
		alert("백신코드가 입력되지 않았습니다.");
		return false;
	}
	else if(document.forms.form.hospcode.value.trim() == ""){
		form.hospcode.focus();
		alert("병원코드가 입력되지 않았습니다.");
		return false;
	}
	else if(document.forms.form.resvdate.value.trim() == ""){
		form.resvdate.focus();
		alert("예약 일자가 입력되지 않았습니다.");
		return false;
	}
	else if(document.forms.form.resvtime.value.trim() == ""){
		form.resvtime.focus();
		alert("예약시간이 입력되지 않았습니다.");
		return false;
	}
	else{
		alert("접종예약정보가 등록 되었습니다!");
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
	<h1>백신접종예약</h1>
	<form name="form" action="vaccine_book_confirm">
		<table border=1>
			<tr>
				<td>접종예약번호</td>
				<td><input type="text" name="resvno">예) 20210001</td>
			</tr>
			<tr>
				<td>주민번호</td>
				<td><input type="text" name="jumin">예) 710101-1000001</td>
			</tr>
			<tr>
				<td>백신코드</td>
				<td><input type="text" name="vcode">예) V001-V003</td>
			</tr>
			<tr>
				<td>병원코드</td>
				<td><input type="text" name="hospcode">예) H001</td>
			</tr>
			<tr>
				<td>예약일자</td>
				<td><input type="text" name="resvdate">예) 20211231</td>
			</tr>
			<tr>
				<td>예약시간</td>
				<td><input type="text" name="resvtime">예) 1230</td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="등록" onclick="update();">
				<input type="button" value="다시쓰기" onclick="reset1()"></td>
			</tr>
		</table>
	</form>
</section>

<jsp:include page="footer.jsp" />