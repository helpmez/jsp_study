<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String[] movieList = {"타이타닉","시네마 천국","킹콩"};
pageContext.setAttribute("movieList", movieList); // 페이지 내 movieList 속성의 값을 movieList로 지정
%>
<c:forEach var = "movie" items = "${movieList}"> <!-- 변수 movie에 배열 movieList를 하나씩 받아와  -->
	${movie}<br>	<!-- 반복하며 출력 -->
</c:forEach>
	
</body>
</html>