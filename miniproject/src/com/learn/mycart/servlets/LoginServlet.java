package com.learn.mycart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.learn.mycart.dao.UserDao;
import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProvider;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try (PrintWriter out = response.getWriter()) {
			
				String email = request.getParameter("email");
				String password = request.getParameter("password");
                
				UserDao userDao = new UserDao(FactoryProvider.getFactory());
				User user = userDao.getUserByEmailAndPassword(email, password);
				
				
				HttpSession httpSession=request.getSession();
				System.out.println(user);
				
					if(user==null)
				{
					
					httpSession.setAttribute("message","Invalid Details");
					response.sendRedirect("login.jsp");
					return;
				}else
				{
					//out.println("<h1>Weclome"+user.getUserName()+"</h1>");
				httpSession.setAttribute("current-user",user);
					if(user.getUserType().equals("admin"))
					{
						response.sendRedirect("admin.jsp");
					}else if(user.getUserType().equals("normal"))
					{
						response.sendRedirect("index.jsp");
					}else
					{
						out.println("We have not identifed the user");
					}
				}

			} catch (Exception e) 
		      {
				e.printStackTrace();
			}
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
