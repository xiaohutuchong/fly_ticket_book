package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import javabean.db_conn;//导入连接数据库类
import javabean.get_md5;//导入MD5哈希函数类（此类为自己写的，不是类库中的类）
/********************
*@author created by xiaohutuxian
*@date  2019年6月10日---上午11:18:39
*@IDE	eclipse
*@jdk	1.8.0_161
*********************/
public class check_login_reg extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println("该程序不接受直接访问，请不要尝试非法操作");
		resp.setHeader("refresh", "2;url=index/login_reg.jsp");
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		String log_name = req.getParameter("log_name");
		String log_pwd = req.getParameter("log_pwd");
		String reg_name = req.getParameter("reg_name");
		String reg_pwd1 = req.getParameter("reg_pwd1");
		String reg_pwd2 = req.getParameter("reg_pwd2");
		
		if(log_name!=null&&log_pwd!=null&&reg_name==null&&reg_pwd1==null&&reg_pwd2==null) {
			//调用登录方法处理登录
			go_login(log_name, log_pwd, req, resp);
			
		}
		else if(log_name==null&&log_pwd==null&&reg_name!=null&&reg_pwd1!=null&&reg_pwd2!=null&&reg_pwd1.equals(reg_pwd2)) {
			//调用注册方法处理注册
			go_reg(reg_name, reg_pwd1, req, resp);
			
		}//为什么不再写一个判断注册时reg_pwd1和reg_pwd2是否相等的语句呢？因为，前端页面中已经用js去做判断了，
		//如果用户两次输入的密码不一致根本不可能提交数据到此servlet，除非用户限制js或者修改了js，也就是做了非法操作
		//因此，直接输出提示非法操作的提示信息即可
		else {
			
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.println("请不要尝试非法操作");
			/*****测试数据
			out.println("登录账号："+log_name+"\n登录密码："+log_pwd+"\n注册账号："
			+reg_name+"\n注册密码1："+reg_pwd1+"\n注册密码2："+reg_pwd2);
			out.print("---log_name==null:"+(log_name==null));
			out.print("---log_pwd==null:"+(log_pwd==null));
			out.print("---reg_name==null:"+(reg_name==null));
			out.print("---reg_pwd1==null:"+(reg_pwd1==null));
			out.print("---reg_pwd2==null:"+(reg_pwd2==null));
			*/
					
			resp.setHeader("refresh", "2;url=index/login_reg.jsp");
			//除了登录和注册操作，提交其它数据均为非法操作，不做处理，仅给出提示非法信息
		}
	}
	
	protected void go_login(String name, String pwd, HttpServletRequest req, HttpServletResponse resp) {
		//System.out.println("go_login被调用了");
		db_conn conn = new db_conn();//创建数据库连接对象
		get_md5 MD5 = new get_md5();
		pwd = MD5.getMD5(pwd);
		pwd = MD5.getMD5(pwd);
		//取出cookie，验证是否有url，如果有url，则跳转到url，如果没有则跳转到index.jsp
		//目的是跳转到用户浏览的原页面，提高用户体验感
		HttpSession session = req.getSession(); 
		/*
		 * 放弃cookie，转向使用session解决登录后页面跳转的问题，cookie貌似无法解决这个问题
		 * Cookie c = null; Cookie[] cookies = req.getCookies(); for(int
		 * i=0;i<cookies.length;i++) { System.out.println("判断cookie程序被运行");
		 * if(cookies[i].getName().equals("url")) { c = cookies[i];
		 * System.out.println("url_cookie被取出"); } }
		 */
		String sql = "select * from common_user where user_name = '"+name+"'";
		ResultSet res = conn.executeQuery(sql);
		try {
			
			if(res.next()) {
				String user_pwd = res.getString(2);
				
				if(pwd.equals(user_pwd)) {
					//System.out.println("登录验证成功");
					session.setAttribute("user_id", name);
					
					if(session.getAttribute("url")!=null) {
						String url = session.getAttribute("url").toString();
						try{
							resp.sendRedirect(url);
							}
						catch (IOException e) {
							System.out.println("出错信息如下："+e);
						}
					}else {
						try {
							resp.sendRedirect("user_center");
						}
						catch (IOException e) {
							System.out.println("出错信息入下："+e);
						}
						
					}
				}else {
					//用户输入密码错误
					try {
						//System.out.println("用户密码错误");
						resp.setContentType("text/html;charset=utf-8");
						PrintWriter out = resp.getWriter();
						out.println("账号或密码错误，请重新登录");
						resp.setHeader("refresh", "2;url=index/login_reg.jsp");
					}catch (IOException e) {
						System.out.println("出错信息如下："+e);
					}
					
				}				
			}else {
				//用户账号错误
				try {
					//System.out.println("用户账户错误");
					resp.setContentType("text/html;charset=utf-8");
					PrintWriter out = resp.getWriter();
					out.println("账号或密码错误，请重新登录");
					resp.setHeader("refresh", "2;url=index/login_reg.jsp");
				}catch (IOException e) {
					System.out.println("出错信息如下："+e);
				}
			}
			conn.closeDB();
		}
		catch (SQLException e) {
			System.out.println("出错信息如下："+e);
		}
	}
	protected void go_reg(String name, String pwd1,HttpServletRequest req, HttpServletResponse resp) {
		//System.out.println("注册方法被调用了");
		resp.setContentType("text/html;charset=utf-8");
		
		
		db_conn conn = new db_conn();//创建数据库连接对象
		get_md5 MD5 = new get_md5();
		pwd1 = MD5.getMD5(pwd1);
		pwd1 = MD5.getMD5(pwd1);
		String sql = "select * from common_user where user_name = '"+name+"'";
		ResultSet res = conn.executeQuery(sql);
		try {
			PrintWriter out = resp.getWriter();
			try {
				if(res.next()) {			
					out.println("该用户名已被占用，请使用其它用户名重新注册");
					resp.setHeader("refresh", "2;url=index/login_reg.jsp");			
				}else {
					sql = "insert into common_user (user_name,user_pwd) values('"+name+"','"+pwd1+"')";
					int in_res = conn.executeInsert(sql);
					//System.out.println(in_res);
					if(in_res==1) {
						out.println("恭喜您注册成功，2秒之后跳转到登录页面");
						resp.setHeader("refresh", "2;url=index/login_reg.jsp");	
					}else {
						out.println("出错啦，请联系开发人员进行修补bug");
						resp.setHeader("refresh", "2;url=index/login_reg.jsp");
					}
				}
			}catch (Exception e) {
				System.out.print("错误信息如下："+e);
			}
		}catch (IOException e) {
			System.out.println("出错啦"+e);
		}
		
		conn.closeDB();
	}
}
