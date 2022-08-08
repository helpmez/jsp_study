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
String[] movieList ={"타이타닉","시네마 천국","킹콩"};
pageContext.setAttribute("movieList", movieList);
%>
<ul>
<c:forEach var="movie" items="${movieList }" varStatus="status">
  <c:choose>
  	<c:when test="${status.first }">  <!-- 현재 루프가 처음이면 -->
  		<li style = "font-weight:bold; color: red; "> ${movie }</li> <!--속성을 지정한 리스트 생성-->
  	</c:when>
  	<c:otherwise>	<!--그게 아니면 -->
  		<li>${movie }</li> <!-- 그냥 리스트 생성 -->
  	</c:otherwise>
  </c:choose>
</c:forEach>
</ul>

<c:forEach var="movie" items="${movieList }" varStatus="status">
	${movie} <c:if test="${not status.last }">, </c:if> 
	<!--movieList 배열을 하나씩 반복하며 출력하되 현재 루프가 마지막이면 ','를 제외하여 출력-->
</c:forEach>
</body>
</html>