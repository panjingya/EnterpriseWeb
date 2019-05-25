<%@ page contentType="text/html; charset=UTF-8" language="java" buffer="32kb"%>
<%@ page import="com.servletCode.*"%>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	News News1 = new News();
	Function Fun = new Function();
	String IP = request.getRemoteAddr();
	String AdminName = (String)session.getAttribute("AdminName");
	String NewsID = request.getParameter("NewsID");
	if(News1.DelNews(NewsID,AdminName,IP)){
		out.print("<script>alert('delete successfully!');location.href='news.jsp';</script>");
	}
%>
