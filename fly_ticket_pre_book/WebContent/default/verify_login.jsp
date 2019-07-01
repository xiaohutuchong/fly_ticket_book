
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-----------------------------------
-@data-time	2019?6?11?---??11:38:45
-@author	created by xiaohutuxian
-@IDE		eclipse
-@tomcat	9.0
-@jdk		1.8.0_161	
------------------------------------%>
<%
	if(session.getAttribute("user_id")==null){
		response.sendRedirect("/fly_ticket_pre_book/index/login_reg.jsp");
		//为什么要写绝对路径？因为用户从servlet中正常访问和用户直接访问页面时，路径是不一样的，所以
		//写成绝对路径，防范错误发生
	}
%>