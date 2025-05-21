<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Online Casino</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            width: 100%;
        }
        .main_image {
            position: relative;
            width: 100%;
            height: calc(100vh - 100px); /* Adjusted height to make room for the banner */
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            background-image: url('./resources/images/background1.jpg');
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
        .content {
            padding: 20px;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 40px; /* Increased gap between images */
            margin-top: 80px; /* Adjust this value if necessary */
        }
        .image-container {
            position: relative;
            display: inline-block;
            width: 300px; /* Increased image size */
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
            height: 100px; /* Set the height of the banner */
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
    </style>
</head>
<body>
	<%@ include file="menu.jsp"%> 
    <a href = "logout.jsp" class = "btn btn-sm btn-danger logout-link">logout</a>
    <div class="main_image">
        <div class="content">
            <a href="./ladder.jsp" class="image-container">
                <img src="./resources/images/sadari.jpg" alt="Sadari">
                <div class="overlay">사다리게임</div>
            </a>
            <a href="./baccarat.jsp" class="image-container">
                <img src="./resources/images/baccarat.jpg" alt="Baccarat">
                <div class="overlay">바카라</div>
            </a>
        </div>
    </div>
    <div class="banner">
        <img src="./resources/images/banner1.gif" alt="Banner 1" class="img-fluid">
        <img src="./resources/images/banner2.gif" alt="Banner 2" class="img-fluid">
        <img src="./resources/images/banner3.gif" alt="Banner 3" class="img-fluid">
        <img src="./resources/images/banner4.jpg" alt="Banner 4" class="img-fluid">
    </div>
</body>
</html>
