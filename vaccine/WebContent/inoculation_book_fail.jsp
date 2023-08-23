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
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<section>
<h1>접종예약정보가 존재하지 않습니다!</h1>
<input type="button" value="돌아가기" onclick="location.href='book_list.jsp'">
</section>
<jsp:include page="footer.jsp" />