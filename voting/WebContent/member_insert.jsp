<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<style>
	section{
		position: fixed;
		top: 60px;
		width: 100%;
		height: 100%;
		background-color: lightgray;
		
	}
</style>
<script>
function update(){
	if(document.forms.form.v_jumin.value.trim() == ""){
		alert("주민번호가 입력되지 않았습니다!");
		form.v_jumin.focus();
		return false;
	}else if(document.forms.form.v_name.value.trim() == ""){
		alert("성명이 입력되지 않았습니다!");
		form.v_name.focus();
		return false;
	}else if(document.forms.form.m_no.value.trim() == ""){
		alert("후보번호가 선택되지 않았습니다!");
		return false;
	}else if(document.forms.form.v_time.value.trim() == ""){
		alert("투표시간이 입력되지 않았습니다!");
		form.v_time.focus();
		return false;
	}else if(document.forms.form.v_area.value.trim() == ""){
		alert("투표장소가 입력되지 않았습니다!");
		form.v_area.focus();
		return false;
	}else if(document.forms.form.v_confirm.value.trim() == ""){
		alert("유권자확인이 선택되지 않았습니다!");
		form.v_confirm.focus();
		return false;
	}else{
		alert("투표하기 정보가 정상적으로 등록되었습니다.");
		document.forms.form.submit();
		conn.commit();
		return true;
	}
}	
function resetBtn(){
	alert("정보를 지우고 처음부터 다시 입력합니다");
	document.forms.form.reset();
	form.v_jumin.focus();
	
}
</script>

<jsp:include page="header.jsp" />

<jsp:include page="nav.jsp" />

 <section>
 <form name="form" action="member_insert_confirm.jsp">
 	<table border=1>
 		<tr>
 			<td>주민번호</td>
 			<td><input type="text" name="v_jumin">ex)890615315726</td>
 		</tr>
 		<tr>
 			<td>성명</td>
 			<td><input type="text" name="v_name"></td>
 		</tr>
 		<tr>
 			<td>후보번호</td>
 			<td>
 				<select name="m_no">
 					<option selected>
 					<option value="1">[1]김후보
 					<option value="2">[2]이후보
 					<option value="3">[3]박후보
 					<option value="4">[4]조후보
 					<option value="5">[5]최후보
 				</select>
 			</td>
 		</tr>
 		<tr>
 			<td>투표시간</td>
 			<td><input type="text" name="v_time"></td>
 		</tr>
 		<tr>
 			<td>투표장소</td>
 			<td><input type="text" name="v_area"></td>
 		</tr>
 		<tr>
 			<td>유권자확인</td>
 			<td><input type="radio" name="v_confirm" value="Y">확인
 			<input type="radio" name="v_confirm" value="N">미확인
 			</td>
 		</tr>
 		<tr>
 			<td></td>
				<td><input type="button" value="등록" onclick="update()">
				<input type="button" value="다시하기" onclick="resetBtn()"></td>
 		</tr>
 	</table>
 </form>
 </section>

<jsp:include page="footer.jsp" />