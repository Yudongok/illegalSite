<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>baccarat_Process</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<script>
    // 8초마다 페이지를 새로고침하여 반복
    var remainingTime = <%=8%>;
    
    function refreshPage() {
        setInterval(function() {
            if (remainingTime > 0) {
                remainingTime--;
                document.getElementById("timer").innerText = "갱신까지 남은 시간: " + remainingTime + "초";
            } else {
                document.getElementById("resultForm").submit();
            }
        }, 1000);
    }
    
    window.onload = refreshPage;
</script>
<style>
    body {
        background-color: #121212;
        color: #E0E0E0;
    }
    .card {
        margin: 20px;
        padding: 20px;
        border-radius: 10px;
        background-color: #1E1E1E;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }
    .card-header {
        font-size: 1.5rem;
        font-weight: bold;
        background-color: #333;
        color: white;
        border-radius: 10px 10px 0 0;
    }
    .card-body {
        font-size: 1.0rem;
    }
    .lead {
        font-size: 1.1rem;
    }
    #timer {
        font-size: 1.3rem;
        font-weight: bold;
        color: red;
    }
    .card-row {
        display: flex;
        justify-content: space-around;
        align-items: center;
    }
    .card-content {
        flex: 1;
        text-align: center;
    }
</style>
</head>
<body>
    <%
        int playerCard1 = (int)(Math.random() * 9) + 1;
        int playerCard2 = (int)(Math.random() * 9) + 1;
        int bankerCard1 = (int)(Math.random() * 9) + 1;
        int bankerCard2 = (int)(Math.random() * 9) + 1;
        int resultIndex;

        int playerTotal = (playerCard1 + playerCard2) % 10;
        int bankerTotal = (bankerCard1 + bankerCard2) % 10;

        String result;
        if (playerTotal > bankerTotal) {
            result = "Player Win";
            resultIndex = 1;
        } else if (playerTotal < bankerTotal) {
            result = "Banker Win";
            resultIndex = 2;
        } else {
            result = "Tie";
            resultIndex = 0;
        }
    %>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card text-center">
                    <div class="card-header">
                        바카라 게임 결과
                    </div>
                    <div class="card-body">
                        <div class="card-row">
                            <div class="card-content">
                                <h5>플레이어 카드</h5>
                                <p class="lead">카드 1: <%= playerCard1 %></p>
                                <p class="lead">카드 2: <%= playerCard2 %></p>
                            </div>
                            <div class="card-content">
                                <h5>뱅커 카드</h5>
                                <p class="lead">카드 1: <%= bankerCard1 %></p>
                                <p class="lead">카드 2: <%= bankerCard2 %></p>
                            </div>
                        </div>
                        <div class="mt-4">
                            <p class="lead">플레이어 점수: <strong><%= playerTotal %></strong></p>
                            <p class="lead">뱅커 점수: <strong><%= bankerTotal %></strong></p>
                            <p class="lead">결과: <strong><%= result %></strong></p>
                        </div>
                        <p id="timer" class="lead">갱신까지 남은 시간: <%=8 %>초</p>
                        <form id="resultForm" action="baccarat.jsp" method="POST">
                            <input type="hidden" name="resultIndex" value="<%= resultIndex %>">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>