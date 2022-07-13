<%@page import="com.room.dto.FBoardAttach"%>
<%@page import="com.room.dto.Member"%>
<%@page import="com.room.dto.FBoard"%>
<%@ page language="java" 
		 contentType="text/html; charset=utf-8"
    	 pageEncoding="utf-8"%>
    	 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    	 
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
		                        <table>
		            <tr>
		                <th>제목</th>
		                <td>${ board.title }</td>
		            </tr>
		            <tr>
		                <th>작성자</th>
		                <td>${ requestScope.board.writer}</td>
		            </tr>
		            <tr>
		                <th>내용</th>
		                <td>		                    
		                  <% String enter2 = "r\n"; %> 
		                  <c:set var = "enter" value="
		                  " />
		                  ${ fn:replace(board.content, enter , '<br>') }
		                </td>
		            </tr>
		             <tr>
		            	<th>첨부파일</th>
		            	<td>
		            	<c:forEach var="file" items="${board.files}">
		            	<a href="download?attachNo=${file.attachNo}">
		            	${file.userFileName}
		            	</a>
		            	<br>
		            	</c:forEach>
		            	</td>
		            </tr>
		            <tr>
		            	<th>작성일</th>
		            	<td>${board.regDate}</td>
		            </tr>
		            	<div class="buttons">
			    			[<a href="/room/fashion-board/list">목록보기(절대경로)</a>]		    	
			    		</div> 
			    		<div class="buttons">
			    		<c:if test="${loginuser.memberId eq board.writer }">
		               	[&nbsp;<a href='delete?boardNo=${board.boardNo}'>삭제</a>&nbsp;]
		               	[&nbsp;<a id='delete-btn' href='javascript:'>확인삭제</a>&nbsp;]
		               	[&nbsp;<a href='edit?boardNo=${board.boardNo}'>수정</a>&nbsp;]
		               	</c:if>	
			    		</div> 
		                        <!-- /block -->
		                    </div>
		                </div>
		               	

		                

                	</div>
                </div>
			    	     
            	</div>
            <hr>
            <footer>
                <p>&copy; Vincent Gabriel 2013</p>
            </footer>
            
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
     
        
        $(function() {
        	
        	//$('delete-btn').on('click',function(event)){
            $('#delete-btn').click(function(event) {
           	 event.preventDefault();
            	 var ok = confirm('삭제할까요?');
            	 if(ok){
            		 location.href = 'delete?boardNo=${board.boardNo}';
            	 }
   			});
            
            // Bootstrap
            $('#bootstrap-editor').wysihtml5();

            // Ckeditor standard
            $( 'textarea#ckeditor_standard' ).ckeditor({width:'98%', height: '150px', toolbar: [
				{ name: 'document', items: [ 'Source', '-', 'NewPage', 'Preview', '-', 'Templates' ] },	// Defines toolbar group with name (used to create voice label) and items in 3 subgroups.
				[ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ],			// Defines toolbar group without name.
				{ name: 'basicstyles', items: [ 'Bold', 'Italic' ] }
			]});
            $( 'textarea#ckeditor_full' ).ckeditor({width:'98%', height: '150px'});
        });

        // Tiny MCE
        tinymce.init({
		    selector: "#tinymce_basic",
		    plugins: [
		        "advlist autolink lists link image charmap print preview anchor",
		        "searchreplace visualblocks code fullscreen",
		        "insertdatetime media table contextmenu paste"
		    ],
		    toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
		});

		// Tiny MCE
        tinymce.init({
		    selector: "#tinymce_full",
		    plugins: [
		        "advlist autolink lists link image charmap print preview hr anchor pagebreak",
		        "searchreplace wordcount visualblocks visualchars code fullscreen",
		        "insertdatetime media nonbreaking save table contextmenu directionality",
		        "emoticons template paste textcolor"
		    ],
		    toolbar1: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
		    toolbar2: "print preview media | forecolor backcolor emoticons",
		    image_advtab: true,
		    templates: [
		        {title: 'Test template 1', content: 'Test 1'},
		        {title: 'Test template 2', content: 'Test 2'}
		    ]
		});
		
		

        </script>
    </body>

</html>