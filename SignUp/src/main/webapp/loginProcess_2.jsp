<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/mission";
	
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, "java", "java");
		
		pstmt = conn.prepareStatement("SELECT * FROM member WHERE id=?");
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		//rs에 있는 것을 하나하나씩 꺼내온다.
		while(rs.next()){
			if(rs.getString("id").equals(id) && rs.getString("pw").equals(pw)){
				session.setAttribute("id", id);
				response.sendRedirect("main_2.jsp");
			}
		}
		// 아니라면 로그인 화면으로 돌아간다.
		response.sendRedirect("loginForm_2.jsp");
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