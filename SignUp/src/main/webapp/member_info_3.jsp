<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>    
<%
	if((session.getAttribute("id")==null) || // 세션에 로그인 한 id가 없거나
		(!((String)session.getAttribute("id")).equals("admin"))){ // id가 admin 아이디가 아니라면
		out.println("<script>");
		out.println("location.href='loginForm_3.jsp"); // 회원가입 홈페이지로 이동
		out.println("</script>");
	}
	
	String id = request.getParameter("id");	// 회원 정보 조회 id를 변수에 저장
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mariaDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement("SELECT * FROM member WHERE id=?");
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		rs.next(); // 레코드가 있는 위치로 커서 이동을 위해 next() 메소드 호출
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
			<td colspan=2><a href="member_list_3.jsp">리스트로 돌아가기</a></td>
		</tr>
	</table>
</body>
</html>