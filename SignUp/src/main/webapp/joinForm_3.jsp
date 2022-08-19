<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<style>
	fieldset {
	  width: 300px;
	  border: 1px solid gainsboro;
	}
	label {
	  margin-bottom: 5px;
	  font-size: small;
	}
	input{
	  width: 280px;
	  height: 20px;
	  margin-bottom: 10px;
	}
	input[type="radio"] {
	  width: 15px;
	}
	a {
	  font-size: small;
	}
	.join {
	  width: 300px;
	  height: 40px;
	  color: white;
	  background-color: #2b6699;
	  border-radius: 10px;
	}
</style>
</head>
<body>
<form name="joinform" action="joinProcess_3.jsp" method="post">
  <fieldset>
      <label for= "id">아이디</label><br>
      <input type="text" name="id" id="id">
      <label for= "pw">패스워드</label><br>
      <input type="password" name="pw" id="pw" placeholder="비밀번호 6자리 이상">
      <label for= "name">이름</label><br>
      <input type="text" name="name" id="name">
      <label for= "age">나이</label><br>
      <input type="number" name="age" id="age">
      <label for= "email">이메일</label><br>
      <input type="email" name="email" id="email">
      <label>성별</label><br>
      <input type="radio" name="sex" id="man"><a><label for="man">남</label></a>
      <input type="radio" name="sex" id="woman"><a><label for="woman">여</label></a>
      <input type="submit" class="join" value="회원가입">
  </fieldset>
</form>
</body>
</html>