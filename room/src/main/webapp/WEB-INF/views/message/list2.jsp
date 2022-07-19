<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<title>메세지 리스트</title>
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
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                              <button class="btn btn-success" onclick="location.href=('write');" style="float:right">메세지 작성<i class="icon-plus icon-white"></i></button>
                                <div class="muted pull-left">메세지함</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
  									<table class="table">
						              <thead>
						                <tr>
						                  <th>메세지 번호</th>
						                  <th>발신자</th>
						                  <th>수신자</th>
						                  <th>받은시간</th>
						                </tr> 
						              </thead>
						              <c:forEach items="${requestScope.messageList}" var="message">
							          <c:if test="${message.sender eq loginuser.memberId }">
							              <tbody>
							              	<tr>
							                  <th><a href="detail?message_No=${message.message_No}">${message.message_No}</a></th>
							                  <th>${message.sender}</th>
							                  <th>${message.receiver}</th>
							                  <th>${message.readTime}</th>
							                </tr>
							              </tbody>
							             </c:if> 
						              </c:forEach>
						            </table>
						             
						          
                                </div>
                                
                                
                            </div>
                        </div>
                        <!-- /block -->
                    </div>
                    
		
		
		
		
</head>
<body>
	<script src="/room/resources/vendors/jquery-1.9.1.min.js"></script>
    <script src="/room/resources/bootstrap/js/bootstrap.min.js"></script>
    <script src="/room/resources/assets/scripts.js"></script>
    <script type="text/javascript">

    </script>
</body>
</html>