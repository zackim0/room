<%@page import="com.room.dto.FBoard"%>
<%@page import="java.util.List"%>
<%@ page session="false" pageEncoding="UTF-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    
    <head>
        <title>Tables</title>
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
                                <div class="muted pull-left">패션정보</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
								[&nbsp;<a href ="write">글 작성</a>&nbsp;]
								<table class="table">
									<thead>
										<tr>
											<th>글번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일</th>
										</tr>
									</thead>
									<c:forEach var="board" items="${requestScope.fboardList}">
										<tbody>
											<tr>
												<td>${board.boardNo }</td>
												<td><c:choose>
														<c:when test="${board.deleted}">
															<span style="color: lightgray">${board.title} [삭제된 글]</span>
														</c:when>
														<c:otherwise>
															<a href='detail?boardNo=${board.boardNo}&pageNo=${pageNo}'>
															${board.title}
															</a>
														</c:otherwise>
													</c:choose>
												</td>
												<td>${board.writer}</td>
												<td>${board.regDate}</td>
											</tr>
										</tbody>
									</c:forEach>
								</table>
									
									<br><br>
									
									${ pager }


							</div>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>

                   

                    
											
            </div>
            <hr>
            <footer>
                <p>&copy; Vincent Gabriel 2013</p>
            </footer>
        </div>
        </div>
        <!--/.fluid-container-->

        <script src="/room/resources/vendors/jquery-1.9.1.js"></script>
        <script src="/room/resources/bootstrap/js/bootstrap.min.js"></script>
        <script src="/room/resources/vendors/datatables/js/jquery.dataTables.min.js"></script>


        <script src="/room/resources/assets/scripts.js"></script>
        <script src="/room/resources/assets/DT_bootstrap.js"></script>
        <script>
      
        </script>
    </body>

</html>