<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.BoardDTO"%>
<%
    String sessionId = (String) session.getAttribute("userId");
    List<BoardDTO> boardList = (List<BoardDTO>) request.getAttribute("boardlist");
    int total_record = (Integer) request.getAttribute("total_record");
    int pageNum = (Integer) request.getAttribute("pageNum");
    int total_page = (Integer) request.getAttribute("total_page");

%>
<html>
<head>

<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>Board</title>
<script type="text/javascript">
    function checkForm() {    
        var sessionId = "<%= sessionId %>";
        if (sessionId == null || sessionId === "") {
            alert("로그인 해주세요.");
            return false;
        }

        location.href = "./BoardWriteForm.do?id=" + sessionId;
    }
</script>
</head>
<body> 
<%@ include file="/menu.jsp"%> 
<div class="container py-4">
    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">충전/문의 게시판</h1>	 
            <h2 class="fw-bold">입금 계좌: 카카오뱅크 3333-14-273-0153 류재홍</h2>   
        </div>
    </div>
    
    <div class="row align-items-md-stretch text-center">     
        <form action="BoardListAction.do" method="post">            
            <div class="text-end"> 
                <span class="badge text-bg-success">전체 <%= total_record %>건</span>
            </div>      
            <div style="padding-top: 20px">
                <table class="table table-hover text-center">
                    <tr>
                        <th>번호</th><th>제목</th><th>작성일</th><th>조회</th><th>글쓴이</th>
                    </tr>
                    <% if (boardList != null && !boardList.isEmpty()) { 
                        for (BoardDTO notice : boardList) { %>
                            <tr>
                                <td><%= notice.getNum() %></td>
                                <td><a href="BoardViewAction.do?num=<%= notice.getNum() %>&pageNum=<%= pageNum %>"><%= notice.getSubject() %></a></td>
                                <td><%= notice.getRegister_day() %></td>
                                <td><%= notice.getHit() %></td>
                                <td><%= notice.getName() %></td>
                            </tr>
                    <%   } 
                    } else { %>
                        <tr>
                            <td colspan="5">게시글이 없습니다.</td>
                        </tr>
                    <% } %>
                </table>
            </div>
            <div align="center">
                <% for (int i = 1; i <= total_page; i++) { %>
                    <a href="BoardListAction.do?pageNum=<%= i %>">
                        <% if (pageNum == i) { %>
                            <font color='4C5317'><b> [<%= i %>] </b></font>
                        <% } else { %>
                            <font color='4C5317'> [<%= i %>] </font>
                        <% } %>
                    </a>
                <% } %>
            </div>          
            <div class="py-3" align="right">                         
                <a href="#" onclick="checkForm(); return false;" class="btn btn-primary">&laquo;글쓰기</a>                
            </div>          
            <div align="left">               
                <select name="items" class="txt">
                    <option value="subject">제목에서</option>
                    <option value="content">본문에서</option>
                    <option value="name">글쓴이에서</option>
                </select> <input name="text" type="text" /> <input type="submit" id="btnAdd" class="btn btn-primary" value="검색" />                
            </div>
            
        </form>            
    </div>
</div>
</body>
</html>
