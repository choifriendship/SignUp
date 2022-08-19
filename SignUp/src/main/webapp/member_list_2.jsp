<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
	if((session.getAttribute("id")==null) ||
			(!((String)session.getAttribute("id")).equals("admin"))){
				response.sendRedirect("loginForm_2.jsp");
			}

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/mission";
	
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url,"java","java");
		pstmt = conn.prepareStatement("SELECT * FROM member");

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
				<a href="member_info_2.jsp?id=<%=rs.getString("id") %>">
					<%=rs.getString("id") %>
				</a>
			</td>
			<td>
				<a href="member_delete_2.jsp?id=<%=rs.getString("id") %>">
				삭제</a>
			</td>
		</tr>
		<% } %>
	</table>
</body>
</html>