<%@ page import = "com.room.dto.PetBoard" %>
<%@ page language="java" 
		 contentType="text/html; charset=utf-8"
    	 pageEncoding="utf-8"%>
    	 
<!DOCTYPE html>
<html>
    
    <head>
    	<meta charset="utf-8"/>
        <title>반려견 게시판 수정</title>
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
		                        <table class="span12">
		            	<form id="editform"action="edit"method="post">
		            	<input type="hidden" name="boardNo" value="${board.boardNo}">
		            	<input type="hidden" name="pageNo" value="${pageNo}">
		            <tr>
		                <th>제목</th>
		                <td>
		                    <input type="text" name="title" class="span12" value="${ board.title }" />
		                </td>
		            </tr>
		            <tr>
		                <th>작성자</th>
						<td>
							<input type="text" name="writer" value="${ board.writer }" readonly>
						</td>
		            </tr>
		            <tr>
		                <th>내용</th>
		                <td>		                    
		                    <textarea name="content" cols="76" rows="15" style="width:885px; height: 345px;">
		                    ${ board.content }
                  			</textarea>
		            	</td>
		            </tr>
		            
		            
		            	<div class="buttons">
		            	
		            <button class="btn btn-normal btn-success" id="edit" type="submit">
			    		<i class="icon-pencil icon-white"></i>		    	
			    		수정완료
			    	</button>
			    	&nbsp;&nbsp;
			    	<button class="btn" id="cancel" type="submit">
			    		<i class="icon-arrow-left"></i>
			    	취소&nbsp;&nbsp;
			    	</button>
			    	</div>  
			    	</form>   
		                        <!-- /block -->
		                    </div>
		                </div>

		                

                	</div>
                </div>
			    	     
            	</div>
            <hr>


        <!--/.fluid-container-->
        <script src="/room/resources/vendors/bootstrap-wysihtml5/lib/js/wysihtml5-0.3.0.js"></script>
        <script src="/room/resources/vendors/jquery-1.9.1.min.js"></script>
        <script src="/room/resources/bootstrap/js/bootstrap.min.js"></script>
		<script src="/room/resources/vendors/bootstrap-wysihtml5/src/bootstrap-wysihtml5.js"></script>

		<script src="/room/resources/vendors/ckeditor/ckeditor.js"></script>
		<script src="/room/resources/vendors/ckeditor/adapters/jquery.js"></script>

		<script type="text/javascript" src="/room/resources/vendors/tinymce/js/tinymce/tinymce.min.js"></script>

        <script src="/room/resources/assets/scripts.js"></script>
        <script>
		
		$(function(){
			$('#edit').on('click',function(event) {
				event.preventDefault();
				$('#editform').submit();
			});
		});

        </script>

    </body>

</html>