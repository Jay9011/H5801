<%-- 비밀번호 변경 --%>
<%-- 
  작성자: 낙경
 2020-06-02  23:00 수정
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<jsp:include page="../modal.jsp"/>
<c:choose>
	<c:when test="${reset_result == -2}">
	
		<div id="demo-modal" class="modal">
    		<div class="modal-content">
    			<h5 style='color:red'>※접근 오류!</h5>
    			<p class="left-align">잘못된 접근입니다.</p>
			</div>
			<div class="modal-footer">
      			<a href="${pageContext.request.contextPath}/index.ho" class="modal-close waves-effect waves-green btn-flat amber">확인</a>
			</div>
		</div>
		
	</c:when>
	
	<c:when test="${reset_result == -1}">
		<div id="demo-modal" class="modal">
    		<div class="modal-content">
    			<h5 style='color:red'>※인증번호 오류!</h5>
    			<p class="left-align">인증번호가 일치하지 않습니다.</p>
			</div>
			<div class="modal-footer">
      			<a href="${pageContext.request.contextPath}/User/findPw.ho" class="modal-close waves-effect waves-green btn-flat amber">확인</a>
			</div>
		</div>
	
	</c:when>
	
	<c:otherwise>
				
		<c:choose>
	
			<c:when test="${reset_result == 0}">
			
				<div id="demo-modal" class="modal">
		    		<div class="modal-content">
		    			<h5 style='color:red'>※비밀번호 변경 실패!</h5>
		    			<p class="left-align">비밀번호 업데이트에 실패하였습니다.</p>
					</div>
					<div class="modal-footer">
		      			<a href="${pageContext.request.contextPath}/User/findPw.ho" class="modal-close waves-effect waves-green btn-flat amber">확인</a>
					</div>
				</div>
				
			</c:when>
			
			<c:otherwise>
			
				<div id="demo-modal" class="modal">
		    		<div class="modal-content">
		    			<h5 style='color:blue'>※비밀번호 변경!</h5>
		    			<p class="left-align">비밀번호 업데이트에 성공하였습니다.</p>
					</div>
					<div class="modal-footer">
		      			<a href="${pageContext.request.contextPath}/User/login.ho" class="modal-close waves-effect waves-green btn-flat amber">확인</a>
					</div>
				</div>

			
			</c:otherwise>
			
		</c:choose>
	
	</c:otherwise>
	
</c:choose>

<script type="text/javascript" src="../JS/modal.js"></script>