<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<style>
nav {
	width: 100%;
	height: 30px;
	background-color: #C0DEF1;
	line-height: 30px;
}

nav ul {
	list-style-type: none;
	margin: 0px;
	padding: 0px;
}

nav ul li{
	display: inline;
	float: left;
	color: white;
}

nav ul li a {
	display: block;
	width: 140px;
}

nav ul li a:hover {
	text-decoration: underline;
	background-color: #C0DEF1;
	color: white;
}

</style>
<nav>
	<ul>
		<li><a href="index.jsp?section=student_list.jsp">학생조회</a></li>
		<li><a href="index.jsp?section=student_grade_insert.jsp">학생성적입력</a></li>
		<li><a href="index.jsp?section=student_grade_list.jsp">학생성적조회</a></li>
		<li><a href="index.jsp">홈으로</a></li>
	</ul>
</nav>