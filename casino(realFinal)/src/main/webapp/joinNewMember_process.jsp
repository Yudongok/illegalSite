<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="mvc.model.RandomAlphabets" %>
<html>
<head>
<title>CasinoDatabase NewMember SQL</title>
</head>
<body>
    <%@ include file = "dbconn.jsp" %>
    <%
        request.setCharacterEncoding("utf-8");

        String id = request.getParameter("id");
        String passwd = request.getParameter("passwd");
        String name = request.getParameter("name");
        String recommenderCode = request.getParameter("recommenderCode");

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // recommenderCode가 users 테이블에 있는지 확인
            String checkSql = "SELECT COUNT(*) FROM users WHERE recommenderCode = ?";
            pstmt = conn.prepareStatement(checkSql);
            pstmt.setString(1, recommenderCode);
            rs = pstmt.executeQuery();
            rs.next();
            int count = rs.getInt(1);
            
            // 디버깅 메시지 출력
            out.println("Recommender code count: " + count);
            
            if (count > 0) {
                // recommenderCode가 존재하는 경우 회원가입 실행
                String sql = "INSERT INTO users(id, passwd, name) VALUES(?,?,?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, id);
                pstmt.setString(2, passwd);
                pstmt.setString(3, name);
                pstmt.executeUpdate();

                // 무작위 알파벳 6자리 생성
                String randomCode = RandomAlphabets.generateRandomAlphabets(6);

                // recommenderCode 업데이트 쿼리
                String updateSql = "UPDATE users SET recommenderCode = ? WHERE id = ?";
                pstmt = conn.prepareStatement(updateSql);
                pstmt.setString(1, randomCode);
                pstmt.setString(2, id);
                pstmt.executeUpdate();

                response.sendRedirect("login.jsp");
            } else {
                out.println("유효하지 않은 추천인 코드입니다.");
                response.sendRedirect("joinNewMember.jsp");
            }
        } catch (SQLException ex) {
            out.println("회원가입에 실패하였습니다.");
            out.println("SQLException: " + ex.getMessage());
        } finally {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    %>
</body>
</html>
