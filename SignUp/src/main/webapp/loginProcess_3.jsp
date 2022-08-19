<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mariaDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement("SELECT * FROM member WHERE id=?");
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			// (비밀번호) 을 가져온다.
			if(pw.equals(rs.getString("pw"))){
				session.setAttribute("id", id);
				out.println("<script>");
				out.println("location.href='main_3.jsp'"); // 로그인이 되면 메인으로 이동한다.
				out.println("</script>");
			}
		}
		
		out.println("<script>");
		out.println("location.href='loginForm_3.jsp'"); // 아니라면 다시 로그인 화면으로 이동한다.
		out.println("</script>");
	}
	catch (Exception e){
		e.printStackTrace();
	}
	finally {
		try {
			rs.close();
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
<title>로그인 처리</title>
</head>
<body>
</body>
</html>