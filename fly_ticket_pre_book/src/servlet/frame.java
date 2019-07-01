package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/********************
*@author created by xiaohutuxian
*@date  2019年6月8日---下午9:03:20
*@IDE	eclipse
*@jdk	1.8.0_161
*********************/
public class frame extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		if(session.getAttribute("admin_id") != null) {
			RequestDispatcher rd=getServletContext().getRequestDispatcher("/admin/frame.jsp");
			rd.forward(req, resp);
		}else {
			resp.sendRedirect("/fly_ticket_pre_book/admin/index.jsp");
		}
		
	}
}
