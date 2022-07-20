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
        
       <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left"></div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                    <form id="editform" action="edit" method="post">
                                    <input type="hidden" name="pageNo" value="${pageNo}">
                                      <fieldset>
                                        <legend>글 수정</legend>
                                        <div class="control-group">
                                         <tr>
								            <th>글번호:</th>
								           	<td>
								          		<input type="hidden"
								            		   name="boardNo" value="${board.boardNo}">
								            	${ board.boardNo }
								            </td>
								            </tr>
								            <br>
								            <br>	
								          <tr>
                                          <th>제목:</th>
                                          <div class="controls">
											<td>
												<input type="text" name="title" value="${board.title }">
                                           	</td>
                                            <p class="help-block">수정할 내용을 입력하세요.</p>
                                          </div>
                                          </tr>
                                        </div>
                                        <div class="control-group">
                                          <tr>
                                          <th>작성자:</th>
                                          <div class="controls">
										  <input type="text" name="writer" value="${board.writer}" readonly> 
                                          </div>
                                          </tr>
                                         </div>
                                          <br>
                                          <br>
                                          
                                       <div class="control-group">
                                          <label class="control-label" >내용</label>
                                          <div class="controls">
                                            <input type="text" name="content" value="${board.content}" style="width: 810px; height: 200px">
                                          </div>
                                        </div>
                                          <p class="help-block">수정할 내용을 입력하세요.</p>
                                        <div class="form-actions">
                                          <button type="submit" class="btn btn-primary">수정</button> 
                                          <button type="reset" class="btn"><a href='javascript:history.back()'>취소</a></button>                                        
                                        </div>
                                   
                                         
                                       
                                      </fieldset>
                                    </form>

                                </div>
                            </div>
                        </div>

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
     
     	$(function () {
			
		  
        $('#edit-btn').on('click',function(event){
        	event.preventDefault();
        	$('#editform').submit();
        });
        
     	}); 
        </script>
    </body>

</html>