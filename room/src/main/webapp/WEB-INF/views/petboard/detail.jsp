<%@page import="com.room.dto.FBoardAttach"%>
<%@page import="com.room.dto.Member"%>
<%@page import="com.room.dto.FBoard"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<title>WYSIWYG Editors</title>
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

	<div class="block">
		<div class="navbar navbar-inner block-header">
			<div class="muted pull-left">게시글 상세보기</div>
		</div>
				<div class="buttons"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="btn btn-normal btn-primary" id="list" type="submit">
						<i class="icon-align-justify icon-white"></i> 목록보기
					</button>
					<c:if test="${loginuser.memberId eq board.writer}">									

					<button class="btn btn-normal btn-success" id="edit" type="submit">
						<i class="icon-pencil icon-white"></i> 수정하기
				    </button>
				    <button class="btn btn-normal btn-danger" id="delete-btn" type="submit">
						<i class="icon-remove icon-white"></i> 삭제하기
					</button>

					</c:if>
				</div>
		<div class="block-content collapse in">
			<div class="span12">
				<div class="alert">
					<strong>제목:</strong>
					<tr>
						<td>${board.title}</td>
					</tr>
				</div>
				<div class="alert alert-info">
					<strong>작성자:</strong>
					<tr>
						<td>${requestScope.board.writer}</td>
					</tr>
				</div>
				<div style="word-break: break-all;" class="alert alert-success">
					<strong>내용:</strong>
					<tr>
						<td>${board.content}</td>
					</tr>
				</div>
				<div class="alert alert-error">
					<strong>작성일:</strong>
					<tr>
						<td>${board.regDate}</td>
					</tr>
				</div>
				<div class="external-event ui-draggable" style="position: relative;">
					<strong>첨부파일:</strong>
					<tr>
						<td><c:forEach var="file" items="${board.files}">
								<a href="download?attachNo=${file.attachNo}">
									${file.userFileName} </a>
							</c:forEach></td>
					</tr>
				</div>
				<br>

			</div>
		</div>
		<hr>
		<footer>
			<p>&copy; Vincent Gabriel 2013</p>
		</footer>

		<!-- Modal -->
		<div id="comment-modal" class="modal fade" tabindex="-1" role="dialog"
			aria-labelledby="comment-modal-label" aria-hidden="true"
		>
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="comment-modal-label">댓글 작성</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-lable="Close"
						>
							<span aria-hidden="true">x</span>
						</button>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!--/.fluid-container-->
		<script
									src="/room/resources/vendors/bootstrap-wysihtml5/lib/js/wysihtml5-0.3.0.js"></script>
								<script src="/room/resources/vendors/jquery-1.9.1.min.js"></script>
								<script src="/room/resources/bootstrap/js/bootstrap.min.js"></script>
								<script
									src="/room/resources/vendors/bootstrap-wysihtml5/src/bootstrap-wysihtml5.js"></script>

								<script src="/room/resources/vendors/ckeditor/ckeditor.js"></script>
								<script
									src="/room/resources/vendors/ckeditor/adapters/jquery.js"></script>

								<script type="text/javascript"
									src="/room/resources/vendors/tinymce/js/tinymce/tinymce.min.js"></script>

								<script src="/room/resources/assets/scripts.js"></script>
								<script>
     
        
        $(function() {
        	
            $('#delete-btn').click(function(event) {
             	 event.preventDefault();
              	 var ok = confirm('정말로 삭제하시겠습니까?');
              	 if(ok){
              		 location.href = 'delete?boardNo=${board.boardNo}&pageNo=${pageNo}';
              	 }
  			});
           $('#list').on('click',function(event) {
           	event.preventDefault();
           	location.href = '/room/petboard/list';
           });
           
           $('#edit').on('click',function(event) {
           	event.preventDefault();
           	location.href = 'edit?boardNo=${board.boardNo}&pageNo=${pageNo}';
           });
        });
    		
        </script>
</body>

</html>