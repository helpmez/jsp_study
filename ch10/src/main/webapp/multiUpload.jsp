<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action ="MultiUploadServlet" method="post" enctype="multipart/form-data">
	1.파일 지정하기 : <input type="file" name="uploadFile1"><br>
	1.파일 지정하기 : <input type="file" name="uploadFile2"><br>
	1.파일 지정하기 : <input type="file" name="uploadFile3"><br>
	<input type="submit" value="전송">
</form>
</body>
</html>