<%@ page session="false" pageEncoding="UTF-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    
    <head>
        <title>반려견 목록</title>
        <!-- Bootstrap -->
        <link href="/room/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="/room/resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="/room/resources/assets/styles.css" rel="stylesheet" media="screen">
        <link href="/room/resources/assets/DT_bootstrap.css" rel="stylesheet" media="screen">
        <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="vendors/flot/excanvas.min.js"></script><![endif]-->
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
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">반려견 게시판</div>
                                <div class="muted pull-right"><button class="btn btn-normal btn-primary" id="write" type="submit">글쓰기</button></div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">

								<table class="table">
									<thead>
										<tr>
											<th>글번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일</th>
										</tr>
									</thead>
									<c:forEach var="board" items="${requestScope.petBoardList}">
										<tbody>
											<tr>
												<td>${board.boardNo }</td>
												<td><c:choose>
														<c:when test="${board.deleted}">
															<span style="color: lightgray">[삭제된 글입니다]</span>
														</c:when>
														<c:otherwise>
															<a href='detail?boardNo=${board.boardNo}&pageNo=${ pageNo }'>${board.title}</a>
														</c:otherwise>
													</c:choose></td>
												<td>${board.writer}</td>
												<td>${board.regDate}</td>
											</tr>
										</tbody>
									</c:forEach>
								</table>
							<div class="pagination">
								<ul>
									<li>
										${ pager }
									</li>
								</ul>
							</div>
							</div>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>

                   

                    
											
            </div>
            <hr>

        </div>
        </div>
        <!--/.fluid-container-->

        <script src="/room/resources/vendors/jquery-1.9.1.js"></script>
        <script src="/room/resources/bootstrap/js/bootstrap.min.js"></script>
        <script src="/room/resources/vendors/datatables/js/jquery.dataTables.min.js"></script>
        <script src="/room/resources/assets/scripts.js"></script>
        <script src="/room/resources/assets/DT_bootstrap.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script type="text/javascript">
        $(function() {
        	$('#write').on('click',function(event) {
        		event.preventDefault();
        		location.href = 'write';
        	});
        });
        </script>
    </body>

</html>