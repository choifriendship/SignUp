<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%

	if((session.getAttribute("id")==null) ||
			(!((String)session.getAttribute("id")).equals("admin"))) {
			response.sendRedirect("loginForm_1.jsp");
	}
	
	String id = request.getParameter("id");

	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/mission";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String delete_id = request.getParameter("id"); // 변수에 삭제 할 id 값 저장
	
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url,"java","java");
		
		pstmt = conn.prepareStatement("DELETE FROM member WHERE id=?");
		pstmt.setString(1, id);
		pstmt.executeUpdate();
		
		response.sendRedirect("member_list_2.jsp");
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