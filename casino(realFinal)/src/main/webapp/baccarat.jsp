<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>바카라 게임</title>
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
    font-family: 'Noto Sans KR', sans-serif;
    background-color: #2d2d2d;
    color: #f4f4f9;
}
.main_image {
    position: relative;
    width: 100%;
    min-height: 100vh;
    background-size: cover;
    background-position: center;
    background-image: url('./resources/images/background1.jpg');
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    padding-top: 80px;
}
.header {
    width: 100%;
    position: fixed;
    top: 0;
    z-index: 1000;
    background-color: #343a40;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    display: flex;
    align-items: center;
    padding: 10px;
}
.content {
    padding: 20px;
    text-align: center;
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 40px;
    margin-top: 80px;
}
.image-container {
    position: relative;
    display: inline-block;
    width: 300px;
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
    height: 100px;
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
}
.user-info span {
    margin-right: 20px;
    font-weight: 500;
}
.container {
    margin-top: 20px; /* 메뉴 높이만큼 패딩 추가 */
}
.card {
    margin: 20px 0;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    background-color: #4b4b5e;
}
.card-header {
    font-size: 1.5rem;
    font-weight: bold;
    background-color: #007bff;
    color: white;
    border-radius: 10px 10px 0 0;
}
.card-body {
    font-size: 1.2rem;
}
.form-group label {
    font-weight: bold;
    color: #36FFD7;
}
.btn-primary {
    background-color: #007bff;
    border-color: #007bff;
}
.btn-secondary {
    background-color: #6c757d;
    border-color: #6c757d;
}
.lead {
    font-size: 1.1rem;
    font-weight: bold;
}
.bet-area {
    display: flex;
    justify-content: space-around;
    margin-top: 20px;
}
.bet-area div {
    width: 200px;
    height: 200px;
    border-radius: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 1.2rem;
    cursor: pointer;
    position: relative;
    color: white;
}
.bet-area .player {
    background-color: #007bff;
    border: 2px solid #007bff;
}
.bet-area .tie {
    background-color: #28a745;
    border: 2px solid #28a745;
}
.bet-area .banker {
    background-color: #dc3545;
    border: 2px solid #dc3545;
}
.chip-selection {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}
.chip {
    width: 80px;
    height: 80px;
    margin: 0 30px;
    border: 2px solid #007bff;
    border-radius: 80%;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 1rem;
    cursor: pointer;
    background-size: cover;
    background-position: center;
}
.chip-1000 {
    background-image: url('./resources/images/chip-1000.png');
}
.chip-5000 {
    background-image: url('./resources/images/chip-5000.png');
}
.chip-10000 {
    background-image: url('./resources/images/chip-10000.png');
}
.chip.selected {
    box-shadow: 0 0 10px 2px #007bff;
}
.bet-area span {
    position: absolute;
    z-index: 2;
    font-weight: bold;
}
    </style>
    <script>
        let selectedChip = null;

        function selectChip(chipValue) {
            selectedChip = chipValue;
            document.querySelectorAll('.chip').forEach(chip => {
                chip.classList.remove('selected');
            });
            document.getElementById('chip-' + chipValue).classList.add('selected');
        }

        function placeBet(betType) {
            if (selectedChip === null) {
                alert('먼저 배팅할 칩을 선택하세요.');	
                return;
            }

            const betInput = document.getElementById(betType + 'BetMoney');
            betInput.value = parseInt(betInput.value) + selectedChip;
        }
    </script>
</head>
<body>
<%@ include file="menu.jsp"%>
    <div class="main_image">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <h1 class="text-center mt-5">바카라 게임</h1>
                    <div class="card text-center">
                        <div class="card-header">
                            배팅 결과
                        </div>
                        <div class="card-body">
                            <jsp:include page="baccarat_Process.jsp" flush="false"/>
                            S<%
                            Integer userBalance = (Integer) session.getAttribute("userBalance");
                            Integer totalBetMoney = (Integer) session.getAttribute("totalBetMoney");

                            // form으로부터 betMoney 값을 받아서 업데이트
                            String playerBetMoneyStr = request.getParameter("playerBetMoney");
                            String tieBetMoneyStr = request.getParameter("tieBetMoney");
                            String bankerBetMoneyStr = request.getParameter("bankerBetMoney");

                            Integer playerBetMoney = 0;
                            Integer tieBetMoney = 0;
                            Integer bankerBetMoney = 0;

                            if (playerBetMoneyStr != null && !playerBetMoneyStr.isEmpty()) {
                                try {
                                    playerBetMoney = Integer.parseInt(playerBetMoneyStr);
                                    session.setAttribute("playerBetMoney", playerBetMoney);
                                } catch (NumberFormatException e) {
                                    out.println("<p class='lead text-danger'>잘못된 플레이어 배팅 금액입니다.</p>");
                                }
                            }

                            if (tieBetMoneyStr != null && !tieBetMoneyStr.isEmpty()) {
                                try {
                                    tieBetMoney = Integer.parseInt(tieBetMoneyStr);
                                    session.setAttribute("tieBetMoney", tieBetMoney);
                                } catch (NumberFormatException e) {
                                    out.println("<p class='lead text-danger'>잘못된 무승부 배팅 금액입니다.</p>");
                                }
                            }

                            if (bankerBetMoneyStr != null && !bankerBetMoneyStr.isEmpty()) {
                                try {
                                    bankerBetMoney = Integer.parseInt(bankerBetMoneyStr);
                                    session.setAttribute("bankerBetMoney", bankerBetMoney);
                                } catch (NumberFormatException e) {
                                    out.println("<p class='lead text-danger'>잘못된 뱅커 배팅 금액입니다.</p>");
                                }
                            }

                            totalBetMoney = playerBetMoney + tieBetMoney + bankerBetMoney;
                            userBalance = userBalance - totalBetMoney;
                            session.setAttribute("userBalance", userBalance);
                            %>
                            <p class='lead'>무승부 배팅 금액: <%= tieBetMoney %> 원</p>
                            <p class='lead'>플레이어 배팅 금액: <%= playerBetMoney %> 원</p>
                            <p class='lead'>뱅커 배팅 금액: <%= bankerBetMoney %> 원</p>
                            <p class='lead'>총 배팅 금액: <%= totalBetMoney %> 원</p>
                            <p class='lead'>배팅 후 잔액: <%= userBalance %> 원</p>

                            <%
                            String resultIndexStr = request.getParameter("resultIndex");

                            if (resultIndexStr != null) {
                                int resultIndex = Integer.parseInt(resultIndexStr);
                                int userBalance_process = (Integer) session.getAttribute("userBalance");
                                int reset = 0;
                                if (resultIndex == 0) {
                                    int tieBetMoney_process = (Integer) session.getAttribute("tieBetMoney");
                                    userBalance_process += tieBetMoney_process * 7;
                                    out.println("<p class='lead text-success'>무승부</p>");
                                    out.println("<p class='lead'>업데이트 될 잔액: " + userBalance_process + " 원</p>");
                                } else if (resultIndex == 1) {
                                    int playerBetMoney_process = (Integer) session.getAttribute("playerBetMoney");
                                    userBalance_process += playerBetMoney_process * 2;
                                    out.println("<p class='lead text-success'>플레이어 승</p>");
                                    out.println("<p class='lead'>업데이트 될 잔액: " + userBalance_process + " 원</p>");
                                } else if (resultIndex == 2) {
                                    int bankerBetMoney_process = (Integer) session.getAttribute("bankerBetMoney");
                                    userBalance_process += bankerBetMoney_process * 2;
                                    out.println("<p class='lead text-success'>뱅커 승</p>");
                                    out.println("<p class='lead'>업데이트 될 잔액: " + userBalance_process + " 원</p>");
                                } else {
                                    out.println("<p class='lead text-danger'>잘못된 결과</p>");
                                }

                                session.setAttribute("userBalance", userBalance_process);
                                session.setAttribute("tieBetMoney", reset);
                                session.setAttribute("playerBetMoney", reset);
                                session.setAttribute("bankerBetMoney", reset);

                                // userBalance를 데이터베이스에 업데이트
                                PreparedStatement pstmt = null;
                                try {
                                    String updateSql = "UPDATE users SET balance = ? WHERE id = ?";
                                    pstmt = conn.prepareStatement(updateSql);
                                    pstmt.setInt(1, userBalance_process);
                                    pstmt.setString(2, userId);
                                    pstmt.executeUpdate();
                                } catch (Exception e) {
                                    out.println("<p class='lead text-danger'>잔액 업데이트 실패: " + e.getMessage() + "</p>");
                                } finally {
                                    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                                }
                            } else {
                                out.println("<p class='lead'>결과가 없습니다.</p>");
                            }
                            %>
                        </div>
                    </div>
                    <div class="card mt-4">
                        <div class="card-header">
                            배팅 입력
                        </div>
                        <div class="card-body">
                            <form action="baccarat.jsp" method="post">
                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label for="playerBetMoney">플레이어 배팅 금액:</label>
                                        <input type="number" name="playerBetMoney" id="playerBetMoney" class="form-control" value="0" readonly>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="tieBetMoney">무승부 배팅 금액:</label>
                                        <input type="number" name="tieBetMoney" id="tieBetMoney" class="form-control" value="0" readonly>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="bankerBetMoney">뱅커 배팅 금액:</label>
                                        <input type="number" name="bankerBetMoney" id="bankerBetMoney" class="form-control" value="0" readonly>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary">배팅</button>
                                <button type="reset" class="btn btn-secondary">취소</button>
                            </form>
                        </div>
                    </div>
                    <div class="chip-selection">
                        <div id="chip-1000" class="chip chip-1000" onclick="selectChip(1000)"></div>
                        <div id="chip-5000" class="chip chip-5000" onclick="selectChip(5000)"></div>
                        <div id="chip-10000" class="chip chip-10000" onclick="selectChip(10000)"></div>
                    </div>
                    <div class="bet-area">
                        <div id="playerBetArea" class="player" onclick="placeBet('player')">
                            <span>플레이어</span>
                        </div>
                        <div id="tieBetArea" class="tie" onclick="placeBet('tie')">
                            <span>무승부</span>
                        </div>
                        <div id="bankerBetArea" class="banker" onclick="placeBet('banker')">
                            <span>뱅커</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%
        // 데이터베이스 연결을 메인 블록의 마지막에서 해제합니다.
        if (conn != null) try { conn.close(); } catch (SQLException e) { /* 무시 */ }
    %>
</body>
</html>
