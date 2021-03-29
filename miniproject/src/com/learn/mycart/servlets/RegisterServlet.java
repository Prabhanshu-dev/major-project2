package com.learn.mycart.servlets;

import java.io.IOException;

//import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.learn.mycart.dao.CardidstoreDao;
import com.learn.mycart.dao.UserDao;
import com.learn.mycart.entities.Cardidstore;
import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProvider;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterServlet() {
		super();
	}
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession httpSession = request.getSession();
		try {
			String userName = request.getParameter("user_name");
			String usercardid = request.getParameter("card_id");
			String userEmail = request.getParameter("user_email");
			String userPassword = request.getParameter("user_password");
			String userPhone = request.getParameter("user_phone");
			String userAddress = request.getParameter("user_address");
			String userType = request.getParameter("user_type");
			
			
			if(userName.equals(""))
			{
				
				httpSession.setAttribute("message8", "Please enter the userName !!");
			//	response.sendRedirect("admin.jsp");
			} if(usercardid.equals("")){
				
				httpSession.setAttribute("message9", "Please enter the usercardid!!");
			//	response.sendRedirect("admin.jsp");
			} if(userEmail.equals("")){
				
				httpSession.setAttribute("message10", "Please enter the userEmail!!");
			//	response.sendRedirect("admin.jsp");
			} if(userPassword.equals("")){
				
				httpSession.setAttribute("message11", "Please enter the userPassword!!");
			//	response.sendRedirect("admin.jsp");
			} if(userPhone.equals("")){
				
				httpSession.setAttribute("message12", "Please enter the userPhone!!");
			//	response.sendRedirect("admin.jsp");
			} if(userAddress.equals("")){
				
				httpSession.setAttribute("message13", "Please enter the userAddress!!");
			//	response.sendRedirect("admin.jsp");
			} 
			
			if(httpSession.getAttribute("message8")!=null ||httpSession.getAttribute("message9")!=null ||httpSession.getAttribute("message10")!=null ||httpSession.getAttribute("message11")!=null||httpSession.getAttribute("message12")!=null || httpSession.getAttribute("message13")!=null) {
				response.sendRedirect("admin.jsp");
			}

			// validation

			/*
			 * //creating user object User user=new User(userName, userEmail, userPassword,
			 * userPhone, "default.jpg", userAddress);
			 * 
			 * SessionFactory sessionFactory=new
			 * Configuration().configure().buildSessionFactory(); Session
			 * session=sessionFactory.openSession(); Transaction tx=
			 * session.beginTransaction();
			 * 
			 * int userId=(int) session.save(user);
			 * 
			 * 
			 * tx.commit(); session.close();
			 * 
			 * HttpSession httpSession =request.getSession();
			 * httpSession.setAttribute("message", "Registration Successful !!"+userId);
			 * response.sendRedirect("register.jsp"); return;
			 */

			User user = new User(userName, usercardid, userEmail, userPassword, userPhone, "def.jpg", userAddress,
					"normal"); // creating use object to store data

			CardidstoreDao cardidDao = new CardidstoreDao(FactoryProvider.getFactory());
			Cardidstore cardid = cardidDao.getCardIDByusercardid(usercardid);
             System.out.println(user);
             System.out.println(cardid);
			
			if (cardid!=null) {
				
				SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();// we are creating hibernate session factory and storing its object in reference variable named session factory
				Session session = sessionFactory.openSession();// we are taking out a session from session factory just created
				Transaction tx = session.beginTransaction();// open transaction and store returned value in tx

				int userId = (int) session.save(user);// returns userid
				tx.commit();
				session.close();// closing hibernate session
				System.out.println("Successfully saved");

				// again taking out http session from request object
				httpSession.setAttribute("message", "Registration Successful !!");
				response.sendRedirect("register.jsp");
				return; // end and return of control to  browser

			} else  {
			//	SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
			//	Session session = sessionFactory.openSession();
			//	Transaction tx = session.beginTransaction();

				
				httpSession.setAttribute("message", "Registration Failed !!");
				response.sendRedirect("register.jsp");
				return;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
