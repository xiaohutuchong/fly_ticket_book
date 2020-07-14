<%@page import="javabean.db_conn"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.util.Objects" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-----------------------------------
-@data-time	2020/7/11/---7:32:46
-@author	created by francis
-@IDE		IntelliJ IDEA 2020.1.1
-@tomcat	9.0
-@jdk		13.0.1
------------------------------------%>
<%@ include file="verify_login.jsp" %><%--包含验证登陆的代码--%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link type="text/css" rel="stylesheet" href="/fly_ticket_pre_book/index/css/core.css">
	<link type="text/css" rel="stylesheet" href="/fly_ticket_pre_book/index/css/home.css">
</head>
<body>

<div class="ydc-content-slide ydc-body">
	<div class="ydc-flex">
		<%
			String temp = session.getAttribute("user_id").toString();
			db_conn conn=new db_conn();
			String sql="select * from common_user where user_name = '"+temp+"'";
			ResultSet res=conn.executeQuery(sql);
			while(res.next()) {
				String t_n = res.getString(4);
				String s_x = res.getString(5);
				String p_e = res.getString(6);
				String e_l = res.getString(7);
		%>
		<div class="ydc-column ydc-column-8">
			<div class="ydc-release-content">
				<div class="ydc-tabPanel ydc-tabPanel-release">
					<div class="ydc-release-tab-head">
						<ul>
							<li class="hit">帐号设置</li>
						</ul>
					</div>
					<div class="ydc-panes">
						<form action="../upload_img" enctype="multipart/form-data" method="post">
							<div class="ydc-reg-form-class ydc-reg-form-reg"
								 style="margin-top: 40px;">
								<div class="ydc-reg-form-group clearfix">
									<label>帐号名称:</label>
									<div class="ydc-reg-form-input"><%=session.getAttribute("user_id") %></div>
								</div>

								<div class="ydc-reg-form-group clearfix">
									<label>帐号图标:</label>
									<div class="ydc-reg-form-input">
										<input type="file" id="" name="username" class=""
											   autocomplete="off" placeholder="">
									</div>
								</div>
								<div class="ydc-reg-form-group">
									<div class="ydc-reg-form-button" style="margin-left: 255px;">
										<input type="submit" value="保存头像">
									</div>
								</div>
							</div>
						</form>

					</br>

						<form action="../upload_inf" method="post">
							<div class="ydc-reg-form-class ydc-reg-form-reg"
								 style="margin-top: 40px;">
								<div class="ydc-reg-form-group clearfix">
									<label>姓名:</label>
									<div class="ydc-reg-form-input">
										<input type="text" id="user1" name = "user1"
											   class="ydc-form-control" autocomplete="off"
											   placeholder="<%=t_n%>">
									</div>
								</div>
								<div class="ydc-reg-form-group clearfix">
									<label>性别:</label>
									<div class="ydc-reg-form-input">
										<select id="user2" name = "user2" >
											<option value="男">男</option>
											<option value="女">女</option>
										</select>
									</div>
									<div class="ydc-reg-form-text">
										<p>当前性别<%=s_x%></p>
									</div>

								</div>
								<div class="ydc-reg-form-group clearfix">
									<label>联系手机:</label>
									<div class="ydc-reg-form-input">
										<input type="text" id="user3" name = "user3"
											   class="ydc-form-control" autocomplete="off"
											   placeholder="<%=p_e%>">
									</div>

								</div>
								<div class="ydc-reg-form-group clearfix">
									<label>邮箱:</label>
									<div class="ydc-reg-form-input">
										<input type="text" id="user4" name = "user4"
											   class="ydc-form-control" autocomplete="off"
											   placeholder="<%=e_l%>">
									</div>


								</div>
								<div class="ydc-reg-form-group">
									<div class="ydc-reg-form-button" style="margin-left: 255px;">
										<input type="submit" value="保存信息">
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<%
			}
		%>
	</div>
</div>

</body>
</html>