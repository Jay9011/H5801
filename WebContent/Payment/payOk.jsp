<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>

		alert("${total }원 (상품명: ${item_name })이 결제 되었습니다. ");
		location.href = "${pageContext.request.contextPath}/MyPage/book.ho";

</script>