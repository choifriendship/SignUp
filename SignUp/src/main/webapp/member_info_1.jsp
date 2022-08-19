<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
	if((session.getAttribute("id")==null) ||
			(!((String)session.getAttribute("id")).equals("admin"))){
				response.sendRedirect("loginForm_1.jsp");
		}

	ResultSet rs = null;
	Connection conn = null;
	Statement stmt = null;

	String id = request.getParameter("id");
	
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/mission";
	
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, "java", "java");
		stmt = conn.createStatement();
		
		String sql = "SELECT * FROM member WHERE id= '" + id + "'";
		
		rs = stmt.executeQuery(sql);
		rs.next();
	}
	catch(Exception e) {		
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>특정 회원 페이지</title>
<style>
	table{
		margin: auto;
		width: 400px;
		border: 1px solid gray;
		text-align: center;
	}
</style>
</head>
<body>
	<table>
		<tr>
			<td>아이디 : </td>
			<td><%=rs.getString("id") %></td>
		</tr>
		<tr>
			<td>비밀번호 : </td>
			<td><%=rs.getString("pw") %></td>
		</tr>
		<tr>
			<td>이름 : </td>
			<td><%=rs.getString("name") %></td>
		</tr>
		<tr>
			<td>나이 : </td>
			<td><%=rs.getString("age") %></td>
		</tr>
		<tr>
			<td>이메일 : </td>
			<td><%=rs.getString("email") %></td>
		</tr>
		<tr>
			<td>성별 : </td>
			<td><%=rs.getString("gender") %></td>
		</tr>
		<tr>
			<td colspan=2><a href="member_list_1.jsp">리스트로 돌아가기</a></td>
		</tr>
	</table>
</body>
</html>