<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement"%>
<%@ page import="java.io.IOException"%>

<%
    String sessionId = (String) session.getAttribute("userId");

    // Database connection parameters
    String url = "jdbc:mysql://localhost:3306/CasinoDB";
    String user = "root";
    String password = "1234";
    
    Connection connection = null;
    PreparedStatement statement = null;
    
    try {
        // Establishing database connection
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(url, user, password);
        
        // Deleting user from the database
        String sql = "DELETE FROM users WHERE id = ?";
        statement = connection.prepareStatement(sql);
        statement.setString(1, sessionId);
        
        int rowsAffected = statement.executeUpdate();
        
        if (rowsAffected >= 1) {
            // If the deletion was successful, redirect to logout.jsp
            response.sendRedirect("logout.jsp");
        } else {
            // If no rows were affected, redirect to welcome.jsp
            response.sendRedirect("welcome.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace();
        // Handle any exceptions here
    } finally {
        // Closing resources
        try {
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Handle any exceptions related to closing resources
        }
    }
%>
