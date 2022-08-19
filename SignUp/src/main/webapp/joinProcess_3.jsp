<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mariaDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement("INSERT INTO member VALUES (?,?,?,?,?,?)");
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.setInt(4, age);
		pstmt.setString(5, gender);
		pstmt.setString(6, email);
		
		int result = pstmt.executeUpdate();
		
		if(result!=0){
			out.println("<script>");
			out.println("location.href='loginForm_3.jsp'"); // 완성이 되면 로그인 화면 페이지로 이동
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("location.href='joinForm_3.jsp'"); // 아니라면 회원가입 페이지로 다시 이동
			out.println("</script>");
		}
	} 
	catch(Exception e) {
		e.printStackTrace();
	} 
	finally {
		try {
			pstmt.close();
			conn.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리</title>
</head>
<body>
</body>
</html>