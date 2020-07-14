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

import javabean.db_conn;

/********************
 *@author created by francis
 *@date  2019年6月14日---下午5:40:45
 *@IDE	IntelliJ IDEA 2020.1.1
 *@jdk	13.0.1
 *********************/
public class changeInfo extends HttpServlet{
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //开始获取各种参数
        req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession();
        Object user_id = session.getAttribute("user_id");
        String true_name=req.getParameter("user1");
        String sex=req.getParameter("user2");
        String phone=req.getParameter("user3");
        String email=req.getParameter("user4");
        //参数获取结束
        db_conn conn=new db_conn();
        String sql="UPDATE common_user SET true_name = '"+true_name+"' , sex = '"+sex+"', phone = '"+phone+"' , email = '"+email+"'  where user_name ='"+user_id+"' ";
        //Integer res=
        conn.executeInsert(sql);
        //System.out.println(res);
        //System.out.println(sql);
        resp.sendRedirect("/fly_ticket_pre_book_war_exploded/index/user_info.jsp");
    }
}
