<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
        <script src="/room/resources/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    </head>
    
    <body>
    	  <jsp:include page="/WEB-INF/views/modules/navbar.jsp" />
    	  
        <div class="container-fluid">
                     <div class="row-fluid">
                     <div class="span12">
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">레시피 공유</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                    
  									<table class="table" >
										<thead>
											<tr>
												<th>글번호</th>
												<th>제목</th>
												<th>글쓴이</th>
												<th>작성일</th>
												<th>조회수</th>
											</tr>
										</thead>
										<tbody>
									<c:forEach var="board" items="${ requestScope.cookboardList }">
										<tr>
											<td>${ board.boardNo }</td>
											<td>
											<c:choose>
											<c:when test="${ board.deleted }">
												<span style="color:lightgray">[삭제된 글]</span>
											</c:when>
											<c:otherwise>
												<a href='detail?boardNo=${ board.boardNo }&pageNo=${pageNo}'>
												${ board.title }
												</a>
											</c:otherwise>
											</c:choose>
											</td>
											<td>${board.writer}</td>
											<td>${ board.regDate }</td>
											<td>${ board.readCount }</td>
										</tr>
									</c:forEach>
											
										</tbody>
										
									</table>
									${ pager }
                                </div>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>
                    
                    <a href="write"><button class="btn btn-primary"><i class="icon-pencil icon-white"></i> 작성</button></a>
                    </div>
                </div>
                
       
            
            <hr>
            <footer>
                 <p onclick=window.open("/room/")>&copy; 우리들의 자취방 생활</p>
            </footer>
      
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