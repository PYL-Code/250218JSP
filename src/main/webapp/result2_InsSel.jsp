<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String deptno = request.getParameter("deptno");
String dname = request.getParameter("dname");
String loc = request.getParameter("loc");
String URL = "jdbc:mysql://localhost:3306/spring5fs";
String sql_ins = "insert into dept(deptno, dname, loc) values (" + deptno + ", '" + dname + "', '" + loc + "')";
String sql_slct = "select * from dept";
Class.forName("com.mysql.cj.jdbc.Driver");
out.println("드라이버 로딩!<br>");
try( Connection conn = DriverManager.getConnection(URL, "root", "1234");
	 Statement stmt = conn.createStatement();
		)
{
	out.println("Mysql 접속 성공!"); //system.out → JAVA, out.println → 화면에 보임
	stmt.executeUpdate(sql_ins);
	ResultSet rset = stmt.executeQuery(sql_slct);
	out.println("<table border ='1'>");
	out.println("<tr><th>deptno</th><th>dname</th><th>loc</th></tr>");
	while(rset.next()) {
		out.println("<tr>");
		out.println("<td>" + rset.getString("deptno") + "</td>");
		out.println("<td>" + rset.getString("dname") + "</td>");
		out.println("<td>" + rset.getString("loc") + "</td>");
		out.println("</tr>");
	}
	out.println("</table>");
} catch (Exception e) {
	e.printStackTrace();
}
%>
</body>
</html>