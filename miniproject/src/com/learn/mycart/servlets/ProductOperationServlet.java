package com.learn.mycart.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.learn.mycart.dao.CategoryDao;
import com.learn.mycart.dao.ProductDao;
import com.learn.mycart.entities.Category;
import com.learn.mycart.entities.Product;
import com.learn.mycart.helper.FactoryProvider;

/**
 * Servlet implementation class ProductOperationServlet
 */
@MultipartConfig
@WebServlet("/ProductOperationServlet")
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductOperationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		try (PrintWriter out = response.getWriter()) {

			String op = request.getParameter("operation");
			if (op.trim().equals("addcategory")) {
				// fetch category data
				String title = request.getParameter("catTitle");
				String description = request.getParameter("catDescription");
				if(title.equals(""))
				{
					
					session.setAttribute("message6", "Please enter the title !!");
				//	response.sendRedirect("admin.jsp");
				} if(description.equals("")){
					
					session.setAttribute("message7", "Please enter the categoryDescription!!");
				//	response.sendRedirect("admin.jsp");
				} 
				if(session.getAttribute("message6")!=null ||session.getAttribute("message7")!=null) {
					response.sendRedirect("admin.jsp");
				}else {

				Category category = new Category();
				category.setCategoryTitle(title);
				category.setCategoryDescription(description);

				// save category to database
				CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
				int catId = categoryDao.saveCategory(category);

				// out.println("category saved");
				
				session.setAttribute("message", "Category added successfully-");
				response.sendRedirect("admin.jsp");
				return;
				}
			} else if (op.trim().equals("addproduct")) {
				String pName = request.getParameter("pName");
				String pDesc = request.getParameter("pDesc");
				 int pPrice=0;
				 int pDiscount=0;
				 int pQuantity=0;
				 int catId=0;
				if(!request.getParameter("pPrice").equals(""))
				{

					if(!Pattern.matches("[0-9]", request.getParameter("pQuantity")))
					{
						session.setAttribute("message3", "Please enter the Price!!");
					}else {
						 pPrice = Integer.parseInt(request.getParameter("pPrice"));		
					}
						
				}else if(pPrice==0){
					
					session.setAttribute("message3", "Please enter the Price!!");
				//	response.sendRedirect("admin.jsp");
				} else
				{
					session.setAttribute("message3", "Please enter the Price!!");
				}
				
				
				
					
				if(!request.getParameter("pDiscount").equals(""))
				{
					if(!Pattern.matches("[0-9]", request.getParameter("pQuantity")))
					{
						session.setAttribute("message4", "Please enter the Numbers only!!");
					}else {
						pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
					}
					 	
				}else if(pDiscount == 0){
					
					session.setAttribute("message4", "Please enter the Discount!!");
				//	response.sendRedirect("admin.jsp");
				}else
				{
					session.setAttribute("message4","Please enter the Discount!!");
				}
				
				
				
				if(!request.getParameter("pQuantity").equals(""))
				{
					if(!Pattern.matches("[0-9]", request.getParameter("pQuantity")))
					{
						
						session.setAttribute("message5", "Please enter Numbers only!!");
					}else {

						pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
					}
				}else if(pQuantity == 0) 
				{	
					session.setAttribute("message5", "Please enter the Quantity!!");
			//		response.sendRedirect("admin.jsp");
				}else {
					session.setAttribute("message5", "Please enter the Quantity!!");
				}
				
				
				
				if(!request.getParameter("catId").equals("")) {
					 catId = Integer.parseInt(request.getParameter("catId"));	
				}
				 
				
				if(pName.equals(""))
				{
					
					session.setAttribute("message1", "Please enter the Name !!");
				//	response.sendRedirect("admin.jsp");
				} if(pDesc.equals("")){
					
					session.setAttribute("message2", "Please enter the Description!!");
				//	response.sendRedirect("admin.jsp");
				} 
				if(session.getAttribute("message1")!=null ||session.getAttribute("message2")!=null ||session.getAttribute("message3")!=null ||session.getAttribute("message4")!=null||session.getAttribute("message5")!=null) {
					response.sendRedirect("admin.jsp");
				}
				else{
				Part part = request.getPart("pPic");// part type data to fetch file

				Product p = new Product();// to store product detail in database
				p.setpName(pName);
				p.setpDesc(pDesc);
				p.setpPrice(pPrice);
				p.setpDiscount(pDiscount);
				p.setpQuantity(pQuantity);
				p.setpPhoto(part.getSubmittedFileName());// to get photo name

				// get category by id

				CategoryDao cdoa = new CategoryDao(FactoryProvider.getFactory());
				Category category = cdoa.getCategoryId(catId);

				p.setCategory(category);

				ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
				pdao.saveProduct(p);
				
//				pic upload
//				find out the path to upload photo 
				
				String path = request.getRealPath("img")+File.separator+"products"+ File.separator+part.getSubmittedFileName();
				System.out.println(path);
				
//				uploading code
				try {
					
					FileOutputStream fos = new FileOutputStream(path);
					
					InputStream is = (InputStream) part.getInputStream();
					
//					Reading data
					byte []data=new byte[is.available()];
					is.read(data);
					
//					Writing the data
					fos.write(data);
					fos.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				
				
				System.out.println("Product saved");
				
				session.setAttribute("message", "Product is added successfully..");
				response.sendRedirect("admin.jsp");
				return;

			}
			}
		}
	}

}
