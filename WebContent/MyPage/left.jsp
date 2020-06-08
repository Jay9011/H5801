<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int menu = 1;  // menu parameter 가 없으면 1 page 디폴트 동작
	String menu_param = request.getParameter("menu");
	if(menu_param != null){  
		try{
			menu = Integer.parseInt(menu_param);
		}catch(NumberFormatException e){
			
		}
	}
	// 1 <= menu <= 3
	if(menu > 3) menu = 3;
	if(menu < 1) menu = 1;
%>

<!-- left 사이트 메뉴 시작 -->
    <div class="col s5 offset-s7 right-align" style="margin-bottom:51px; ">
      <ul class="tabs">
        <li class="tab">
          <a target="_self" class="<%=(menu == 1)?"active":"" %>" <%=(menu != 1)?"href='list.ho?menu=1'":""%>>내가 쓴 게시글</a>
        </li>
        <li class="tab">
          <a target="_self" class="<%=(menu == 2)?"active":"" %>" <%=(menu != 2)?"href='list.ho?menu=2'":""%>>댓글 단 게시글</a>
        </li>
        <li class="tab">
          <a target="_self" class="<%=(menu == 3)?"active":"" %>" <%=(menu != 3)?"href='list.ho?menu=3'":""%>>좋아요</a>
        </li>
      </ul>
    </div>
    <!-- left 사이트 메뉴 끝 -->