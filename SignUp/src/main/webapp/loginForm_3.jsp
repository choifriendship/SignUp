<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
<style>
	fieldset {
	  width: 250px;
	  height: 180px;
	  background-color: gainsboro;
	  border: none;
	}
	#id {
	  height: 30px;
	  width: 240px;
	  padding: 5px;
	  border: none;
	  border-bottom: 1px solid gainsboro;
	}
	#pw {
	  height: 30px;
	  width: 240px;
	  padding: 5px;
	  border: none;
	}
	.login {
	  position: relative;
	  top: 20px;
	  height: 40px;
	  width: 250px;
	  color: white;
	  background-color: gray;
	}
	.join {
	  position: relative;
	  top: 30px;
	  left: 5px;
	  font-size: small;
	}
</style>
</head>
<body>
<form name="loginform" action="loginProcess_3.jsp" method="post">
  <fieldset>
    <input type="text" id="id" name="id" placeholder="id" >
    <input type="password" id="pw" name="pw" placeholder="password" >
  	<input type="submit" class="login" value="로그인">
    <a href="joinForm_3.jsp" class="join">회원가입</a>
  </fieldset>
</form>
</body>
</html>