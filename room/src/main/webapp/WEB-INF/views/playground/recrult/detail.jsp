<%@page import="com.room.dto.GIBoardAttach"%>
<%@page import="com.room.dto.Member"%>
<%@page import="com.room.dto.GIBoard"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<title>${ board.title }-번개 모임 게시판</title>
<!-- Bootstrap -->
<link rel="stylesheet" type="text/css"
	href="/room/resources/vendors/bootstrap-wysihtml5/src/bootstrap-wysihtml5.css"
></link>
<link href="/room/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen"
>
<link href="/room/resources/assets/styles.css" rel="stylesheet"
	media="screen"
>
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
<script
	src="/room/resources/vendors/modernizr-2.6.2-respond-1.1.0.min.js"
></script>
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
										<%
										String enter2 = "r\n";
										%>
										<c:set var="enter" value="
		                  " />
										${ fn:replace(board.content, enter , '<br>') }
									</td>
								</tr>

								<tr>
									<th>첨부파일</th>
									<td>
										<c:forEach var="file" items="${board.files}">
											<a href="download?attachNo=${file.attachNo}">
												${file.userFileName} </a>
											<br>
										</c:forEach>
									</td>
								</tr>

								<tr>
									<th>작성일</th>
									<td>${board.regDate}</td>
								</tr>
								<div class="buttons">
									[<a href="/room/playground/recrult/list">목록보기</a>]
								</div>
								<div class="buttons">
									<c:if test="${loginuser.memberId eq board.writer }">
		               	[&nbsp;<a href='delete?boardNo=${board.boardNo}'>삭제</a>&nbsp;]
		               	[&nbsp;<a id='delete-btn' href='javascript:'>확인삭제</a>&nbsp;]
		               	[&nbsp;<a
											href='edit?boardNo=${board.boardNo}&pageNo=${ pageNo }'
										>수정</a>&nbsp;]
		               	</c:if>
								</div>
								<!-- /block -->
								</div>
								</div>
								<!-- 댓글 -->
								<div>
									<button id="add-comment-btn" type="button"
										class="btn btn-outline-primary btn-sm">댓글작성</button>
								</div>
								<!-- /댓글 -->

								<!-- 댓글 표시 영역 -->
								<br>
								<hr style="width: 800px; margin: 0 auto">
								<br>
								<table id="comment-list" style="width: 800px; margin: 0 auto">
								</table>
								<!-- /댓글 표시 영역 -->

								<!-- Modal -->
								<div id="comment-modal" class="modal fade" tabindex="-1"
									role="dialog" aria-labelledby="comment-modal-label"
									aria-hidden="true"
								>
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="comment-modal-label">댓글 작성</h5>
												<button class="close" type="button" data-dismiss="modal"
													aria-label="Close"
												>
													<span aria-hidden="true">x</span>
												</button>
											</div>
											<div class="modal-body">
												<form id="comment-form">
													<div class="form-group">
														<label>댓글</label>
														<textarea class="form-control" name='content'
															id='modal-content'
														></textarea>
													</div>
													<input type="hidden" name='writer'
														value='${loginuser.memberId }'
													>
													<input type="hidden" name='boardNo'
														value='${board.boardNo }'
													>
													<input type="hidden" name='boardCommentNo' value="0">
													<input type="hidden" name='action'>
													<!-- 댓글 or 대댓글 -->
												</form>
											</div>
											<div class="modal-footer">
												<button id='modalRegisterBtn' type="button"
													class="btn btn-success btn-sm">댓글쓰기</button>
												<button id='modalCloseBtn' type="button"
													class="btn btn-succes btn-sm">취소</button>
											</div>
										</div>
									</div>
								</div>
								<footer>
									<p onclick=window.open( "/room/")>&copy; 우리들의 자취방 생활</p>
								</footer>

								</div>

								<!--/.fluid-container-->
								<script
									src="/room/resources/vendors/bootstrap-wysihtml5/lib/js/wysihtml5-0.3.0.js"
								></script>
								<script src="/room/resources/vendors/jquery-1.9.1.min.js"></script>
								<script src="/room/resources/bootstrap/js/bootstrap.min.js"></script>
								<script
									src="/room/resources/vendors/bootstrap-wysihtml5/src/bootstrap-wysihtml5.js"
								></script>

								<script src="/room/resources/vendors/ckeditor/ckeditor.js"></script>
								<script
									src="/room/resources/vendors/ckeditor/adapters/jquery.js"
								></script>

								<script type="text/javascript"
									src="/room/resources/vendors/tinymce/js/tinymce/tinymce.min.js"
								></script>

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
            
            // comment 목록 표시 ( load : 비동기 요청 결과 HTML을 지정된 요소에 삽입)
    		$('#comment-list').load('comment-list?boardNo=' + ${ board.boardNo });
            
            $('#add-comment-btn').on('click',function(event){
            	$('#modal-content').val("");
            	$('#comment-modal').modal('show'); // show modal
            });
            
            
            $('#modalCloseBtn').on('click', function(event) {
    			$('#comment-modal').modal('hide'); // hide modal
    		});
    		
    		$('#modalRegisterBtn').on('click', function(event) {
    			event.preventDefault();
    			
    		
    			var content = $('#modal-content').val(); // val() == value 속성
    			if (content.length == 0) {
    				alert('내용을 작성하세요');
    				return;
    			}
    			
    			var formData = $('#comment-form').serialize();
    			// var formData = $('#comment-form').serializeArray();
    			// alert(formData);		
    			// return;
    		
            	
            $.ajax({
            	"url" :"comment-write",
            	"method" : "post",
            	"async" : true,
            	"data":formData, 
            	"dataType" :"text",
            	"success" : function(data,status,xhr) {
            		if(data === "success"){
            			$('#comment-modal').modal('hide');
            			
            			// 갱신된 목록 표시 ( load : 비동기 요청 결과 HTML을 지정된 요소에 삽입)
            			$('#comment-list').load('comment-list?boardNo=' + ${board.boardNo});
            		} else {
            			alert('댓글 쓰기 실패');
            		}
					
				},
				"error" : function (xhr,status,err) {
					alert('댓글 쓰는 중 오류 발생');
				} 	
            });
          });
    		
    		// $('.deletecomment').on('click',function(evnet){ // 현재 존재하는 . deletecomment
    		$('#comment-list').on('click','.deletecomment',function(event){ // 현재 + 미래에 존재하는 .deletecomment
    			// 어느 댓글을 삭제할까요? --> 삭제할 댓글 번호는 무엇?	
    			var commentNo = $(this).attr("data-commentNo"); // this : 이벤트 발생 객체 ( 여기서는 <a>)
    			var ok = confirm(commentNo + "번 댓글을 삭제할까요?");
    			if(!ok){
    				return;
    			}
    		
    			$.ajax({
    				"url" : "comment-delete",
    				"method" : "get",
    				"async" : true,
    				"data" : "commentNo=" + commentNo,
    				"dataType" : "text",
    				"success" : function (data,status,xhr) {
						// 갱신된 목록 표시 ( load: 비동기 요청 결과 HTML을 지정된 요소에 삽입)
						$('#comment-list').load('comment-list?boardNo='+${board.boardNo});
					},
					"error" : function(xhr,status,err){
							alert('삭제 실패');
						}
	   				});
    			
    			function toggleEditDisplay(commentNo, isEdit) {
    				$('#commentview' + commentNo).css('display', isEdit ? 'none' : 'block');
    				$('#commentedit' + commentNo).css('display', isEdit ? 'block' : 'none');
    			}
    			var currentEditCommentNo = null;
    			$('#comment-list').on('click', '.editcomment', function(event) { // 현재 + 미래에 존재하는 .deletecomment			
    				var commentNo = $(this).attr("data-commentNo");
    				if (currentEditCommentNo) {
    					toggleEditDisplay(currentEditCommentNo, false);
    				}
    				currentEditCommentNo = commentNo;			
    				toggleEditDisplay(commentNo, true);
    			});
    			
    			$('#comment-list').on('click', '.cancel', function(event) { // 현재 + 미래에 존재하는 .deletecomment
    				var commentNo = $(this).attr("data-commentNo");
    				toggleEditDisplay(commentNo, false);
    				currentEditCommentNo = null;
    			});
    			
    			$('#comment-list').on('click', '.updatecomment', function(event) { // 현재 + 미래에 존재하는 .deletecomment
    				var commentNo = $(this).attr("data-commentNo");
    				var formData = $('#updateform' + commentNo).serialize();
    				$.ajax({
    					"url" : "comment-update",
    					"method" : "post",
    					"async" : true,
    					"data" : formData,
    					"dataType" : "text",
    					"success" : function(data, status, xhr) {
    						// 갱신된 목록 표시 ( load : 비동기 요청 결과 HTML을 지정된 요소에 삽입)
    						$('#comment-list').load('comment-list?boardNo=' + ${ board.boardNo });
    					}, 
    					"error" : function(xhr, status, err) {
    						alert('수정 실패')	;
    					}
    				
    				});
    				
    				
    			});
    			
    				
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
    		
        function toggleEditDisplay(commentNo, isEdit) {
			$('#commentview' + commentNo).css('display', isEdit ? 'none' : 'block');
			$('#commentedit' + commentNo).css('display', isEdit ? 'block' : 'none');
		}
		
		var currentEditCommentNo = null;
		$('#comment-list').on('click', '.editcomment', function(event) { // 현재 + 미래에 존재하는 .deletecomment			
			var commentNo = $(this).attr("data-commentno");
			if (currentEditCommentNo) {
				toggleEditDisplay(currentEditCommentNo, false);
			}
			currentEditCommentNo = commentNo;			
			toggleEditDisplay(commentNo, true);
		});
		
		$('#comment-list').on('click', '.cancel', function(event) { // 현재 + 미래에 존재하는 .deletecomment
			var commentNo = $(this).attr("data-commentno");
			toggleEditDisplay(commentNo, false);
			currentEditCommentNo = null;
		});
		
		$('#comment-list').on('click', '.updatecomment', function(event) { // 현재 + 미래에 존재하는 .deletecomment
			var commentNo = $(this).attr("data-commentno");
			var formData = $('#updateform' + commentNo).serialize();
			$.ajax({
				"url" : "comment-update",
				"method" : "post",
				"async" : true,
				"data" : formData,
				"dataType" : "text",
				"success" : function(data, status, xhr) {
					// 갱신된 목록 표시 ( load : 비동기 요청 결과 HTML을 지정된 요소에 삽입)
					$('#comment-list').load('comment-list?boardNo=' + ${ board.boardNo });
				}, 
				"error" : function(xhr, status, err) {
					alert('수정 실패')	;
				}
			
			});
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