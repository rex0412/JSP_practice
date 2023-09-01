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
		if(document.forms.form.registration_code.value.trim() == ""){
			alert("선수 등록 코드가 선택되지 않았습니다.");
			form.registration_code.focus();
			return false;
		}else{
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
	<form action="grade_list_insert_confirm.jsp" name="form">
		<table border=1>
			<tr>
				<td>선수 등록 코드를 입력하시오.</td>
				<td><input type="text" name="registration_code"></td>
			</tr>
			<tr>
				<td colspan=2>
					<input type="button" value="선수조회" onclick="update();">
					<input type="button" value="홈으로" onclick="location.href='index.jsp';">
				</td>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>