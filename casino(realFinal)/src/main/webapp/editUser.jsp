<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            width: 100%;
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
        .form-container {
            margin-top: 150px;
            display: flex;
            justify-content: center;
        }
        .form-card {
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 500px;
            width: 100%;
        }
        .form-group label {
            font-weight: bold;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            width: 100%;
        }
    </style>
</head>
<body>
    <%
        String name = (String) session.getAttribute("userName");
        Integer balance = (Integer) session.getAttribute("userBalance");
    %>
    <header class="pb-3 mb-4 border-bottom header">
        <div class="container">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                <a href="./main.jsp" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-decoration-none logo">
                    <svg width="32" height="32" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
                        <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z"/>
                        <path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6Z"/>
                    </svg>
                    <span class="fs-4 ms-2">Home</span>
                </a>
                
                <ul class="nav nav-pills">
                    <li class="nav-item"><a href="./sadari.jsp" class="nav-link">사다리</a></li>
                    <li class="nav-item"><a href="./baccarat.jsp" class="nav-link">바카라</a></li>
                    <li class="nav-item"><a href="./changeUserInformation.jsp" class="nav-link">회원정보 변경/탈퇴</a></li>
                    <li class="nav-item"><a href="./chargeMoney.jsp" class="nav-link">충전/문의 게시판</a></li>
                    <li class="nav-item"><a href="./usersInfo.jsp" class="nav-link">회원정보</a></li>
                    <li class="nav-item"><a href="./usersRequest.jsp" class="nav-link">게시판 처리</a></li>
                </ul>
                <div class="user-info">
                    <span>환영합니다, <%= name %> 님</span>
                    <span>잔액: <%= balance %> 원</span>
                </div>
            </div>
        </div>
    </header>
    <div class="form-container">
        <div class="form-card">
            <h3 class="text-center mb-4">회원 정보 수정</h3>
            <form method="post" action="editUser_process.jsp">
                <div class="form-group mb-3">
                    <label for="id">아이디</label>
                    <input type="text" class="form-control" name="id" id="id" required>
                </div>
                <div class="form-group mb-3">
                    <label for="passwd">비밀번호</label>
                    <input type="password" class="form-control" name="passwd" id="passwd" required>
                </div>
                <div class="form-group mb-3">
                    <label for="name">이름</label>
                    <input type="text" class="form-control" name="name" id="name" required>
                </div>
                <div class="form-group mb-3">
                    <label for="balance">잔액</label>
                    <input type="number" class="form-control" name="balance" id="balance" required>
                </div>
                <button type="submit" class="btn btn-primary">전송</button>
            </form>
        </div>
    </div>
</body>
</html>
