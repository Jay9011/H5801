<%@ page import="com.holic.beans.*"%>
<%@ page contentType = "text/plain; charset=euc-kr" %>
<%@ page import = "java.util.List" %>
<%
String id = request.getParameter("id");
UserDAO dao = new UserDAO();
int re = dao.check_nick(id);
%>
<%=re%>