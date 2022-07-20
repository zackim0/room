<%@page import="com.room.dto.FBoard"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
%>



<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<title>글 수정 - 추천 게임 게시판</title>
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
							<form id="editform" action="edit" method="post">
								<input type="hidden" name="category" value="gameintro">
								<input type="hidden" name="pageNo" value="${ pageNo }">
								<input type="hidden" name="boardNo" value="${ board.boardNo }">
								

									<form id="editform" class="form-horizontal" action="edit"
										method="post" enctype="multipart/form-data"
									>
									<table>
										<input type="hidden" name="category" value="gameintro">
										<input type="hidden" name="pageNo" value="${ pageNo }">
										<div class="control-group">
											<label class="control-label" for="typeahead">제목</label>
											<div class="controls">
												<input type="text" class="span6" id="title" name="title"
													value="${ board.title }"
												>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="date01">작성자</label>
											<div class="controls">
												<input type="text" class="span3" readonly
													value="${ board.writer }"
												> <input type="hidden" name="writer"
													value="${board.writer}"
												>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="content">내용</label>
											<div class="controls">
												<textarea class="input-xlarge textarea"
													style="width: 810px; height: 200px" id="content"
													name="content"
												>${ board.content }</textarea>
											</div>
										</div>
										<div class="control-group">
											<tr>
												<th>첨부파일</th>
												<td><input type="file" name="attach"></td>
											</tr>
										</div>

										<tr>
											<th>작성일</th>
											<td>${board.regDate}</td>
										</tr>
									</table>
								</form>
								<a href="list">
									<button class="btn">
										<i class="icon-share-alt"></i>목록보기
									</button>
								</a> <a id="edit-btn" href="javascript:">
									<button class="btn btn-primary">
										<i class="icon-pencil icon-white"></i>글수정
									</button>
								</a> <a href='javascript:history.back()'>
									<button class="btn btn-danger">
										<i class="icon-remove icon-white"></i>취소
									</button>
								</a>
								<!-- /block -->
						</div>
					</div>

				</div>
			</div>

		</div>
		<hr>
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
	<script src="/room/resources/vendors/ckeditor/adapters/jquery.js"></script>

	<script src="/room/resources/js/jquery-3.6.0.js"></script>

	<script type="text/javascript"
		src="/room/resources/vendors/tinymce/js/tinymce/tinymce.min.js"
	></script>

	<script src="/room/resources/assets/scripts.js"></script>
	<script>
     
     	$(function () {
	     	
	     	$('.textarea').wysihtml5();
			  
	        $('#edit-btn').on('click',function(event){
	        	event.preventDefault();
	        	$('#editform').submit();
	        });
        
     	}); 
        </script>
</body>

</html>