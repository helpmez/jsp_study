<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${num1 }+${num2 }=${add }
	Working with server: 

<%=application.getServerInfo() %>

 

Servlet Specification: 

<%=application.getMajorVersion()%>.<%= application.getMinorVersion() %> 

 

JSP version: 

<%= JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion() %>

​
</body>
</html>