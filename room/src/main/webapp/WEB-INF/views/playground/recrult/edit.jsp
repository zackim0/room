<%@page import="com.room.dto.FBoard"%>
<%@ page language="java" 
		 contentType="text/html; charset=utf-8"
    	 pageEncoding="utf-8"%>
    	 

    	 
<!DOCTYPE html>
<html>
    
    <head>
    	<meta charset="utf-8"/>
        <title>WYSIWYG Editors</title>
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
        
        <div class="container-fluid">
            <div class="row-fluid">
                
                <!--/span-->
                
                <div class="span12">
                	<div class="row-fluid">


		                <div class="span12" id="content">
		                    <div class="row-fluid">
		                        <!-- block -->
		                        <!-- <div class="block">
		                            <div class="navbar navbar-inner block-header">
		                                <div class="muted pull-left"></div>
		                            </div>
		                            <div class="block-content collapse in">
		                               <textarea id="tinymce_basic"></textarea>
		                            </div>
		                        </div> -->
		                        <form id="editform" action="edit" method="post">
		                        <input type="hidden" name="pageNo" value="${ param.pageNo }">
		                        <table>
		                        
		            <tr>
		            	<th>글번호</th>
		            	<td>
		            		<input type="hidden"
		            				name="boardNo" value="${board.boardNo}">
		            		${ board.boardNo }
		            	</td>
		            </tr>
		            <tr>
		                <th>제목</th>
		                <td>
		                	<input type="text" name="title" value="${board.title}">
		                </td>
		            </tr>
		            <tr>
		                <th>작성자</th>
		                <td>
		               	<input type="text" name="writer" value="${board.writer}" readonly>
		            	</td>
		            </tr>
		            <tr>
		                <th>내용</th>
		                <td>		                    
		                  <textarea name="content" style="resize:none" cols="76" rows="15">
		                  	${board.content}
		                  </textarea>
		                </td>
		            </tr>
		            <tr>
		            	<th>작성일</th>
		            	<td>${board.regDate}</td>
		            </tr>
		            </table>
		            </form>
		            	<div class="buttons">
			    			[<a href="/room/fashion-board/list">목록보기(절대경로)</a>]		    	
			    		</div> 
			    		<div class="buttons">
			    			[&nbsp;<a id="edit-btn" href="javascript:">글수정</a>&nbsp;]
			    			&nbsp;&nbsp;
			    			[&nbsp;<a href='detail?boardNo=${board.boardNo}'>취소1</a>&nbsp;]
			    			[&nbsp;<a href='javascript:history.back()'>취소2</a>&nbsp;]
			    		</div>
			    		
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

        <!--/.fluid-container-->
        
        <script src="/room/resources/vendors/bootstrap-wysihtml5/lib/js/wysihtml5-0.3.0.js"></script>
        <script src="/room/resources/vendors/jquery-1.9.1.min.js"></script>
        <script src="/room/resources/bootstrap/js/bootstrap.min.js"></script>
		<script src="/room/resources/vendors/bootstrap-wysihtml5/src/bootstrap-wysihtml5.js"></script>

		<script src="/room/resources/vendors/ckeditor/ckeditor.js"></script>
		<script src="/room/resources/vendors/ckeditor/adapters/jquery.js"></script>
		
		<script src="/room/resources/js/jquery-3.6.0.js"></script>
		
		<script type="text/javascript" src="/room/resources/vendors/tinymce/js/tinymce/tinymce.min.js"></script>

        <script src="/room/resources/assets/scripts.js"></script>
        <script>
     
     	$(function () {
			
		  
        $('#edit-btn').on('click',function(event){
        	event.preventDefault();
        	$('#editform').submit();
        });
        
     	}); 
        </script>
    </body>

</html>