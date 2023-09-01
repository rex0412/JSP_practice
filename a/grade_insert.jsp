<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<style>
section {
	position: fixed;
	top: 60px;
	left: 0px;
	width: 100%;
	height: 100%;
}

h1 {
	text-ailgn: center;
}
</style>
<script>
	function update(){
		if(document.forms.form.registration_code.value.trim() == "none"){
			alert("타자가 선택되지 않았습니다.");
			form.registration_code.focus();
			return false;
		}else if(document.forms.form.game_numbers.value.trim() == ""){
			alert("게임 수가 입력되지 않았습니다.");
			form.game_numbers.focus();
			return false;
		}else if(document.forms.form.appearance.value.trim() == ""){
			alert("타석 수가 입력되지 않았습니다.");
			form.appearance.focus();
			return false;
		}else if(document.forms.form.hit_numbers.value.trim() == ""){
			alert("안타 수가 입력되지 않았습니다.");
			form.hit_numbers.focus();
			return false;
		}else if(document.forms.form.home_runs.value.trim() == ""){
			alert("홈런 수가 입력되지 않았습니다.");
			form.home_runs.focus();
			return false;
		}else if(document.forms.form.put_out.value.trim() == ""){
			alert("아웃 카운트 수가 입력되지 않았습니다.");
			form.put_out.focus();
			return false;
		}else if(document.forms.form.double_play.value.trim() == ""){
			alert("더블 플레이 수가 입력되지 않았습니다.");
			form.double_play.focus();
			return false;
		}else if(document.forms.form.error_count.value.trim() == ""){
			alert("에러 수가 입력되지 않았습니다.");
			form.error_count.focus();
			return false;
		}else{
			alert("타자 성적 등록이 완료되었습니다!");
			document.forms.form.submit();
			conn.commit;
			return true;
		}
	}
</script>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<section>
	<h1>타자 성적 등록</h1>
	<form action="grade_insert_confirm.jsp" name="form">
		<table border=1>
			<tr>
				<td>타자 선택</td>
				<td><select name="registration_code">
						<option value="none">타자 선택</option>
						<option value="A001">[A001]김길동</option>
						<option value="A005">[A005]이길동</option>
						<option value="B002">[B002]홍길동</option>
						<option value="B006">[B006]조길동</option>
				</select></td>
			</tr>
			<tr>
				<td colspan=2>공격 포인트</td>
			</tr>
			<tr>
				<td>게임 수</td>
				<td><input type="text" name="game_numbers">게임</td>
			</tr>
			<tr>
				<td>타석 수</td>
				<td><input type="text" name="appearance">타석</td>
			</tr>
			<tr>
				<td>안타 수</td>
				<td><input type="text" name="hit_numbers">안타</td>
			</tr>
			<tr>
				<td>홈런 수</td>
				<td><input type="text" name="home_runs">홈런</td>
			</tr>
						<tr>
				<td colspan=2>수비 포인트</td>
			</tr>
						<tr>
				<td>아웃 카운트 수</td>
				<td><input type="text" name="put_out">회</td>
			</tr>
			<tr>
				<td>더블 플레이 수</td>
				<td><input type="text" name="double_play">회</td>
			</tr>
			<tr>
				<td>에러</td>
				<td><input type="text" name="error_count">회</td>
			</tr>
			<tr>
				<td colspan=2>
					<input type="button" value="등록" onclick="update();">
					<input type="button" value="다시쓰기" onclick="location.href='grade_insert.jsp';">
				</td>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>