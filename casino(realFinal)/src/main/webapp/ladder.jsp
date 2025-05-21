<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Ladder Game</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #2d2d2d;
            color: #f4f4f9;
            margin: 0;
            padding: 0;
            padding-top: 60px;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
        }
		.main_image {
            position: relative;
            width: 100vw;
            height: 100vh;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            background-image: url('./resources/images/background1.jpg');
        }

        p {
            color: #36FFD7;
            font-family: "Noto Sans KR", sans-serif;
            
        }

        .main-container {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            background-color: #3b3b3b;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 1000px;
            text-align: center;
            margin-top: 80px;
        }

        .ladder-container {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            margin-right: 30px;
        }

        .ladder {
            position: relative;
            width: 300px;
            height: 400px;
            margin-top: 30px;
            margin-bottom: 20px;
            background-color: #4b4b5e;
            border-radius: 8px;
            padding: 10px;
        }

        .ladder .col {
            position: absolute;
            top: 0;
            bottom: 0;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .ladder .col.left {
            left: 0;
        }

        .ladder .col.right {
            right: 0;
        }

        .ladder .step {
            width: 4px;
            background-color: #00adb5;
            flex-grow: 1;
        }

        .ladder .connector {
            width: calc(100% - 8px); /* Adjusting the width to match the gap between the vertical columns */
            height: 4px;
            background-color: #00adb5;
            position: absolute;
            left: 4px; /* Adjusting the left position to align within the ladder container */
        }

        .ladder .start, .ladder .end {
            width: 50px;
            height: 50px;
            background-color: #f44336;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
            font-weight: bold;
            position: absolute;
            font-size: 20px;
        }

        .ladder .start.left {
            left: -20px;
            top: -20px;
            font-family: "Noto Sans KR", sans-serif;
            
        }

        .ladder .start.right {
            right: -20px;
            top: -20px;
            font-family: "Noto Sans KR", sans-serif;
        }

        .ladder .end.left {
            left: -20px;
            bottom: -20px;
            font-family: "Noto Sans KR", sans-serif;
        }

        .ladder .end.right {
            right: -20px;
            bottom: -20px;
            font-family: "Noto Sans KR", sans-serif;
        }

        .ladder .start.active, .ladder .end.active {
            background-color: #28a745;
        }

        .betting-form-container {
            flex: 1;
            margin-left: 30px;
            background-color: #4b4b5e;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            font-family: "Noto Sans KR", sans-serif;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        label, select, input {
            margin-bottom: 10px;
            width: 100%;
        }

        label {
            color: #36FFD7;
 			font-family: "Noto Sans KR", sans-serif;
            
        }
        

        select, input[type="number"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #3b3b3b;
            color: #f4f4f9;
        }

        input[type="submit"], .betting-complete {
            padding: 10px;
            background-color: #00adb5;
            color: #f4f4f9;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        input[type="submit"]:hover, .betting-complete:hover {
            background-color: #00a1a5;
        }

        .betting-complete {
            background-color: #dc3545;
            text-align: center;
        }

        .bet-result-container {
            background-color: #4b4b5e;
            border-radius: 8px;
            padding: 20px;
            margin-top: 10px;
            text-align: center;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 400px;
            color: #f4f4f9;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
            font-family: "Noto Sans KR", sans-serif;
        }

        .refresh-timer {
            font-size: 1.2em;
            color: #f4f4f9;
            margin-top: 10px;
            font-family: "Noto Sans KR", sans-serif;
        }

    </style>
    <script>
        let refreshInterval = 10;
        let countdown = refreshInterval;
        let isBetSubmitted = false;
        let refreshTimerId;
        let countdownTimerId;

        function refreshLadder() {
            if (!isBetSubmitted) {
                window.location.href = 'ladder_Process.jsp';
            }
        }

        function startTimers() {
            refreshTimerId = setInterval(refreshLadder, refreshInterval * 1000);
            countdownTimerId = setInterval(updateTimer, 1000);
        }

        function stopTimers() {
            clearInterval(refreshTimerId);
            clearInterval(countdownTimerId);
        }

        function updateTimer() {
            document.getElementById('timer').textContent = countdown;
            countdown--;
            if (countdown < 0) {
                countdown = refreshInterval;
                if (isBetSubmitted) {
                    document.getElementById('betForm').submit();
                }
            }
        }

        function submitBet(event) {
            event.preventDefault();
            isBetSubmitted = true;
            stopTimers();
            let betForm = document.getElementById('betForm');
            let submitButton = betForm.querySelector('input[type="submit"]');
            submitButton.value = "베팅 완료";
            submitButton.classList.add('betting-complete');
            startTimers();
        }

        window.onload = startTimers;
    </script>
</head>
<body>
<%@ include file="menu.jsp"%>
<div class="main_image">
    <div class="main-container">
        <div class="ladder-container">
            <div class="ladder">
                <div class="col left">
                    <div class="step"></div>
                </div>
                <div class="col right">
                    <div class="step"></div>
                </div>
                <%-- 가로줄 그리기 --%>
                <%
                    Integer actualRows = (Integer) session.getAttribute("actualRows");
                    Integer actualStartPosition = (Integer) session.getAttribute("actualStartPosition");
                    String actualResult = (String) session.getAttribute("actualResult");

                    if (actualRows != null) {
                        for (int i = 1; i <= actualRows; i++) {
                            out.print("<div class='connector' style='top:" + (i * (400 / (actualRows + 1))) + "px;'></div>");
                        }
                    }
                %>
                <div class="start left <%= (actualStartPosition != null && actualStartPosition == 0) ? "active" : "" %>">좌</div>
                <div class="start right <%= (actualStartPosition != null && actualStartPosition == 1) ? "active" : "" %>">우</div>
                <div class="end left <%= (actualResult != null && actualResult.equals("odd")) ? "active" : "" %>">홀</div>
                <div class="end right <%= (actualResult != null && actualResult.equals("even")) ? "active" : "" %>">짝</div>
            </div>
            <div class="refresh-timer">
                새로고침까지 남은 시간: <span id="timer">10</span> 초
            </div>
            <%
                String betMessage = (String) session.getAttribute("betMessage");
                if (betMessage != null) {
                    out.print("<div class='bet-result-container'><p>" + betMessage + "</p></div>");
                    session.removeAttribute("betMessage");
                    session.removeAttribute("isBetWin");
                }
            %>
        </div>
        <div class="betting-form-container">
            <%-- 배팅 폼 --%>
            <p>베팅<p>
            <form id="betForm" action="ladder_Process.jsp" method="POST" onsubmit="submitBet(event)">
                <label for="betPosition">시작</label>
                <select name="betPosition" id="betPosition">
                    <option value="left">좌</option>
                    <option value="right">우</option>
                </select><br>

                <label for="betRows">줄</label>
                <select name="betRows" id="betRows">
                    <option value="3">3</option>
                    <option value="4">4</option>
                </select><br>

                <label for="betResult">도착</label>
                <select name="betResult" id="betResult">
                    <option value="odd">홀</option>
                    <option value="even">짝</option>
                </select><br>

                <label for="betAmount">베팅 금액</label>
                <input type="number" name="betAmount" id="betAmount" required><br>

                <input type="submit" value="Bet">
            </form>
        </div>
    </div>
</div>
</body>
</html>
