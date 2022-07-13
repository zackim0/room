<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    
    <head>
        <title>Forms</title>
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
                               <div class="muted pull-left">register</div>
                           </div>
                           <div class="block-content collapse in">
                               <div class="span12">
				<!-- BEGIN FORM-->
				<form action="register" id="registerform" method="post" class="form-horizontal">
					<fieldset>
						<div class="alert alert-error hide">
							<button class="close" data-dismiss="alert"></button>
						</div>
						<div class="alert alert-success hide">
							<button class="close" data-dismiss="alert"></button>
						</div>
 							<div class="control-group">
 								<label class="control-label">MemberId<span class="required">*</span></label>
 								<div class="controls">
 									<input type="text" id="memberId" name="memberId" data-required="1" class="span6 m-wrap"/>
 								</div>
 							</div>
 							<div class="control-group">
 								<label class="control-label">NickName<span class="required">*</span></label>
 								<div class="controls">
 									<input type="text" id="nickname" name="nickname" data-required="1" class="span6 m-wrap"/>
 								</div>
 							</div>
 							<div class="control-group">
 								<label class="control-label">password<span class="required">*</span></label>
 								<div class="controls">
 									<input name="passwd" id="passwd" type="passwd" class="span6 m-wrap"/>
 								</div>
 							</div>
 							<div class="control-group">
 								<label class="control-label">Email<span class="required"></span></label>
 								<div class="controls">
 									<input name="email" id="email" type="text" class="span6 m-wrap"/>
 								</div>
 							</div>
 							<div class="control-group">
 								<label class="control-label">region<span class="required">*</span></label>
 								<div class="controls">
 									<input name="region" id="region" type="text" class="span6 m-wrap"/>
 								</div>
 							</div>
 							<div class="control-group">
 								<label class="control-label">pet<span class="required">*</span></label>
 								<div class="controls">
 									<select class="span6 m-wrap" name="pet" id="pet">
 										<option value="1">yes</option>
 										<option value="2">no</option>
 									</select>
 								</div>
 							</div>
 							<div class="form-actions">
 								<button type="submit" id="registerbtn" class="btn btn-primary">Validate</button>
 								<button type="button" id="cancel"class="btn">Cancel</button>
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
			$("#registerbtn").on('click', function(event) {
				
				event.preventDefault();
				//유효성 검사
				if(!$('#memberId').val()) {
					alert('아이디를 입력하세요');
					return;
				}
						
				$('#registerform').submit();
			});
			$("#cancel").on('click', function(event) {	
				event.preventDefault();
				location.href = '/room/home';
			});
		});  
	</script>
   
  
			
			   
	</body>

</html>