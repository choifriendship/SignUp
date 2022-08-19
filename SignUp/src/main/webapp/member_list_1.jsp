<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
	if((session.getAttribute("id")==null) ||
		(!((String)session.getAttribute("id")).equals("admin"))){
			response.sendRedirect("loginForm_1.jsp");
		}
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/mission";

	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url,"java","java");
		stmt = conn.createStatement();
		
		String sql = "SELECT * FROM member";

		rs = stmt.executeQuery(sql);
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
		<% while(rs.next()) {%>
			<tr>
				<td>
					<!-- 회원 아이디 클릭 시 특정회원 페이지로 이동 -->
					<a href="member_info_1.jsp?id=<%=rs.getString("id") %>">
						<!-- 아이디의 컬럼값 추출 -->
						<%=rs.getString("id") %>
					</a>
				</td>
				<td>
					<!-- 회원 정보 삭제 페이지로 이동 -->
					<a href="member_delete_1.jsp?id=<%=rs.getString("id") %>">
					삭제</a>
				</td>
			</tr>
		<% } %>
	</table>
</body>
</html>