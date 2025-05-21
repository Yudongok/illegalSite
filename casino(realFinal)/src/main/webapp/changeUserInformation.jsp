<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import ="java.util.Date" %>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
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
            margin-top: 50px;	
        }
        .login-form {
            background-color: rgba(0, 0, 0, 0.85);
            padding: 30px;
            border-radius: 15px;
            width: 340px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            margin-bottom: 20px;
        }
        .login-form .form-label {
            color: #adb5bd;
        }
        .login-form .form-group {
    		margin-bottom: 20px; /* 수정 */
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
<%
	String sessionId = (String) session.getAttribute("userId");
%>
<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/CasinoDB"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM USERS WHERE ID=?
   <sql:param value="<%=sessionId%>" />
</sql:query>	
<title>회원 수정</title>
</head>
<jsp:include page="/menu.jsp" />
<body class="bg-dark text-white">
<div class="main_image">
    <h1 class="main_text">회원정보 변경/탈퇴</h1>
    <div class="login-form">
        <form name="loginForm" method="post" action="processUpdateMember.jsp" onsubmit ="return checkForm()">
            <div class="mb-3">
                <label for="userId" class="form-label">ID</label>
                <input type="text" class="form-control" id="userId" name="id">
            </div>
            <div class="mb-3">
                <label for="userPassword" class="form-label">Password</label>
                <input type="password" class="form-control" id="userPassword" name="passwd" placeholder="userPassword">
            </div>
            <div class="mb-3">
                <label for="userPassword_confirm" class="form-label">Password Confirm</label>
                <input type="password" class="form-control" id="userPassword_confirm" name="passwd" placeholder="userPassword_confirm">
            </div>
            <div class="form-group">
                <label for="name">이름:</label>
                <input type="text" class="form-control" id="name" name="name">
            </div>
            <button type="submit" class="btn btn-primary w-100 mb-2">회원수정</button>
            <a href="deleteMember.jsp" class="btn btn-danger w-100">회원탈퇴</a>
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
<script type="text/javascript">
		function checkForm() {
    		var form = document.loginForm; // 폼 요소 참조

    		if (!form.id.value) {
        		alert("아이디를 입력하세요.");
        		return false;
    		}
    		if (!form.userPassword.value) { // 비밀번호 입력 확인
        		alert("비밀번호를 입력하세요.");		
        		return false;
    		}
    		if (form.userPassword.value !== form.userPassword_confirm.value) { // 비밀번호 확인
        		alert("비밀번호를 동일하게 입력하세요.");
        		return false;
    		}
		}

</script>