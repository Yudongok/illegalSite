<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <%
            request.setCharacterEncoding("utf-8");
        
            String id = request.getParameter("id");
            String passwd = request.getParameter("passwd");
            String name = request.getParameter("name");
            String balanceStr = request.getParameter("balance");
            int balance = Integer.parseInt(balanceStr);
        
            ResultSet rs = null;
            PreparedStatement pstmt = null;
            Connection conn = null;
        
            try {
                // 데이터베이스 연결 설정
                String dbUrl = "jdbc:mysql://localhost:3306/CasinoDB";
                String dbUser = "root";
                String dbPassword = "1234";
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
                
                String sql = "SELECT id, passwd FROM users WHERE id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, id);
                rs = pstmt.executeQuery();
                
                if (rs.next()) {
                    String rId = rs.getString("id");
                    String rPasswd = rs.getString("passwd");
                    
                    if (id.equals(rId) && passwd.equals(rPasswd)) {
                        sql = "UPDATE users SET name = ?, balance = ? WHERE id = ?";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, name);
                        pstmt.setInt(2, balance);
                        pstmt.setString(3, id);
                        pstmt.executeUpdate();
                        out.println("<div class='alert alert-success'>users 테이블을 수정했습니다.</div>");
                    } else {
                        out.println("<div class='alert alert-danger'>일치하는 비밀번호가 아닙니다.</div>");
                    }
                } else {
                    out.println("<div class='alert alert-danger'>users 테이블에 일치하는 아이디가 없습니다.</div>");
                }
            } catch (SQLException ex) {
                out.println("<div class='alert alert-danger'>SQLException: " + ex.getMessage() + "</div>");
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) { /* 무시 */ }
                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { /* 무시 */ }
                if (conn != null) try { conn.close(); } catch (SQLException e) { /* 무시 */ }
            }
        %>
        <a href="usersInfo.jsp" class="btn btn-primary mt-3">돌아가기</a>
    </div>
</body>
</html>
