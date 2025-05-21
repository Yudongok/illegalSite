<%@ page import="java.sql.*" %>
<%
	Connection conn=null;
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/CasinoDB";
	String user = "root";
	String password = "1234";
	
	conn = DriverManager.getConnection(url, user, password);
	
%>