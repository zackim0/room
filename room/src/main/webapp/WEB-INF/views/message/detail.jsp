<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지 상세보기</title>
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
        
<jsp:include page="/WEB-INF/views/modules/navbar.jsp" />
<div class="container-fluid">
	<div class="row-fluid"></div>
	<div class="row-fluid">
		<div class="block">
			<div class="block-content collapse in">
				<div class="span12">
					<div class="alert">
						<strong>메세지 번호:</strong>
						<tr>
							<td>${message.message_No}</td>
						</tr>
					</div>
					<div class="alert alert-info">
						<strong>작성자:</strong>
						<tr>
							<td>${message.sender}</td>
						</tr>
					</div>
					<div style="word-break: break-all;" class="alert alert-success">
						<strong>내용:</strong>
						<tr>
							<td>${message.message_content}</td>
						</tr>
					</div>
					<div class="alert alert-error">
						<strong>작성일:</strong>
						<tr>
							<td>${message.sendTime}</td>
						</tr>
					</div>
				
</head>
<body>

</body>
</html>