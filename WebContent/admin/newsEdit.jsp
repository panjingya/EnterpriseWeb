<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="com.servletCode.*"%>
<%@ include file="Session.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	News New1 = new News();
	Function Fun = new Function();
	String[] sa = null;
	String NewsID = request.getParameter("newsId");
	String Action = request.getParameter("Action");
	if(Action!=null && Action.equals("Edit")){
		String IP = request.getRemoteAddr();
		String AdminName = (String)session.getAttribute("AdminName");
		String[] s = new String[2];
		s[0] = request.getParameter("upd_NewsTitle");
		s[1] = request.getParameter("upd_NewsContent");
		String sOK = New1.EditNews(s,NewsID,AdminName,IP);
		if(sOK.equals("Yes")){
			out.print("<script>alert('update successfully!');location.href='news.jsp';</script>");
			return;
		}else{
			out.print("<script>alert('update failed!');location.href='news.jsp';</script>");
			return;
		}
	}
%>
