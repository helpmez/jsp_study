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
String[] movieList ={"타이타닉","시네마 천국","킹콩","혹성탈출"};
pageContext.setAttribute("movieList", movieList); // 페이지 내 movieList 속성의 값을 movieList로 지정
%>
<table border="1" style="width:100%; text-align :center;">
	<tr>
		<th> index </th> <th> count </th> <th> title </th>
	</tr>
<c:forEach var="moive" items="${movieList }" varStatus="status"> <!--status라는 변수가-->
<tr>
	<td> ${status.index } </td>  <!-- 반복중인 항목 -->
	<td> ${status.count } </td>	 <!-- 반복중인 횟수를 알려줌 -->
	<td> ${movie} </td>
</tr>
</c:forEach>
</table>

</body>
</html>