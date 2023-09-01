<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<style>
section {
	position: fixed;
	top: 80px;
	width: 100%;
	height: 100%;
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
	function update() {
		if (document.forms.form.id.value.trim() == "") {
			alert("참가번호가 입력되지 않았습니다!");
			forms.form.id.focus();
			return false;
		} else if (document.forms.form.name.value.trim() == "") {
			alert("참가자명이 입력되지 않았습니다!");
			forms.form.name.focus();
			return false;
		} else if (document.forms.form.birth_1.value.trim() == "") {
			alert("생년월일이 입력되지 않았습니다!");
			forms.form.birth_1.focus();
			return false;
		} else if (document.forms.form.birth_2.value.trim() == "") {
			alert("생년월일이 입력되지 않았습니다!");
			forms.form.birth_2.focus();
			return false;
		} else if (document.forms.form.birth_3.value.trim() == "") {
			alert("생년월일이 입력되지 않았습니다!");
			forms.form.birth_3.focus();
			return false;
		} else if (document.forms.form.gender.value.trim() == "") {
			alert("성별이 입력되지 않았습니다!");
			forms.form.gender.focus();
			return false;
		} else if (document.forms.form.talent.value.trim() == "") {
			alert("특기가 입력되지 않았습니다!");
			forms.form.talent.focus();
			return false;
		} else if (document.forms.form.agency.value.trim() == "") {
			alert("소속사가 입력되지 않았습니다!");
			forms.form.agency.focus();
			return false;
		} else {
			alert("참가신청이 정상적으로 등록되었습니다!");
			document.forms.form.submit();
			conn.commit();
			return true;
		}
	}
	function reset1() {
		alert("정보를 지우고 처음부터 다시 입력합니다!");
		document.forms.form.reset();
		conn.commit();
		forms.form.id.focus();
		return true;
	}
</script>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<section>
	<h1>오디션 등록</h1>
	<form name="form" action="audition_insert_confirm.jsp">
		<table border="1">
			<tr>
				<td>참가번호</td>
				<td><input type="text" name="id">*참가번호는 (A000)4자리입니다</td>
			</tr>
			<tr>
				<td>참가자명</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="text" name="birth_1">년<input type="text" name="birth_2">월<input type="text" name="birth_3">일</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
				<input type="radio" name="gender" value="M">남성
				<input type="radio" name="gender" value="F">여성
				</td>
			</tr>
			<tr>
				<td>특기</td>
				<td><select name="talent">
						<option value="">특기선택</option>
						<option value="1">[1]보컬</option>
						<option value="2">[2]댄스</option>
						<option value="3">[3]랩</option>
				</select></td>
			</tr>
			<tr>
				<td>소속사</td>
				<td><input type="text" name="agency"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="오디션 등록"
					onclick="update()"> <input type="reset" value="다시쓰기"
					onclick="reset1()"></td>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>