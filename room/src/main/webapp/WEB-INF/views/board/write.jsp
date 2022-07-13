<%@ page language="java" 
		 contentType="text/html; charset=utf-8"
    	 pageEncoding="utf-8"%>
    	 
<!DOCTYPE html>
<html>
    
    <head>
        <title>레시피 공유 게시판</title>
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
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                    
                    <div class="nav-collapse collapse">

 <jsp:include page="/WEB-INF/views/modules/navbar.jsp" />
                    </div>
                    <!--/.nav-collapse -->
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                
                <!--/span-->
                <form id="writeform"
                	  action="write"
                	  method="post">
                <div class="span12">
                	<div class="row-fluid">

		                <div class="span12" id="content">
		                    <div class="row-fluid">
		                        <!-- block -->
		                        <div class="block">
		                            <div class="navbar navbar-inner block-header">
		                                <div class="muted pull-left">게시글 쓰기</div>
		                            </div>
		                             <table>
		                            	<tr>
		                            	<th>제목</th>
		                            	<td>
		                            		<input type="text" name="title" style="width:550px">
		                            	</td>
		                            	</tr>
		                            	<tr>
		                            		<th>글쓴이</th>
		                            		<td>
		                            		<input type="hidden" name="member_id" value="${ loginuser.memberId }">
		                            		</td>
		                            	</tr>
		                            	<tr>
		                            		<th>내용</th>
		                            		<td style="width:1000px">
		                            		 <textarea  style="resize: none" name="content" cols="76" rows="15"></textarea>
		                               		</td>
		                               	</tr>
		                            </table>
		                           
		                            
		                            
		                            
		                            
		                        </div>
		                        <!-- /block -->
		                    </div>
		                </div>
					<a href="javascript:"><button class="btn btn-inverse" id="write">작성</button></a>
					 &nbsp;
		            <a href="cooklist"><button class="btn">목록보기</button></a>
		                        <!-- /block -->
		                    </div>
		                </div>
</form>
                	</div>
                </div>

         
            <hr>
            <footer>
                <p>&copy; Vincent Gabriel 2013</p>
            </footer>
     

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
            // Bootstrap
            $('#bootstrap-editor').wysihtml5();

            // Ckeditor standard
            $( 'textarea#ckeditor_standard' ).ckeditor({width:'98%', height: '150px', toolbar: [
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
		    toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | "
		});
        
        $(function(){
        	$('#write').on('click', function(event){
        		event.preventDefault();
        		$('#writeform').submit();
        	})
        })

		

        </script>
    </body>

</html>