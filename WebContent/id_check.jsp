<%@ page import="com.holic.beans.*"%>
<%@ page contentType = "text/plain; charset=euc-kr" %>
<%@ page import = "java.util.List" %>
<%
	String id = request.getParameter("id");
DAOUser dao = new DAOUser();
int re = dao.check_nick(id);
%>
<%=re%>