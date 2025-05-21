<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
    <title>회원가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            overflow: hidden;
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
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
        .form-container {
            background-color: rgba(0, 0, 0, 0.85);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 400px;
            color: white;
        }
        .form-container h1 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 1.8rem;
            color: #f8f9fa;
        }
        .form-container .form-group {
            margin-bottom: 15px;
        }
        .form-container .form-control {
            background-color: #343a40;
            color: #f8f9fa;
            border: none;
            border-radius: 5px;
        }
        .form-container .form-control:focus {
            background-color: #495057;
            color: #f8f9fa;
            box-shadow: none;
            border-color: #80bdff;
        }
        .form-container .btn-primary {
            background-color: #007bff;
            border: none;
            width: 100%;
            padding: 10px;
            font-size: 1rem;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .form-container .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="main_image">
    <div class="form-container">
        <h1>회원가입</h1>
        <form method="post" action="joinNewMember_process.jsp">
            <div class="form-group">
                <label for="id">아이디:</label>
                <input type="text" class="form-control" id="id" name="id">
            </div>
            <div class="form-group">
                <label for="passwd">비밀번호:</label>
                <input type="password" class="form-control" id="passwd" name="passwd">
            </div>
            <div class="form-group">
                <label for="name">이름:</label>
                <input type="text" class="form-control" id="name" name="name">
            </div>
            <div class="form-group">
                <label for="name">추천인코드:</label>
                <input type="text" class="form-control" id="recommenderCode" name="recommenderCode">
            </div>
            <button type="submit" class="btn btn-primary">회원가입</button>
        </form>
    </div>
</div>
</body>
</html>

