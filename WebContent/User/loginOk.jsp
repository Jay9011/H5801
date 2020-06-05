<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
 <head>
<link rel=" shortcut icon" href="${pageContext.request.contextPath}/IMAGES/favicon.ico">
  <!-- font awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
  <!--Import Google Icon Font-->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<c:choose>
<c:when test="${chk == -1 || chk == 0}">
 <div id="demo-modal" class="modal">
    <div class="modal-content">
      <h4>로그인 실패</h4>
      <p>아이디 혹은 패스워드가 틀렸습니다.</p>
    </div>
    <div class="modal-footer">
      <a href="#!" class="modal-action modal-close waves-effect waves-red btn red lighten-1">Close</a>
    </div>
  </div>
<script>
document.addEventListener('DOMContentLoaded', function () {
    var Modalelem = document.querySelector('.modal');
    var instance = M.Modal.init(Modalelem, {dismissible:false, preventScrolling:false});
    instance.open();
});

		</script>
	</c:when>
	<c:when test="${chk == 1 }">
	<script>
	<% response.sendRedirect("../index.ho");%>
	</script>
	</c:when>
</c:choose>
</body>   
</html>