<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = null;
	
	if(session.getAttribute("id")!=null) {
		id=(String)session.getAttribute("id");
	}
	else
		response.sendRedirect("loginForm_2.jsp");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>
<h3><%=session.getAttribute("id") %>로 로그인하셨습니다.</h3>
<%if(session.getAttribute("id").equals("admin")) {%>
	<a href="member_list_2.jsp">관리자모드 접속(회원 목록 보기)</a>
<%} %>	
</body>
</html>