<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Login Process</title>
</head>
<body>
    <%
        request.setCharacterEncoding("utf-8");
    
        String id = request.getParameter("id");
        String passwd = request.getParameter("passwd");

        boolean idExists = false;
        boolean passwordMatches = false;
        String errorMessage = null;
        String name = null;
        int balance = 0;

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // 데이터베이스 연결 설정
            String dbUrl = "jdbc:mysql://localhost:3306/CasinoDB";
            String dbUser = "root";
            String dbPassword = "1234";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

            // ID 존재 여부 및 비밀번호, 이름, 잔액 확인
            String sql = "SELECT passwd, name, balance FROM users WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                idExists = true;
                String dbPasswd = rs.getString("passwd");
                if (dbPasswd.equals(passwd)) {
                    passwordMatches = true;
                    name = rs.getString("name");
                    balance = rs.getInt("balance");
                }
            }

        } catch (Exception e) {
            errorMessage = "예외가 발생했습니다: " + e.getMessage();
            e.printStackTrace();
        } finally {
            // 리소스 정리
            if (rs != null) try { rs.close(); } catch (SQLException e) { /* 무시 */ }
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { /* 무시 */ }
            if (conn != null) try { conn.close(); } catch (SQLException e) { /* 무시 */ }
        }

        if (errorMessage != null) {
            out.println("<div class='text-danger mt-3'>" + errorMessage + "</div>");
        } else if (idExists) {
            if (passwordMatches) {
                session.setAttribute("userId", id);
                session.setAttribute("userName", name);
                session.setAttribute("userBalance", balance);

                // 로그인 성공 시 모두 main.jsp로 리디렉션
                response.sendRedirect("main.jsp");
            } else {
                out.println("<div class='text-danger mt-3'>로그인 실패: 비밀번호가 일치하지 않습니다.</div>");
                response.sendRedirect("login_failed_passwd.jsp");
            }
        } else {
            out.println("<div class='text-danger mt-3'>로그인 실패: 사용자 ID가 데이터베이스에 존재하지 않습니다.</div>");
            response.sendRedirect("login_failed_id.jsp");
        }
    %>
</body>
</html>
