<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="member" class="com.saeyan.javabeans.MemberBean"/>

이름 : <%= member.getName()  %> <br>
아이디 : <%= member.getUserid() %>
<hr>

<%
member.setName("전수빈");
member.setUserid("pinksubin");
%>

이름 : <%= member.getName() %><br>
아이디 : <%= member.getUserid() %>

</body>
</html>