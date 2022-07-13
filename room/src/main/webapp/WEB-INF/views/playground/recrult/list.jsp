<%@ page session="false" pageEncoding="UTF-8" contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html class="no-js">
    
    <head>
        <title>운영진 추천 게임 게시판</title>
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
                        <div class="span12">
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">운영진 추천 게임</div>
                                    <div align="right">
                                    <a href="write">
                                    	<button class="btn btn-primary" value="글쓰기"><i class="icon-pencil icon-white"></i>글쓰기</button>
                                    </a>
                                    </div>
                                </div>
                                </div>
                                <div class="block-content collapse in">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>board_no</th>
                                                <th>title</th>
                                                <th>writer</th>
                                                <th>regdate</th>
                                                <th>readcount</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>ㅁㅁㅁㅁ</td>
                                                <td>Otto</td>
                                                <td>@mdo</td>
                                                <th>1</th>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Jacob</td>
                                                <td>Thornton</td>
                                                <td>@fat</td>
                                                <th>2</th>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Vincent</td>
                                                <td>Gabriel</td>
                                                <td>@gabrielva</td>
                                                <th>3</th>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
            	<hr>
            	<div class="pagination" align="right">
					<ul>
						<li><a href="#">이전</a></li>
						<li class="active">
							<a href="#">1</a>
						</li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
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