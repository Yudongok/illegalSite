<%@ page contentType="text/html; charset=utf-8" %> 
<html>
<head>
<title>아이디 에러</title>
<style>
    body {
        font-family: 'Noto Sans KR', sans-serif;
        background-color: #f8f9fa;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .error-container {
        background-color: #ffffff;
        border: 1px solid #dee2e6;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        text-align: center;
    }

    .error-message {
        color: red;
        font-weight: bold;
        margin-top: 10px;
        margin-bottom: 20px;
    }

    .btn {
        display: inline-block;
        font-weight: 400;
        color: #212529;
        text-align: center;
        vertical-align: middle;
        user-select: none;
        background-color: transparent;
        border: 1px solid transparent;
        padding: 0.375rem 0.75rem;
        font-size: 1rem;
        line-height: 1.5;
        border-radius: 0.25rem;
        transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    }

    .btn-secondary {
        color: #fff;
        background-color: #6c757d;
        border-color: #6c757d;
    }

    .btn-secondary:hover {
        color: #fff;
        background-color: #5a6268;
        border-color: #545b62;
    }

    .w-100 {
        width: 100%;
    }
</style>
</head>
<body>
    <div class="error-container">
        <div class="error-message">아이디가 일치하지 않습니다. 다시 시도해 주세요.</div>
        <a href="login.jsp" class="btn btn-secondary w-100">다시 로그인하러 가기</a>
    </div>
</body>
</html>
