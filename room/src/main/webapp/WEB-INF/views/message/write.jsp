<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>메세지 작성</title>
<!-- Bootstrap -->
        <link href="/room/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="/room/resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="/room/resources/assets/styles.css" rel="stylesheet" media="screen">
        <link href="/room/resources/assets/DT_bootstrap.css" rel="stylesheet" media="screen">
        <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="vendors/flot/excanvas.min.js"></script><![endif]-->
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
</head>
<body>
	
	<jsp:include page="/WEB-INF/views/modules/navbar.jsp" />

	<div class="container-fluid">
		<div class="row-fluid">

			<div class="span12" id="content">
				<div class="row-fluid">
					<!-- block -->
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left"></div>
						</div>
						<div class="block-content collapse in">
							<div class="span12">
								<form class="form-horizontal" action="write" method="post">
									<fieldset>
										<legend>메세지 작성</legend>
										<div class="control-group">
											<label class="control-label" for="writer">작성자</label>
											<div class="controls">
												<input type="text" id="writer" readonly value="${loginuser.memberId}" class="input-xlarge focused">
												<input type="hidden" name="sender" value="${loginuser.memberId}">
											</div>
										</div>
										<div class="control-group success">
											<label class="control-label" for="message_content">메시지</label>
											<div class="controls">
												<textarea style="width:80%" rows="8" id="message_content" name="message_content" placeholder="내용" required></textarea>
											</div>
										</div>
										<div class="control-group success">
											<label class="control-label" for="receiver">받는사람</label>
											<div class="controls">
												<select id="receiver" name="receiver">
												<c:forEach var="member" items="${requestScope.memberList}">
													<option value="${member.memberId}">${member.memberId}</option>
												</c:forEach>
												</select>
											</div>
										</div>
										<div class="form-actions">
											<button type="submit" class="btn btn-primary">메시지 보내기</button>
											<button type="reset" class="btn">취소</button>
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
	
	
	<script src="/room/resources/vendors/jquery-1.9.1.min.js"></script>
    <script src="/room/resources/bootstrap/js/bootstrap.min.js"></script>
    <script src="/room/resources/assets/scripts.js"></script>
    <script type="text/javascript">

    </script>



		
	
</body>
</html>