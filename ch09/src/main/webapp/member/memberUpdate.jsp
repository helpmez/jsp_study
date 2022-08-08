<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<script type="text/javascript" src="script/member.js"></script>
</head>
<body>
<h2>회원수정</h2>
<form action = "MemberUpdateServlet" method="post" name="frm">
	<table>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" size="20" value="${mVo.name}" readonly></td>
		</tr>
		<tr>
			<td> 아이디</td>
			<td>
				<input type="text" name="userid" size="20" id="userid"
				value="${mVo.userid}" readonly>
			
			</td>
		</tr>
		<tr>
			<td>암호</td>
			<td> <input type="password" name="pwd" size="20">*</td>
		</tr>
		<tr>
			<td width="80">암호 확인</td>
			<td><input type="password" name="pwd_check" size="20">*</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td> <input type="text" name="email" size="20" value="${mVo.email}">*</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td> <input type="text" name="phone" size="20" value="${mVo.phone}">*</td>
		</tr>
		<tr>
			<td> 등급</td>
			<td>
			<c:choose>
				<c:when test="${mVo.admin==0 }">
				<input type="radio" name="admin" value="0" checked="checked"> 일반회원
				<input type="radio" name="admin" value="1"> 관리자
				</c:when>
				<c:otherwise>
				<input type="radio" name="admin" value="0" > 일반회원
				<input type="radio" name="admin" value="1" checked="checked"> 관리자
				</c:otherwise>
			</c:choose>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
					<input type="submit" value="확인"
								onclick="return joinCheck()">&nbsp;
					<input type="reset" value="취소">&nbsp;
				</td>
			</tr>
	</table>
</form>

</body>
</html>