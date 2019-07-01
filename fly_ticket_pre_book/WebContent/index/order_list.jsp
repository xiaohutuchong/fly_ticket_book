<%@page import="java.sql.ResultSet"%>
<%@page import="javabean.db_conn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-----------------------------------
-@data-time	2019?6?11?---??6:56:16
-@author	created by xiaohutuxian
-@IDE		eclipse
-@tomcat	9.0
-@jdk		1.8.0_161	
------------------------------------%>
<%@ include file="verify_login.jsp" %><%--包含验证登陆代码--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../default/css/bootstrap.min.css" rel="stylesheet">
<link href="../default/css/common.css" rel="stylesheet">
<link href="../default/css/corptravel.css" rel="stylesheet">
</head>
<body>

	<div class="container bg-gray-eee box-shadow mar-bottom-30"
		style="padding-right: 0px; padding-left: 0px; position: relative; margin-top: 120px;">
		<table border="0" cellspacing="0" cellpadding="0"
			class="table table-hover table-striped font12 table-bordered v-align-top">
			<tr>
				<th style="width:10%;">航班号</th>
				<th style="width:15%;">乘机人</th>
				<th style="width:18%;">乘机日期</th>
				<th style="width:10%;">舱位</th>
				<th style="width:17%;">乘客证件</th>
				<th style="width:15%;">联系人</th>
				<th style="width:15%;">联系电话</th>
			</tr>
			
			<%
				db_conn conn=new db_conn();
				String user_id=session.getAttribute("user_id").toString();
				String sql="select * from t_order where order_user='"+user_id+"'";
				ResultSet res=conn.executeQuery(sql);
				while(res.next()){
					
			%>
			
			<tr>
				<td>
					<%=res.getString(3) %> 
				</td>
				<td><p><%=res.getString(4) %></p></td>
				<td><%=res.getString(5) %></td>
				<td><%=res.getString(6) %></td>
				<td><%=res.getString(7) %></td>
				<td><%=res.getString(8) %></td>
				<td><%=res.getString(9) %></td>
				
			</tr>
			
			<%
				}
			%>

		</table>
	</div>

</body>
</html>