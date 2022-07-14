<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    
    <head>
        <title>레시피 공유</title>
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
        <script src="/room/resources/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    </head>
    
<body>
	  <jsp:include page="/WEB-INF/views/modules/navbar.jsp" />

<div class="container-fluid">
        <div>
             <div class="row-fluid">
                <!-- block -->
              <div class="block">
                  <div class="navbar navbar-inner block-header">
                      <div class="muted pull-left">게시글 내용</div>
                  </div>
                  <div class="block-content collapse in">
                      <div class="span12">
                          
<table>

	<tr>
		<th>제목</th>
		<td>${ board.title }</td>
		</tr>
		
		<tr>
			<th>글쓴이</th>
			<td>${ requestScope.board.writer }</td>
		</tr>
		<tr>
			<th>내용</th>
               <td>
			<% String enter2 = "\r\n"; %>
			<c:set var="enter" value="
			" />
               ${ fn:replace(board.content, enter, '<br>') }
               </td>
               </tr>
               
               <tr>
	           	<th>첨부파일</th>
	           	<td>
	           	<c:forEach var="file" items="${board.files}">
	           	<a href="download?attachNo=${file.attachNo}">
	           	${file.userFileName}
	           	</a>
	           	<br>
	           	</c:forEach>
	           	</td>
	           </tr>
             <tr>
		<th>작성일</th>
		<td>${ board.regDate }</td>
		</tr>
	
	<tbody>
	
	</tbody>
</table>
                </div>
            </div>
        </div>
        <!-- /block -->
          </div>
          <div class="buttons">
          	<c:if test="${ loginuser.memberId eq board.writer }">
         		 <a id='delete-btn' href='javascript:'>삭제</a>
         		
         		<a href='edit?boardNo=${ board.boardNo }'>수정</a>
         		 </c:if>
         		 <a href='cooklist?pageNo=${ pageNo }'>목록보기</a>
          </div>
          
          </div>
      </div>
      

  
  <hr>
  <footer>
      <p>&copy; Vincent Gabriel 2013</p>
  </footer>
      
        <!--/.fluid-container-->
    	  <script src="/room/resources/vendors/bootstrap-wysihtml5/lib/js/wysihtml5-0.3.0.js"></script>
        <script src="/room/resources/vendors/jquery-1.9.1.min.js"></script>
        <script src="/room/resources/bootstrap/js/bootstrap.min.js"></script>
		<script src="/room/resources/vendors/bootstrap-wysihtml5/src/bootstrap-wysihtml5.js"></script>

		<script src="/room/resources/vendors/ckeditor/ckeditor.js"></script>
		<script src="/room/resources/vendors/ckeditor/adapters/jquery.js"></script>

		<script type="text/javascript" src="/room/resources/vendors/tinymce/js/tinymce/tinymce.min.js"></script>

        <script src="/room/resources/assets/scripts.js"></script>
        <script>
        $(function() {
          
            $('#delete-btn').click(function(event) {
              	 event.preventDefault();
               	 var ok = confirm('게시글을 삭제하시겠습니까?');
               	 if(ok){
               		 location.href = 'delete?boardNo=${board.boardNo}&pageNo=${ pageNo }';
               	 }
   			});
            
        });

      

        </script>
    </body>

</html>