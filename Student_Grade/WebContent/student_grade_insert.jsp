<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
    function update() {
        if(document.forms.form.id.value.trim() == "") {
            alert("학번이 입력되지 않았습니다.");
            return false;

        } else if(document.forms.form.korean.value.trim() == "") {
            alert("국어 점수가 입력되지 않았습니다.");
            return false;

        } else if(document.forms.form.math.value.trim() == "") {
            alert("수학 점수가 입력되지 않았습니다.");
            return false;

        } else if(document.forms.form.english.value.trim() == "") {
            alert("영어 점수가 입력되지 않았습니다.");
            return false;

        } else if(document.forms.form.history.value.trim() == "") {
            alert("역사 점수가 입력되지 않았습니다.");
            return false;
        } 
        else {
            alert("등록되었습니다.");
            document.form.form.submit();
            conn.comit();
            return true;

        }

    }
</script>
<body>
    <h1 align="center">학생 성적 등록</h1>
    <form name="form" action="student_grade_insert_confirm.jsp" method="post">
    <table border=1>
        <tr>
        <td>학번    </td>    <td><input type="text" name ="id"></td>
        </tr>
        <tr>
        <td>국어    </td>    <td><input type="text" name ="korean"></td>
        </tr>
        <tr>
        <td>수학    </td>     <td><input type="text" name ="math"></td>
        </tr>
        <tr>
        <td>영어    </td>     <td><input type="text" name ="english"></td>
        </tr>
        <tr>
        <td>역사    </td>     <td><input type="text" name = "history"></td>
        </tr>
        <tr>
        <td> <input type="button" value="등록" onclick="update()"> </td>
        </tr>
        </table>
    </form>
</body>
</html>