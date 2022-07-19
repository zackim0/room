<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지 상세보기</title>
<jsp:include page="/WEB-INF/views/modules/navbar.jsp" />
<div class="container-fluid">
	<div class="row-fluid"></div>
	<div class="row-fluid">
		<div class="block">
			<div class="block-content collapse in">
				<div class="span12">
					<div class="alert">
						<strong>번호</strong>
						<tr>
							<td>${message.message_No}</td>
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
					<div class="external-event ui-draggable"
						style="position: relative;">
						<strong>첨부파일:</strong>
						<tr>
							<td><c:forEach var="file" items="${board.files}">
									<a href="download?attachNo=${file.attachNo}">
										${file.userFileName} </a>
								</c:forEach></td>
						</tr>
					</div>
</head>
<body>

</body>
</html>