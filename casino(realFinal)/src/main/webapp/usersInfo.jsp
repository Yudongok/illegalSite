<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            width: 100%;
        }
        .main_image {
            position: relative;
            width: 100%;
            height: calc(100vh - 100px); /* Adjusted height to make room for the banner */
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            background-image: url('./resources/images/background1.jpg');
        }
        .header {
            width: 100%;
            position: fixed;
            top: 0;
            z-index: 1000;
            background-color: #343a40;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .nav-link {
            color: #adb5bd;
            font-weight: 500;
            font-family: "Noto Sans KR", sans-serif;
        }
        .nav-link:hover {
            color: #ffffff;
        }
        .nav-link.active {
            color: #ffffff;
            background-color: #495057;
        }
        .logo {
            color: #ffffff;
            font-size: 1.5rem;
            font-weight: bold;
            text-decoration: none;
        }
        .content {
            padding: 20px;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 40px; /* Increased gap between images */
            margin-top: 80px; /* Adjust this value if necessary */
        }
        .image-container {
            position: relative;
            display: inline-block;
            width: 300px; /* Increased image size */
        }
        .image-container img {
            width: 100%;
            height: auto;
            transition: transform 0.3s ease;
        }
        .image-container img:hover {
            transform: scale(1.1);
        }
        .image-container .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 1.5rem;
            font-weight: bold;
            opacity: 0;
            transition: opacity 0.3s ease;
        }
        .image-container:hover .overlay {
            opacity: 1;
        }
        .banner {
            width: 100%;
            position: fixed;
            bottom: 0;
            height: 100px; /* Set the height of the banner */
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #343a40; 
        }
        .banner img {
            max-height: 100%;
            width: auto;
            display: block;
        }
        .user-info {
            color: #adb5bd;
            margin-left: auto;
            display: flex;
            align-items: center;
            font-size: 0.9rem; /* Reduced font size */
            font-family: "Noto Sans KR", sans-serif;
        }

        .user-info span {
            margin-right: 10px; /* Reduced margin */
            font-weight: 500;
            font-family: "Noto Sans KR", sans-serif;
        }
    </style>
</head>
<body>
    <%@include file="menu.jsp" %>
    <%
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

            String sql = "SELECT * FROM users";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
    %>
    <div class="container mt-5">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>아이디</th>
                    <th>비밀번호</th>
                    <th>이름</th>
                    <th>잔액</th>
                    <th>추천인코드</th> <!-- New column for actions -->
                </tr>
            </thead>
            <tbody>
                <%
                    while (rs.next()) {
                        String id = rs.getString("id");
                        String pw = rs.getString("passwd");
                        String userName = rs.getString("name");
                        String userBalance = rs.getString("balance");
                        String recommenderCode = rs.getString("recommenderCode");
                %>
                <tr>
                    <td><%= id %></td>
                    <td><%= pw %></td>
                    <td><%= userName %></td>
                    <td><%= userBalance %></td>
                    <td><%= recommenderCode %></td>
                    <td>
                        <!-- Action buttons for each user -->
                        <form action="editUser.jsp" method="get" style="display:inline;">
                            <input type="hidden" name="id" value="<%= id %>">
                            <button type="submit" class="btn btn-primary btn-sm">수정</button>
                        </form>
                        <form action="deleteUser_process.jsp" method="post" style="display:inline;" onsubmit="return confirm('정말 삭제하시겠습니까?');">
                            <input type="hidden" name="id" value="<%= id %>">
                            <button type="submit" class="btn btn-danger btn-sm">삭제</button>
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
    <%
        } catch (SQLException ex) {
            out.println("users table access fail<br>");
            out.println("SQLException: " + ex.getMessage());
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { /* 무시 */ }
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { /* 무시 */ }
            if (conn != null) try { conn.close(); } catch (SQLException e) { /* 무시 */ }
        }
    %>
</body>
</html>
