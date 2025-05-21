<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="dbconn.jsp" %> <!-- Include the database connection JSP -->
<%
    final double MULTIPLIER = 1.9;
    String userId = (String) session.getAttribute("userId");
    Integer balance = (Integer) session.getAttribute("userBalance");

    if (userId == null || balance == null) {
        // 사용자 정보가 없으면 로그인 페이지로 리다이렉트
        response.sendRedirect("login.jsp");
        return;
    }

    // 사다리 게임 로직 실행
    int actualStartPosition = (Math.random() < 0.5) ? 0 : 1; // 0은 좌, 1은 우
    int actualRows = (int)(Math.random() * 2) + 3; // 3 또는 4줄
    String actualResult = (Math.random() < 0.5) ? "odd" : "even"; // 홀 또는 짝

    // 실제 결과를 세션에 저장
    session.setAttribute("actualStartPosition", actualStartPosition);
    session.setAttribute("actualRows", actualRows);
    session.setAttribute("actualResult", actualResult);

    // 배팅 결과 처리
    String betPosition = request.getParameter("betPosition");
    String betRowsStr = request.getParameter("betRows");
    String betResult = request.getParameter("betResult");
    String betAmountStr = request.getParameter("betAmount");

    String betMessage = "배팅 실패";
    boolean isBetWin = false;

    if (betPosition != null && betRowsStr != null && betResult != null && betAmountStr != null) {
        int betRows = Integer.parseInt(betRowsStr);
        int betAmount = Integer.parseInt(betAmountStr);

        if (betPosition.equals(actualStartPosition == 0 ? "left" : "right") &&
            betRows == actualRows &&
            betResult.equals(actualResult)) {
            isBetWin = true;
            balance = balance + (int) Math.round(betAmount * MULTIPLIER);
            betMessage = "배팅 성공! 배당금: " + (int) Math.round(betAmount * MULTIPLIER) + " 원";
        } else {
            balance -= betAmount;
            betMessage = "배팅 실패! 잃은 금액: " + betAmount + " 원";
        }

        // Update balance in the database
        try (PreparedStatement stmt = conn.prepareStatement("UPDATE users SET balance = ? WHERE id = ?")) {
            stmt.setInt(1, balance);
            stmt.setString(2, userId);
            int rowsUpdated = stmt.executeUpdate();
            System.out.println("Database update status: " + (rowsUpdated > 0 ? "Success" : "Failure"));

            // Update session balance
            session.setAttribute("userBalance", balance);
            System.out.println("Balance updated: " + balance);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Connection을 닫는 부분은 여기서 처리하지 않음. dbconn.jsp에서 처리됨.
        }

        // 배팅 결과를 세션에 저장
        session.setAttribute("betMessage", betMessage);
        session.setAttribute("isBetWin", isBetWin);
    } else {
        System.out.println("Bet parameters missing or invalid");
    }

    // ladder.jsp로 리다이렉트
    response.sendRedirect("ladder.jsp");
%>
