
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-----------------------------------
-@data-time	2019?6?11?---??11:34:24
-@author	created by xiaohutuxian
-@IDE		eclipse
-@tomcat	9.0
-@jdk		1.8.0_161	
------------------------------------%>
<%
	session.setAttribute("user_id", null);
	response.sendRedirect("/fly_ticket_pre_book/index/login_reg.jsp");
%>