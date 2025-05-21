<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.util.*"%>
<%@ page import="mvc.model.BoardDTO"%>
<%
    String sessionId = (String) session.getAttribute("userId");
    String userName = (String) session.getAttribute("userName");
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>글쓰기</title>
<script type="text/javascript">
    function checkForm() {
        if (document.newWrite.subject.value == "") {
            alert("제목을 선택하세요.");
            return false;
        }
        if (document.newWrite.content.value == "") {
            alert("내용을 입력하세요.");
            return false;
        }
        return true;
    }
</script>
</head>
<body>
<%@ include file="/menu.jsp"%> 
<div class="container py-4">
    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">글쓰기</h1>
            <p class="col-md-8 fs-4">Write</p>      
        </div>
    </div>

    <div class="row align-items-md-stretch text-center">      
        <form name="newWrite" action="BoardWriteAction.do" method="post" onsubmit="return checkForm()">
            <input name="id" type="hidden" value="<%= sessionId %>">
            <div class="mb-3 row">
                <label class="col-sm-2 control-label">아이디</label>
                <div class="col-sm-3">
                    <input name="name" type="text" class="form-control" value="<%= userName %>" readonly>
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2 control-label">제목</label>
                <div class="col-sm-5">
                    <select name="subject" class="form-control">
                        <option value="">-- 선택하세요 --</option>
                        <option value="[고객 문의]">[고객 문의]</option>
                        <option value="[충전]">[충전]</option>
                        <option value="[환전]">[환전]</option>
                    </select>
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2 control-label">내용</label>
                <div class="col-sm-8">
                    <textarea name="content" cols="50" rows="5" class="form-control"></textarea>
                </div>
            </div>
            <div class="mb-3 row">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="submit" class="btn btn-primary" value="등록">
                    <input type="reset" class="btn btn-primary" value="취소">
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
