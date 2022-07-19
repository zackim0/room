﻿<%@ page language="java" 
		 contentType="text/html; charset=utf-8" 
		 pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			
			<c:forEach var="comment" items="${ comments }">
			<tr id="tr${ comment.commentNo }">
				<td style="text-align:left;margin:5px;border-bottom: solid 1px;padding-left:${comment.depth * 20}px">
	        		
	        		<div id='commentview${ comment.commentNo }'>
	        		<br>
	        			${ comment.writer } &nbsp;&nbsp;
	        			[${ comment.regDate }]
	                    <br /><br />	                    
	                    <c:choose>
	                    <c:when test="${ not comment.deleted }">
	                    <span>${ comment.content }</span>
	                    </c:when>
	                    <c:otherwise>
	                    <span style="color:lightgray">삭제된 글</span>
	                    </c:otherwise>
	                    </c:choose>
	                    
	                    <br /><br />
	                    <span style='display:${ not comment.deleted and loginuser.memberId eq comment.writer ? "" : "none" }'>
	                    	<a class="editcomment" data-commentno='${ comment.commentNo }' href="javascript:">편집</a>
	                    	&nbsp;
	                    	<a class="deletecomment"
	                    	   href="javascript:"
	                    	   data-commentno="${ comment.commentNo }">삭제</a>
	                    	&nbsp;
	                    </span>
	                    <a class="recomment"
                    	   href="javascript:"
                    	   data-commentno="${ comment.commentNo }">댓글쓰기</a>                    	
	                    <br /><br />	                    
	                </div>
	                
	                <div id='commentedit${ comment.commentNo }' style="display: none">
	                	<br>
	                	${ comment.writer } &nbsp;&nbsp;
	        			[${ comment.regDate }]
						<br /><br />
						<form id="updateform${ comment.commentNo }">
						<input type="hidden" name="commentNo" value="${ comment.commentNo }" />
						<textarea name="content" style="width: 800px" rows="3" 
							maxlength="200">${ comment.content }</textarea>
						</form>
						<br />
						<div>
							<a class="updatecomment" href="javascript:" data-commentno="${ comment.commentNo }">수정</a> 
							&nbsp; 
							<a class="cancel" data-commentno="${ comment.commentNo }" href="javascript:">취소</a>
						</div>
					</div>
		
				</td>
        	</tr>
        	</c:forEach>