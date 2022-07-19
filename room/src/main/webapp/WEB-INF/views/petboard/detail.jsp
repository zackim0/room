<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<title>상세보기</title>
<!-- Bootstrap -->
<link rel="stylesheet" type="text/css"
	href="/room/resources/vendors/bootstrap-wysihtml5/src/bootstrap-wysihtml5.css"></link>
<link href="/room/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<link href="/room/resources/assets/styles.css" rel="stylesheet"
	media="screen">
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
<script
	src="/room/resources/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
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
							<table>							
								<tr>
									<th >제목</th>
									<td >${ board.title }</td>							
								</tr>
								
								<tr>
									<th>작성자</th>
									<td>${ requestScope.board.writer }</td>
								</tr>
								<tr>
									<th>내용</th>
									<td>
										<% String enter2 = "r\n"; %> <c:set var="enter"
											value="
		                  " /> ${ fn:replace(board.content, enter , '<br>') }
									</td>
								</tr>
								<tr>
									<th>작성일</th>
									<td>${board.regDate}</td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td><c:forEach var="file" items="${ board.files }">
											<a href="download?attachNo=${ file.attachNo }"> ${ file.userFileName }
											</a>
										</c:forEach></td>
								</tr>
								<div class="buttons">
									<%-- ${loginuser.memberId } / ${board.writer } / ${loginuser.memberId eq board.writer } / ${ fn:length(loginuser.memberId) } / ${ fn:length(board.writer) } --%>
									<button class="btn btn-normal btn-primary" id="list"
										type="submit">
										<i class="icon-align-justify icon-white"></i> 목록보기
									</button>
									<c:if test="${loginuser.memberId eq board.writer }">
			    							&nbsp;&nbsp;
			    						<button class="btn btn-normal btn-success" id="edit"
											type="submit">
											<i class="icon-pencil icon-white"></i> 수정하기
										</button>
			    						&nbsp;&nbsp;
			    						<button class="btn btn-normal btn-danger" id="delete-btn"
											type="submit">
											<i class="icon-remove icon-white"></i> 삭제하기
										</button>
									</c:if>
								</div>
							</table>


								<!-- /block -->
								</div>
								</div>



								</div>
								</div>

								</div>
								<hr>


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
            // Bootstrap
            $('#bootstrap-editor').wysihtml5();

            // Ckeditor standard
            $( 'textarea#ckeditor_standard' ).ckeditor({width:'98%', height: '150px', toolbar: [
				{ name: 'document', items: [ 'Source', '-', 'NewPage', 'Preview', '-', 'Templates' ] },	// Defines toolbar group with name (used to create voice label) and items in 3 subgroups.
				[ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ],			// Defines toolbar group without name.
				{ name: 'basicstyles', items: [ 'Bold', 'Italic' ] }
			]});
            $( 'textarea#ckeditor_full' ).ckeditor({width:'98%', height: '150px'});
            
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