<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import ="java.util.Date" %>
<html>
<head>    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Online Casino</title>
    <style>
        .main_image {
            position: relative;
            width: 100vw;
            height: 100vh;
            background-size: cover;
        }
        .main_image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .main_text {
            position: absolute;
            top: 20%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            font-family: lighter;
            font-size: 70px;
        }
        .login-form {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: rgba(0, 0, 0, 0.7);
            padding: 20px;
            border-radius: 10px;
            width: 300px;
            color: white;
        }
        .logout-link{
            position: absolute;
      	    top: 10px;
        	right: 20px;
        }
    </style>
</head>
<body class="bg-dark text-white">
<div class="main_image">
    <img src="./resources/images/background1.jpg" class="img-fluid"/>
    <h1 class="main_text">Online Casino</h1>
    <a href = "logout.jsp" class = "btn btn-sm btn-danger logout-link">logout</a>
    <div class="position-absolute bottom-0 start-50 translate-middle-x text-white bg-dark bg-opacity-50 w-100 text-center py-2">
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
            String CT = hour + ":" + minute + " " + am_pm;
            out.println(CT);
        %>
    </div>
</div>
</body>
</html>
