<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/shopping.css">
</head>
<body>
	<div id="wrap" align="center">
		<h1>상품 리스트 - 관리자 페이지</h1>
		<table class="list">
			<tr>
				<td colspan="5" style="border: white; text-align: right"><a
					href="productWrite.do">상품 등록</a></td>
			</tr>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>가격</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="product" items="${productList}">
			<!-- ProductList 서블릿에서 넘어온 productList에서 
			상품 정보를 한개씩 얻어와 product에 저장(forEach)-->
				<tr class="record">
					<td>${product.code}</td>
					<td>${product.name}</td>
					<td>${product.price} 원</td>
					<td><a href="productUpdate.do?code=${product.code}">상품 수정</a>
					</td>
					<td><a href="productDelete.do?code=${product.code}">상품 삭제</a>
					</td><!-- 해당 코드와 일치하는 상품의 수정과 삭제 링크 -->
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>