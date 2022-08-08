<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" >
   function fn_validate(){	
      var frmLogin=document.frmLogin;
      var user_id=frmLogin.id.value;
      var user_pw=frmLogin.pwd.value;

      if((user_id.length==0 ||user_id=="") ||(user_pw.length==0 ||user_pw=="")){
	 alert("아이디와 비밀번호는 필수입니다.");
      }else{
	frmLogin.method="get";
	frmLogin.action="LoginServlet";
	frmLogin.submit();
      }
   }
</script>

<title>로그인창</title>
</head>
<body>
  <form name="frmLogin">
	아이디  :<input type="text" name="id"><br>
    비밀번호:<input type="password" name="pwd"><br>
    <input type="button" onClick="fn_validate()" value="로그인">
    <input type="reset" value="다시입력">
  </form>
</body>
</html>