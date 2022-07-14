<%@ page session="false" pageEncoding="UTF-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js">
    
    <head>
        <title>운영진 추천 게임 게시판</title>
        <!-- Bootstrap -->
        <link href="/room/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="/room/resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="/room/resources/vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
        <link href="/room/resources/assets/styles.css" rel="stylesheet" media="screen">
        <link href="/room/resources/assets/DT_bootstrap.css" rel="stylesheet" media="screen">
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
                        <div class="span12">
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">운영진 추천 게임</div>
                                    <a href="write">
                                    	<button class="btn btn-primary" value="글쓰기"><i class="icon-pencil icon-white"></i>글쓰기</button>
                                    </a>
                                </div>
                                </div>
                                <div class="block-content collapse in">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <td>글번호</td>
                                                <td>글제목</td>
                                                <td>작성자</td>
                                                <td>작성날짜</td>
                                                <th>조회수</th>
                                            </tr>
                                        </thead>
                                        <c:forEach var="board" items="${requestScope.gIboardList}">
										<tbody>
											<tr>
												<td>${board.boardNo}</td>
												<td><c:choose>
														<c:when test="${board.deleted}">
															<span style="color: lightgray">[삭제된 글]</span>
														</c:when>
														<c:otherwise>
															<a href='detail?boardNo=${board.boardNo}'>${board.title}</a>
														</c:otherwise>
													</c:choose></td>
												<td>${board.writer}</td>
												<td>${board.regDate}</td>
												<td>${board.regDate}</td>
											</tr>
										</tbody>
									</c:forEach>
								</table>
                                </div>
                            </div>
                        </div>
            	<div class="pagination">
					<ul>
						<li><a href="#">이전</a></li>
						<li class="active">
							<a href="#">1</a>
						</li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">다음</a></li>
					</ul>
				</div>
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