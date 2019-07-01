package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import javabean.db_conn;
import javabean.flight;

/********************
*@author created by xiaohutuxian
*@date  2019年6月14日---下午3:08:20
*@IDE	eclipse
*@jdk	1.8.0_161
*********************/
public class search_fly extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//get提交为非法操作，直接返回被session记忆的页面即可
		HttpSession session = req.getSession();
		String url=null;
		if(session.getAttribute("url")!=null) {
			url=session.getAttribute("url").toString();
		}else {
			url="default/index.jsp";
		}
		resp.sendRedirect(url);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		//HttpSession session = req.getSession();
		String url=null;
		/*
		 * if(session.getAttribute("url")!=null) {
		 * url=session.getAttribute("url").toString(); }else {
		 */
			url="default/index.jsp";
		
		String departure=null;
		String destination=null;
		departure=req.getParameter("departure");
		destination=req.getParameter("destination");
		String sql=null;
		if(departure==""&&destination=="") {
			//如果始发地和目的地都为空则跳转回原页面
			resp.sendRedirect(url);
		}else if (departure!=""&&destination=="") {
			sql="select * from flight where f_s_p='"+departure+"'";
		}else if (departure==""&&destination!="") {
			sql="select * from flight where f_e_p='"+destination+"'";
		}else if (departure!=""&&destination!="") {
			sql="select * from flight where f_s_p='"+departure+"' and f_e_p='"+destination+"'";
		}
		if(departure==""&&destination=="") {
			//如果都为空，执行不到这一步，所以就不用做处理了，否则，执行else
		}else {
			db_conn conn=new db_conn();
			//System.out.println(sql);
			ArrayList<flight> flightlist = new ArrayList<flight>();
			flight flight_info=new flight();
			
			ResultSet res=conn.executeQuery(sql);
			try {
				while (res.next()) {
					flight_info.setF_n(res.getString(1));
					flight_info.setF_s_a(res.getString(4));
					flight_info.setF_a_a(res.getString(5));
					flight_info.setF_d_t(res.getString(6));
					flight_info.setF_a_t(res.getString(7));
					flight_info.setF_f_c_p(res.getString(8));
					flight_info.setF_s_c_p(res.getString(9));
					flight_info.setF_t_c_p(res.getString(10));
					flightlist.add(flight_info);					
				}
				req.setAttribute("flightlist", flightlist);
			} catch (SQLException e) {
				System.out.println("错误信息："+e);
			}finally {
				conn.closeDB();
			}
			//resp.sendRedirect("default/search.jsp");
			req.getRequestDispatcher("default/search.jsp").forward(req, resp);
		}
		
	}
}
