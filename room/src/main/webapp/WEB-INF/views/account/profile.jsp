<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    
    <head>
        <title>ProFile</title>
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
                               <div class="muted pull-left">Profile</div>
                           </div>
                           <div class="block-content collapse in">
                               <div class="span12">
				<!-- BEGIN FORM-->
				<form action="profile" id="Profileform" method="post" class="form-horizontal">
					<fieldset>
						<div class="alert alert-error hide">
							<button class="close" data-dismiss="alert"></button>
						</div>
						<div class="alert alert-success hide">
							<button class="close" data-dismiss="alert"></button>
						</div>
 							<div class="control-group">
 								<label class="control-label">아이디<span class="required">*</span></label>
 								<div class="controls">
 									<input type="text" id="memberId" name="memberId" data-required="1" class="span6 m-wrap" value="${ loginuser.memberId }" readonly/>
 								</div>
 							</div>
 							<div class="control-group">
 								<label class="control-label">닉네임<span class="required">*</span></label>
 								<div class="controls">
 									<input type="text" id="nickname" name="nickname" data-required="1" class="span6 m-wrap" value="${ loginuser.nickname }"/>
 								</div>
 							</div>
 							<div class="control-group">
 								<label class="control-label">비밀번호<span class="required">*</span></label>
 								<div class="controls">
 									<input name="passwd" id="passwd" type="passwd" class="span6 m-wrap"/>
 								</div>
 							</div>
 							<div class="control-group">
 								<label class="control-label">이메일<span class="required"></span></label>
 								<div class="controls">
 									<input name="email" id="email" type="text" class="span6 m-wrap" value="${ loginuser.email }"/>
 								</div>
 							</div>
 							<div class="control-group">
 								<label class="control-label">지역<span class="required">*</span></label>
 								<div class="controls">
 									<input name="region" id="region" type="text" class="span6 m-wrap" value="${ loginuser.region }"/>
 								</div>
 							</div>
 							<div class="control-group">
 								<label class="control-label">반려견<span class="required">*</span></label>
 								<div class="controls">
 									<select class="span6 m-wrap" name="pet" id="pet">
 										<option value="1">yes</option>
 										<option value="2">no</option>
 									</select>
 								</div>
 							</div>
 							<div class="form-actions">
 								<button type="submit" id="editbtn" class="btn btn-primary">수정</button>
 								<button type="submit" id="deletebtn" class="btn btn-primary">탈퇴</button>
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
			$("#editbtn").on('click', function(event) {
				
				event.preventDefault();
				//유효성 검사
				if(!$('#nickname').val()) {
					alert('아이디를 입력하세요');
					return;
				}
				
				if(!$('#passwd').val()) {
					alert('비밀번호를 입력하세요');
					return;
				}
				if(!$('#email').val()) {
					alert('이메일을 입력하세요');
					return;
				}
				if(!$('#region').val()) {
					alert('지역을 입력하세요');
					return;
				}
						
				$('#Profileform').submit();
							

			});
			
			$('#deletebtn').on('click', function(event) {
				event.preventDefault();
				var ok = confirm('정말 탈퇴하시겠습니까?');
				if (ok) {
					location.href = '/room/account/delete?memberId=${ loginuser.memberId }';
					
				}
			}); 
			
			
			$("#cancel").on('click', function(event) {	
				event.preventDefault();
				location.href = '/room/home';
			});
		});  
	</script>
   
  
			
			   
	</body>

</html>