<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.servletCode.*"%>

<%
	request.setCharacterEncoding("utf-8");
	News News1 = new News();
	Function Fun = new Function();
	String AdminName = (String)session.getAttribute("AdminName");
	String Action = request.getParameter("Action");
	if(Action!=null&&Action.equals("Add")){
		String IP = request.getRemoteAddr();
		String[] s = new String[2];
		s[0] = request.getParameter("NewsTitle");
		s[1] = request.getParameter("NewsContent");
		String sNews = News1.AddNews(s,AdminName,IP);
		if(sNews.equals("Yes")){
			out.print("<script>alert('add successfully');location.href='news.jsp';</script>");
			return;
		}else{
			out.print("<script>alert('add failed');location.href='news.jsp';</script>");
			return;
		}
	}
%>