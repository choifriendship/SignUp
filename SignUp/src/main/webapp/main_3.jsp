<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = null;

	if(session.getAttribute("id")!=null) {
		id=(String)session.getAttribute("id"); // 세션에 아이디가 등록되어 있으면 세션에 저장된 아이디 값을 변수에 저장한다.
		}
	else {
		out.println("<script>");
		out.println("location.href='loginForm_3.jsp'"); // 세션에 아이디가 등록되어있지 않은 경우라면 로그인 화면으로 돌아간다. 
		out.println("</script>");
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>
<h3><%=id %>로 로그인하셨습니다.</h3>
<% if(id.equals("admin")) { %>
	<a href="member_list_3.jsp">관리자모드 접속(회원 목록 보기)</a>
<% } %>	
</body>
</html>