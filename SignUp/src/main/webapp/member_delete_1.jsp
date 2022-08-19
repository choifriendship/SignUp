<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
	if((session.getAttribute("id")==null) || // id 값이 없거나
			(!((String)session.getAttribute("id")).equals("admin"))) {  // id 값이 admin 이면
			response.sendRedirect("loginForm_1.jsp");
		}
	
	String id = request.getParameter("id"); // 변수에 삭제 할 id 값 저장
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/mission";
	
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url,"java","java");
		stmt = conn.createStatement();
		
		String sql = "DELETE FROM member WHERE id = '" + id + "'";
		
		rs = stmt.executeQuery(sql); // SQL 문을 수행한다.
		
		response.sendRedirect("member_list_1.jsp");
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	finally {
		try {
			rs.close();
			stmt.close();
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