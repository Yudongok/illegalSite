<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import ="java.util.Date" %>
<html>
<head>    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Online Casino</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            overflow: hidden;
            font-family: Arial, sans-serif;
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
        .main_text {
            color: #f8f9fa;
            font-family: 'Helvetica Neue', sans-serif;
            font-size: 4rem;
            font-weight: 300;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
            margin-bottom: 1rem;
            text-align: center;
        }
        .login-form {
            background-color: rgba(0, 0, 0, 0.85);
            padding: 30px;
            border-radius: 15px;
            width: 350px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .login-form .form-label {
            color: #adb5bd;
        }
        .login-form .form-control {
            background-color: #343a40;
            color: #f8f9fa;
            border: none;
        }
        .login-form .form-control:focus {
            background-color: #495057;
            color: #f8f9fa;
        }
        .login-form .btn-primary {
            background-color: #007bff;
            border: none;
        }
        .login-form .btn-primary:hover {
            background-color: #0056b3;
        }
        .current-time {
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            background-color: rgba(0, 0, 0, 0.7);
            padding: 10px 20px;
            border-radius: 10px 10px 0 0;
            color: #f8f9fa;
            font-size: 1.2rem;
        }
    </style>
</head>
<body class="bg-dark text-white">
<div class="main_image">
    <h1 class="main_text">Online Casino</h1>
    <div class="login-form">
        <form name="loginForm" method="post" action="login_process.jsp">
            <div class="mb-3">
                <label for="userId" class="form-label">ID</label>
                <input type="text" class="form-control" id="userId" name="id">
            </div>
            <div class="mb-3">
                <label for="userPassword" class="form-label">Password</label>
                <input type="password" class="form-control" id="userPassword" name="passwd" placeholder="userPassword">
            </div>
            <button type="submit" class="btn btn-primary w-100 mb-2">로그인</button>
            <a href="joinNewMember.jsp" class="btn btn-secondary w-100">회원가입</a>
        </form>
    </div>
    <div class="current-time">
        <%
            Date day = new java.util.Date();
            String am_pm;
            int hour = day.getHours();
            int minute = day.getMinutes();
            if (hour / 12 == 0) {
                am_pm = "AM";
            } else {
                am_pm = "PM";
                hour = hour - 12;
            }
            String CT = hour + ":" + (minute < 10 ? "0" + minute : minute) + " " + am_pm;
            out.println(CT);
        %>
    </div>
</div>
</body>
</html>
