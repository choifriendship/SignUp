<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	String id = null;

	if((session.getAttribute("id")==null) || // id에 속성값이 없거나
		(!((String)session.getAttribute("id")).equals("admin"))){ // id가 admin이 아니라면 로그인 화면으로 이동
		out.println("<script>");
		out.println("location.href='loginForm_3.jsp");
		out.println("</script>");
	}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mariaDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement("SELECT * FROM member"); // SELECT PreparedStatement 객체 사용
		rs = pstmt.executeQuery();
	}
	catch(Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 페이지</title>
<style>
	table{
		margin: auto;
		width: 400px;
		border: 1px solid gray;
		text-align: center;
	}
	.title{
		font-weight: bold;
		font-size: x-large;
	}
</style>
</head>
<body>
	<table>
		<tr><td colspan=2 class="title">회원 목록</td></tr>
		<% while(rs.next()) { %>
		<tr>
			<td>
				<a href="member_info_3.jsp?id=<%=rs.getString("id") %>">
					<%=rs.getString("id") %>
				</a>
			</td>
			<td>
				<a href="member_delete_3.jsp?id=<%=rs.getString("id") %>">
				삭제</a>
			</td>
		</tr>
		<% } %>
	</table>
</body>
</html>