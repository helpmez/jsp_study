<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="script/member.js"></script>
</head>
<body>
	<h2> 아이디 중복확인</h2>
	<form action ="idCheckServlet" method="get" name="frm">
		아이디 <input type="text" name="userid" value="${userid }">
			 <input type="submit" value="중복체크">
	<br>
		<c:if test="${result==1 }">
			<script type = "text/javascript">
				opener.document.frm.userid.value="";
			</script>
			${userid }는 이미 사용중입니다.
	</c:if>
	<c:if test="${result==-1 }">
		${userid }는 사용 가능합니다.
		<input type="button" value="사용" class="cancel" onclick="idok()">
	</c:if>
	</form>

</body>
</html>