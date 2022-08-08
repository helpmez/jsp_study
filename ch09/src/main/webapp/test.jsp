<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="ch09.com.saeyan.dao.MemberDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
MemberDAO memDao = MemberDAO.getInstance(); // 데이터 접근이 목적인 객체
Connection conn = memDao.getConnection(); // 커넥션 객체를 얻어내는지 확인
out.print("연동");
%>

</body>
</html>