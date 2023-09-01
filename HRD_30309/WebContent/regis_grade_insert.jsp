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
	if(document.forms.form.registraction_code.value.trim() == "") {
		alert("타자가 선택되지 않았습니다!");
		form.registraction_code.focus();
		return false;
	} else if(document.forms.form.game.value.trim() == "") {
		alert("게임 수가 입력되지 않았습니다!");
		form.game.focus();
		return false;
	} else if(document.forms.form.appear.value.trim() == "") {
		alert("타석 수가 입력되지 않았습니다!");
		form.appear.focus();
		return false;
	} else if(document.forms.form.hit.value.trim() == "") {
		alert("안타 수가 입력되지 않았습니다!");
		form.hit.focus();
		return false;
	} else if(document.forms.form.homerun.value.trim() == "") {
		alert("홈런 수가 입력되지 않았습니다!");
		form.homerun.focus();
		return false;
	} else if(document.forms.form.out_count.value.trim() == "") {
		alert("아웃 카운트 수가 입력되지 않았습니다!");
		form.out_count.focus();
		return false;
	} else if(document.forms.form.double_count.value.trim() == "") {
		alert("더블 플레이 수가 입력되지 않았습니다!");
		form.double_count.focus();
		return false;
	} else if(document.forms.form.error.value.trim() == "") {
		alert("에러 수가 입력되지 않았습니다!");
		form.error.focus();
		return false;
	} else {
		alert("타자 성적 등록이 완료되었습니다!");
		document.forms.form.submit();
		conn.commit;
		return true;
	}
}
</script>
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<section>
<h1>타자 성적 등록</h1>
<form name="form" action="regis_grade_insert_confirm.jsp">
<table border="1">
<tr>
<td>타자 선택</td>
<td>
<select name="registraction_code">
<option selected>타자 선택</option>
<option value="A001">[A001]김길동</option>
<option value="A005">[A005]이길동</option>
<option value="B002">[B002]홍길동</option>
<option value="B006">[B006]조길동</option>
</select>
</td>
</tr>
<tr>
<td colspan="2">공격 포인트</td>
</tr>
<tr>
<td>게임 수</td>
<td><input type="text" name="game">게임</td>
</tr>
<tr>
<td>타석 수</td>
<td><input type="text" name="appear">타석</td>
</tr>
<tr>
<td>안타 수</td>
<td><input type="text" name="hit">안타</td>
</tr>
<tr>
<td>홈런 수</td>
<td><input type="text" name="homerun">홈런</td>
</tr>
<tr>
<td colspan="2">수비 포인트</td>
</tr>
<tr>
<td>아웃 카운트 수</td>
<td><input type="text" name="out_count">회</td>
</tr>
<tr>
<td>더블 플레이 수</td>
<td><input type="text" name="double_count">회</td>
</tr>
<tr>
<td>에러</td>
<td><input type="text" name="error">회</td>
</tr>
<tr>
<td colspan="2">
<input type="button" value="등록" onclick="update()">
<input type="reset" value="다시쓰기" onclick="reset()">
</td>
</tr>
</table>
</form>
</section>
<jsp:include page="footer.jsp" />