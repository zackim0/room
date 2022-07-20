<%@ page language="java" 
		 contentType="text/html; charset=utf-8"
    	 pageEncoding="utf-8"%>
    	 
<!DOCTYPE html>
<html>
    
    <head>
    	<meta charset="utf-8"/>
        <title>글쓰기 - 번개 모임 게시판</title>
        <!-- Bootstrap -->
        <link rel="stylesheet" type="text/css" href="/room/resources/vendors/bootstrap-wysihtml5/src/bootstrap-wysihtml5.css"></link>
        <link href="/room/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="/room/resources/assets/styles.css" rel="stylesheet" media="screen">
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script src="/room/resources/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    </head>
    
    <body>
        
        <jsp:include page="/WEB-INF/views/modules/navbar.jsp" />
        
        
		                        <!-- block -->
		                        <!-- <div class="block">
		                            <div class="navbar navbar-inner block-header">
		                                <div class="muted pull-left"></div>
		                            </div>
		                            <div class="block-content collapse in">
		                               <textarea id="tinymce_basic"></textarea>
		                            </div>
		                        </div> -->
		            <table>
		            <tr>
			           <form id="writeform" action="write" method="post" enctype="multipart/form-data">
		            	<input type="hidden" name="category" value="recrult">
		                <div class="control-group">
	                <label class="control-label">제목<span class="required">*</span></label>
	                      <div class="controls">
	                        <input type="text" class="span9 m-wrap" id="title" name="title" data-required="1">
	                      </div>
		            </div>
		            <div class="control-group">
		            <label class="control-label" for="date01">작성자</label>
						<div class="controls">
						  <input type="text" class="span3" readonly value="${ loginuser.memberId }">
						<input type="hidden" name="writer" value="${loginuser.memberId}">
						</div>
		            </div>
		            <div class="control-group">
                      <label class="control-label" for="content">내용</label>
                      <div class="controls">
                        <textarea class="input-xlarge textarea" placeholder="내용을 입력하세요 ..." style="width: 810px; height: 200px" id="content" name="content"></textarea>
                      </div>
                    </div>
                    <div class="control-group">
		            <tr>
		            	<th>첨부파일</th>
		            	<td>
		            		<input type="file" name="attach">
		            	</td>
		            </tr>
		            </table>
		            <a id="write" href="javascript:">
			    		<button class="btn btn-primary"><i class="icon-pencil icon-white"></i> 글쓰기</button>
			    	</a>
			    	<a href="list">
						<button class="btn"><i class="icon-remove"></i>목록보기</button>
					</a>   
		                        <!-- /block -->
		                    </div>
		                </div>

		                

                	</div>
                </div>
			    	     
            	</div>
            <hr>
            <footer>
                <p onclick=window.open("/room/")>&copy; 우리들의 자취방 생활</p>
            </footer>
            
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script type="text/javascript">
        $(function() {
        	$("#writebtn").on('click', function(event) {			
				event.preventDefault();
				if(!$('#title').val()) {
					alert('제목을 입력하세요');
					return;
				}									
				$('#writeform').submit();
		});
		
		$(function(){
			$('#write').on('click',function(event) { // on : jquery의 이벤트 연결 함수 (addEventListener)	
				event.preventDefault();
				$('#writeform').submit();
			})
		})

        </script>
    </body>

</html>