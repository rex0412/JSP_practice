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
	if(document.forms.form.v_jumin.value.trim() == ""){
		alert("주민번호가 입력되지 않았습니다!");
		return false;
	}
	else if(document.forms.form.v_name.value.trim() == ""){
		alert("성명이입력되지 않았습니다!");
		return false;
	}
	else if(document.forms.form.m_no.value.trim() == "member_number"){
		alert("후보번호가 선택되지 않았습니다!");
		return false;
	}
	else if(document.forms.form.v_time.value.trim() == ""){
		alert("투표시간이 입력되지 않았습니다!");
		return false;
	}
	else if(document.forms.form.v_area.value.trim() == ""){
		alert("투표장소가 입력되지 않았습니다!");
		return false;
	}
	else if(document.forms.form.v_confirm.value.trim() == ""){
		alert("유권자확인이 선택되지 않았습니다!");
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
	<h1>투표하기</h1>
	<form name="form" action="voting_confirm.jsp">
		<table border=1>
			<tr>
				<td>주민번호</td>
				<td><input type="text" name="v_jumin">예)890615315726</td>
			</tr>
			<tr>
				<td>성명</td>
				<td><input type="text" name="v_name">예)890615315726</td>
			</tr>
			<tr>
				<td>후보번호</td>
				<td><select name = "m_no">
					<option value="member_number" selected>후보번호
					<option value="1">[1]김후보
					<option value="2">이후보
					<option value="3">박후보
					<option value="4">조후보
					<option value="5">최후보
				</select></td>
			</tr>
			<tr>
				<td>투표시간</td>
				<td><input type="text" name="v_time">예)0930</td>
			</tr>
			<tr>
				<td>투표장소</td>
				<td><input type="text" name="v_area"></td>
			</tr>
			<tr>
				<td>유권자확인</td>
				<td>
				<input type="radio" name = "v_confirm" value="1">확인 
				<input type="radio" name = "v_confirm" value="2">미확인
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="투표하기" onclick="update();">
				<input type="button" value="다시하기" onclick="reset()"></td>
			</tr>
		</table>
	</form>
</section>

<jsp:include page="footer.jsp" />