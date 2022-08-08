<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/shopping.css">
<script type="text/javascript" src="script/product.js"></script>
</head>
<body>
	<div id="wrap" align="center">
		<h1>상품 수정 - 관리자 페이지</h1>
		<form method="post" enctype="multipart/form-data" name="frm">
		<!-- form 태그에 action이 생략되었으면 이 페이지를 요청했던 페이지로 이동 
		즉, productUpdateServlet으로 이동(post방식)-->
			<!-- 서블릿에서 넘어온 "product" -->
			<input type="hidden" name="code" value="${product.code}"> 
			<!-- 상품 코드는 화면에 출력하지 않고 productDAO 클래스에 있는
			메서드에 있는 쿼리문을 실행할때 사용됨 -->
			<input type="hidden" name="nonmakeImg" value="${product.pictureUrl}">
			<!-- 만약 사진등록을 하지 않았을때, 원래 사진을 등록해야 하기 때문에 
			원래 사진의 파일명을 일단 지정하고 hidden 태그로 숨김 -->
			<table>
				<tr>
					<td><c:choose> <!-- 사진을 등록하지 않으면 noiamge.gif 출력 -->
							<c:when test="${empty product.pictureUrl}">
								<img src="upload/noimage.gif">
							</c:when>
							<c:otherwise>
								<img src="upload/${product.pictureUrl}">
							</c:otherwise>
						</c:choose></td>
					<td>
						<table>
							<tr>
								<th style="width: 80px">상품명</th>
								<td><input type="text" name="name" value="${product.name}"
									size="80"></td>
							</tr>
							<tr>
								<th>가 격</th>
								<td><input type="text" name="price"
									value="${product.price}"> 원</td>
							</tr>
							<tr>
								<th>사 진</th>
								<td><input type="file" name="pictureUrl"><br>
									(주의사항 : 이미지를 변경하고자 할때만 선택하시오)</td>
							</tr>
							<tr>
								<th>설 명</th>
								<td><textarea cols="90" rows="10" name="description">${product.description}</textarea>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<br> <input type="submit" value="수정"
				onclick="return productCheck()">  <!-- 수정버튼 클릭하면 productUpdate 서블릿으로 이동 -->
				<input type="reset"
				value="다시작성"> <input type="button" value="목록"
				onclick="location.href='productList.do'">
		</form>
	</div>
</body>
</html>