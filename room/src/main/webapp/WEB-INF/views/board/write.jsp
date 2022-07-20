<%@ page language="java" 
		 contentType="text/html; charset=utf-8"
    	 pageEncoding="utf-8"%>
    	 
<!DOCTYPE html>
<html>
    
    <head>
        <title>레시피 공유 게시판</title>
        
        <link href="/room/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="/room/resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="/room/resources/assets/styles.css" rel="stylesheet" media="screen">
        <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="vendors/flot/excanvas.min.js"></script><![endif]-->
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script src="/room/resources/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
        
        <link href="/room/resources/vendors/datepicker.css" rel="stylesheet" media="screen">
        <link href="/room/resources/vendors/uniform.default.css" rel="stylesheet" media="screen">
        <link href="/room/resources/vendors/chosen.min.css" rel="stylesheet" media="screen">

		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
        <!-- <link href="/room/resources/vendors/wysiwyg/bootstrap-wysihtml5.css" rel="stylesheet" media="screen"> -->
    </head>
    
    <body>
		<jsp:include page="/WEB-INF/views/modules/navbar.jsp" />
        
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">                
                
                     <div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">레시피 공유</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                    <form id="writeform" class="form-horizontal" action="write" method="post" enctype="multipart/form-data">
                                      <input type="hidden" name="category" value="recipe">
                                      <fieldset>
                                        
                                        <div class="control-group">
                                          <label class="control-label" for="typeahead">제목</label>
                                          <div class="controls">
                                            <input type="text" class="span6" id="title" name="title">
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="date01">작성자</label>
                                          <div class="controls">
                                            <input type="text" class="span6" readonly value="${ loginuser.memberId }">
											<input type="hidden" name="writer" value="${loginuser.memberId}">
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="attach">첨부파일</label>
                                          <div class="controls">
                                            <input class="input-file uniform_on" id="attach" name="attach" type="file">
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="content">내용</label>
                                          <div class="controls">
                                            <textarea class="input-xlarge textarea" placeholder="내용을 입력하세요 ..." style="width: 810px; height: 200px" id="summernote-content" name="content"></textarea>
                                          </div>
                                        </div>
                                        <div class="form-actions">
                                          <button type="submit" id="write" class="btn btn-primary">작성하기</button>
                                          <button type="button" onclick="location.href='/room/board/cooklist'" class="btn">취소</button>
                                        </div>
                                      </fieldset>
                                    </form>

                                </div>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>
                
                
                </div>
			</div>
		</div>
		


        <script src="/room/resources/vendors/jquery-1.9.1.js"></script>
        <script src="/room/resources/bootstrap/js/bootstrap.min.js"></script>
        <script src="/room/resources/vendors/chosen.jquery.min.js"></script>
<!-- 
        <script src="/room/resources/vendors/wysiwyg/wysihtml5-0.3.0.js"></script>
        <script src="/room/resources/vendors/wysiwyg/bootstrap-wysihtml5.js"></script>
        <script src="/room/resources/vendors/wizard/jquery.bootstrap.wizard.min.js"></script>
-->

		<script src="/room/resources/vendors/jquery-validation/dist/jquery.validate.min.js"></script>
		<script src="/room/resources/assets/form-validation.js"></script>
	        
		<script src="/room/resources/assets/scripts.js"></script>
		
		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
		
		
		<script>

        $(function() {
        	
   			$("#write").on('click', function(event) {			
   				event.preventDefault();
   				if(!$('#title').val()) {
   					alert('제목을 입력하세요');
   					return;
   				}									
   				$('#writeform').submit();							
   			});
   			
            // $('.textarea').wysihtml5();
   			var summernote = $('#summernote-content').summernote({
				"callbacks" : {
					"onImageUpload": function(files, editor) {
						console.log(editor);
			            var fileArr = Array.prototype.slice.call(files);
			            fileArr.forEach(function(f){
			                if(f.type.match("image/jpg") || f.type.match("image/jpeg" || f.type.match("image/jpeg"))){
			                    alert("JPG, JPEG, PNG 확장자만 업로드 가능합니다.");
			                    return;
			                }
			            });
			            for(var xx=0;xx<files.length;xx++){
			            	var formData = new FormData();
			            	formData.append("file", files[xx]);
				            $.ajax({
				                url : "summernote-upload",
				                data:  formData,
				                cache: false,
				                contentType: false,
				                processData: false,
				                // enctype	: 'multipart/form-data',
				                type: 'POST',
				                success : function(result) {

				                    //항상 업로드된 파일의 url이 있어야 한다.
				                    if(result.length == 0) {
				                        alert('실패');
				                        return;
				                    }
				                    
				                    for(x=0;x<result.length;x++){
				                        var img = $("<img>").attr({src: result[x], width: "50%"});   // Default 100% ( 서비스가 앱이어서 이미지 크기를 100% 설정 - But 수정 가능 )
				                        console.log(img);
				                        // $(summernote).summernote('pasteHTML', "<img src='"+result[x]+"' style='width:100%;' />");
				                        $(summernote).summernote('editor.insertImage', result[x]);
				                        
				                    }
				                }
				            });

			            }   

			            
					}
				}
			});

            
        });
        </script>
                
                
    </body>

</html>