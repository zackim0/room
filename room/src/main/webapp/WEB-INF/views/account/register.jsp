<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    
    <head>
        <title>Forms</title>
        <!-- Bootstrap -->
        <link href="/room/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="/room/resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="/room/resources/assets/styles.css" rel="stylesheet" media="screen">
        <script src="/room/resources/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    	<style type="text/css">
		.error {
		color: red;
		font-weight: bold;
	}
	</style>
    </head>
<body>
 	<div class="row-fluid">
                        <!-- block -->
                       <div class="block">
                           <div class="navbar navbar-inner block-header">
                               <div class="muted pull-left">회원가입</div>
                           </div>
                           <div class="block-content collapse in">
                               <div class="span12">
				<!-- BEGIN FORM-->
				<form:form id="registerform" action="/room/account/register" method="post" modelAttribute="member">
					<fieldset>
						<div class="alert alert-error hide">
							<button class="close" data-dismiss="alert"></button>
						</div>
						<div class="alert alert-success hide">
							<button class="close" data-dismiss="alert"></button>
						</div>
 							<div class="control-group">
 														
 								<spring:message code="register.id" />
 								<div class="controls">										
 									<input type="text" id="memberId" name="memberId" data-required="1" class="span6 m-wrap"/>
 												<form:errors path="memberId" cssClass="error" /><br />

 								</div>
 							</div>
 							<div class="control-group">
 								<spring:message code="register.nickname" />
 								<div class="controls">
 									<input type="text" id="nickname" name="nickname" data-required="1" class="span6 m-wrap"/>
 									<form:errors path="nickname" cssClass="error" /><br />
 								</div>
 							</div>
 							<div class="control-group">
 								<spring:message code="register.passwd" />
 								<div class="controls">
 										<input name="passwd" id="passwd" type="passwd" class="span6 m-wrap"/><br />
 										<form:errors path="passwd" cssClass="error" />
 								</div>
 							</div>
 							<div class="control-group">
 								<spring:message code="register.email" />
 								<div class="controls">
 									<input name="email" id="email" type="text" class="span6 m-wrap"/><br />
 									<form:errors path="email" cssClass="error" />
 								</div>
 							</div>
 							<div class="control-group">
 								<spring:message code="register.region" />
 								<div class="controls">
 									<input name="region" id="region" type="text" class="span6 m-wrap"/><br />
 									<form:errors path="region" cssClass="error" />
 								</div>
 							</div>
 							<div class="control-group">
 							<spring:message code="register.pet" />
 								<div class="controls">
 									<select class="span6 m-wrap" name="pet" id="pet">
 										<option value="1">yes</option>
 										<option value="2">no</option>
 									</select>
 								</div>
 							</div>
 							<div class="form-actions">
 								<button type="submit" id="registerbtn" class="btn btn-primary">
 									<spring:message code="register.register" />
 								</button>
 								
 								<button type="button" id="cancel"class="btn">
 									<spring:message code="register.cancel" />
 								</button>
 								
 							</div>
					</fieldset>
				</form:form>
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
			/* $("#registerbtn").on('click', function(event) {
				
				event.preventDefault();
				//유효성 검사
				if(!$('#memberId').val()) {
					alert('아이디를 입력하세요');
					return;
				}
						
				$('#registerform').submit();
			}); */
			$("#cancel").on('click', function(event) {	
				event.preventDefault();
				location.href = '/room/home';
			});
		});  
	</script>
   
  
			
			   
	</body>

</html>