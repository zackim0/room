<%@ page session="false" pageEncoding="UTF-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html class="no-js">
    
    <head>
        <title>Home Page</title>
        <!-- Bootstrap -->
        <link href="/room/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="/room/resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="/room/resources/vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
        <link href="/room/resources/assets/styles.css" rel="stylesheet" media="screen">
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    </head>
    
    <body>

    
    <jsp:include page="/WEB-INF/views/modules/navbar.jsp" /> 
    
        <div class="container-fluid">
            <div class="row-fluid">
                
                <!--/span-->
                <div class="span12" id="content">

                    <div class="row-fluid">
                        <div class="span6">
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">룸메이트 구하기</div>
                                    <div class="pull-right">
	                                    <a class="badge badge-info" href="/room/mate-board/list">
	                                    <i class="icon-eye-open icon-white"></i>
	                                    &nbsp;더보기
                                    </a>
                                    </div>
                                </div>
                                <div class="block-content collapse in">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                            	<th>글 번호</th>
                                                <th>제목</th>
                                                <th>작성자</th>
                                                <th>조회수</th>
                                                <th>작성일</th>
                                            </tr>
                                        </thead>
                                        <c:forEach var="board" items="${requestScope.mateBoardRecentList}">
	                                        <tbody>
	                                            <tr>
	                                            	<td>${ board.boardNo }</td>
	                                                <td>
                                               			<a href='/room/mate-board/detail?boardNo=${board.boardNo}&pageNo=1'>${board.title}</a>
	                                                </td>
	                                                <td>${board.writer}</td>
	                                                <td>${board.readCount}</td>
	                                                <td>${board.regDate}</td>
	                                            </tr>
	                                        </tbody>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                            <!-- /block -->
                        </div>
                        <div class="span6">
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">패션 정보 게시판</div>
                                    <div class="pull-right"><a class="badge badge-info" href="/room/fashion-board/list">더보기</a>

                                    </div>
                                </div>
                                <div class="block-content collapse in">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                            	<th>글 번호</th>
                                                <th>제목</th>
                                                <th>작성자</th>
                                                <th>조회수</th>
                                                <th>작성일</th>
                                            </tr>
                                        </thead>
                                        <c:forEach var="board" items="${requestScope.fboardRecentList}">
	                                        <tbody>
	                                            <tr>
	                                            	<td>${ board.boardNo }</td>
	                                                <td>
                                               			<a href='/room/fashion-board/detail?boardNo=${board.boardNo}&pageNo=1'>${board.title}</a>
	                                                </td>
	                                                <td>${board.writer}</td>
	                                                <td>${board.regDate}</td>
	                                                <td>${board.regDate}</td>
	                                            </tr>
	                                        </tbody>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                            <!-- /block -->
                        </div>
                        
                    </div>
                    
                    <div class="row-fluid">
                        <div class="span6">
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">게임 소개</div>
                                    <div class="pull-right"><a class="badge badge-info" href="/room/playground/gameintroduce/list">더보기</a>

                                    </div>
                                </div>
                                <div class="block-content collapse in">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                            	<th>글 번호</th>
                                                <th>제목</th>
                                                <th>작성자</th>
                                                <th>조회수</th>
                                                <th>작성일</th>
                                            </tr>
                                        </thead>
                                        <c:forEach var="board" items="${requestScope.gIboardRecentList}">
	                                        <tbody>
	                                            <tr>
	                                            	<td>${ board.boardNo }</td>
	                                                <td>
                                               			<a href='/room/playground/gameintroduce/detail?boardNo=${board.boardNo}&pageNo=1'>${board.title}</a>
	                                                </td>
	                                                <td>${board.writer}</td>
	                                                <td>${board.regDate}</td>
	                                                <td>${board.regDate}</td>
	                                            </tr>
	                                        </tbody>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                            <!-- /block -->
                        </div>
                        <div class="span6">
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">게임 소개</div>
                                    <div class="pull-right"><a class="badge badge-info" href="/room/playground/gameintroduce/list">더보기</a>

                                    </div>
                                </div>
                                <div class="block-content collapse in">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                            	<th>글 번호</th>
                                                <th>제목</th>
                                                <th>작성자</th>
                                                <th>조회수</th>
                                                <th>작성일</th>
                                            </tr>
                                        </thead>
                                        <c:forEach var="board" items="${requestScope.gIboardRecentList}">
	                                        <tbody>
	                                            <tr>
	                                            	<td>${ board.boardNo }</td>
	                                                <td>
                                               			<a href='/room/playground/gameintroduce/detail?boardNo=${board.boardNo}&pageNo=1'>${board.title}</a>
	                                                </td>
	                                                <td>${board.writer}</td>
	                                                <td>${board.regDate}</td>
	                                                <td>${board.regDate}</td>
	                                            </tr>
	                                        </tbody>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                            <!-- /block -->
                        </div>
                        
                    </div>
                    
                    
                </div>
            </div>
            <hr>
            <footer>
                <p onclick=window.open("/room/")>&copy; 우리들의 자취방 생활</p>
            </footer>
        </div>
        <!--/.fluid-container-->
        <script src="/room/resources/vendors/jquery-1.9.1.min.js"></script>
        <script src="/room/resources/bootstrap/js/bootstrap.min.js"></script>
        <script src="/room/resources/vendors/easypiechart/jquery.easy-pie-chart.js"></script>
        <script src="/room/resources/assets/scripts.js"></script>
        <script>
        $(function() {
            // Easy pie charts
            $('.chart').easyPieChart({animate: 1000});
        });
        </script>
    </body>

</html>