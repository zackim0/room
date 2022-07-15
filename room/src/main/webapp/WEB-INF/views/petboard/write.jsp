<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    
    <head>
        <title>글쓰기</title>
        <!-- Bootstrap -->
        <link href="/room/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="/room/resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="/room/resources/assets/styles.css" rel="stylesheet" media="screen">
        <script src="/room/resources/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    </head>
<body>
 	<div class="row-fluid">
                        <!-- block -->
                       <div class="block">
                           <div class="navbar navbar-inner block-header">
                               <div class="muted pull-left">글쓰기</div>
                           </div>
                           <div class="block-content collapse in">
                               <div class="span12">
				<!-- BEGIN FORM-->
				<form action="write" id="writeform" method="post" enctype="multipart/form-data" class="form-horizontal">
					<input type="hidden" name="category" value="pet">
					<fieldset>
						<div class="alert alert-error hide">
							<button class="close" data-dismiss="alert"></button>
						</div>
						<div class="alert alert-success hide">
							<button class="close" data-dismiss="alert"></button>
						</div>
 							<div class="control-group">
 								<label class="control-label">제목<span class="required">*</span></label>
 								<div class="controls">
 									<input type="text" id="title" name="title" data-required="1" class="span6 m-wrap" />
 								</div>
 							</div>

 							<div class="control-group">
 								<label class="control-label">작성자<span class="required"></span></label>
 								<div class="controls">
 									<input name="writer" id="writer" type="text" class="span6 m-wrap" value="${ loginuser.memberId }"readonly/>
 								</div>
 							</div>
 							<div class="control-group">
 								<label class="control-label">작성자<span class="required"></span></label>
 								<div class="controls">
 									<textarea name="content" id="content" style="width:823px; height:256px;"></textarea>
 								</div>
 							</div>
							<div class="control-group">
 									<label class="control-label">첨부파일</label>
 								<div class="controls">
 									<input type="file" name="attach">
 								</div>
 							</div>
							
 							<div class="form-actions">
 								<button type="submit" id="writebtn" class="btn btn-primary">등록</button>
 								<button type="button" id="cancel"class="btn">취소</button>
 							</div>
					</fieldset>
				</form>
				<!-- END FORM-->
			</div>
		    </div>
		</div>
                    	<!-- /block -->
	    </div>
               <!-- /validation -->
 <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#writebtn").on('click', function(event) {			
				event.preventDefault();
				if(!$('#title').val()) {
					alert('제목을 입력하세요');
					return;
				}									
				$('#writeform').submit();							
			});			
			
			
			$("#cancel").on('click', function(event) {	
				event.preventDefault();
				location.href = 'list';
			});
		});  
	</script>
   
  
			
			   
	</body>

</html>