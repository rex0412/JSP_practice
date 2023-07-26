<%@ page import="java.sql.*" %>
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
<script>
function update(){
	if(document.forms.form.p_no.value.trim() == ""){
		alert("환자코드를 입력하세요!");
		return false;
	}
	else if(document.forms.form.t_code.value.trim() == "lat_name"){
		alert("검사명을 선택하세요!");
		return false;
	}
	else if(document.forms.form.t_sdate.value.trim() == ""){
		alert("검사시작일을 입력하세요!");
		return false;
	}
	else if(document.forms.form.t_status.value.trim() == ""){
		alert("검사상태를 선택하세요!");
		return false;
	}
	else if(document.forms.form.t_ldate.value.trim() == ""){
		alert("검사 완료일을 입력하세요!");
		return false;
	}
	else if(document.forms.form.t_result.value.trim() == ""){
		alert("검사 결과를 선택하세요!");
		return false;
	}
	else{
		alert("정상적으로 등록되었습니다!");
		document.forms.form.submit();
		conn.commit();
		return true;
	}
}	
</script>

<jsp:include page="header.jsp" />

<jsp:include page="nav.jsp" />

<section>
	<h2>검사결과입력</h2>
	<form name="form" action="result_insert_confirm.jsp">
		<table border=1>
			<tr>
				<td>환자코드</td>
				<td><input type="text" name="p_no">예)1001</td>
			</tr>
			<tr>
				<td>검사명</td>
				<td><select name = "t_code">
					<option value="lat_name" selected> 검사명
					<option value="t001"> [T001]결핵
					<option value="t002"> [T002]장티푸스
					<option value="t003"> [T003]수두
					<option value="t004"> [T004]홍역
					<option value="t005"> [T005]콜레라
				</select></td>
			</tr>
			<tr>
				<td>검사시작일</td>
				<td><input type="text" name="t_sdate">예)20200101</td>
			</tr>
			<tr>
				<td>검사상태</td>
				<td><input type="radio" name = "t_status" value="1">검사 중  <input type="radio" name = "t_status" value="2">검사 완료</td>
			</tr>
			<tr>
				<td>검사완료일</td>
				<td><input type="text" name="t_ldate">예)20200101</td>
			</tr>
			<tr>
				<td>검사결과</td>
				<td><input type="radio" name = "t_result" value="X">미입력 <input type="radio" name = "t_result" value="P">양성 <input type="radio" name = "t_result" value="2">음성 </td>
			</tr>
			<tr>
				<td></td>
				<td><input type="button" value="등록" onclick="update();">
				<input type="button" value="재입력" onclick="reset()"></td>
			</tr>
		</table>
	</form>
</section>

<jsp:include page="footer.jsp" />