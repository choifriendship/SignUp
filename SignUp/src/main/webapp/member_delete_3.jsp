<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	if((session.getAttribute("id")==null)|| // id값이 없거나
		(!((String)session.getAttribute("id")).equals("admin"))) { // id가 admin이 아니라면
		out.println("<script>");
		out.println("location.href='loginForm_3.jsp"); // 로그인 화면으로 이동
		out.println("</script>");
	}
	
	String id = request.getParameter("id"); // 변수에 삭제할 id 값을 저장
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mariaDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement("DELETE FROM member WHERE id=?"); // 회원 정보를 삭제한다.
		pstmt.setString(1, id); // 저장 둔 id
		pstmt.executeUpdate();
		
		out.println("<script>");
		out.println("location.href='member_list_3.jsp'"); // 회원 목록 페이지로 이동한다.
		out.println("</script>");
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	finally {
		try {
			pstmt.close();
			conn.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원삭제</title>
</head>
<body>
</body>
</html>