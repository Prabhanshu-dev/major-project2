package com.learn.mycart.dao;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.learn.mycart.entities.Category;

public class CategoryDao {
   
	 private  SessionFactory factory;
	 
	 public CategoryDao(SessionFactory factory)
	 {
		this.factory=factory; 
	 }
	 
	  //saves the category to database
	 public int saveCategory(Category cat)
	 {
		Session session = this.factory.openSession();
		Transaction tx = session.beginTransaction();
		
		int catId = (int) session.save(cat); // save the cat object
		  tx.commit();
		return catId;
		 
	 }
	 public List<Category> getCategories()
	 {
		 Session s =this.factory.openSession();
		 Query query = s.createQuery("from Category");
		 List<Category>list = query.list();
		 return list;
	 }
	 public Category getCategoryId(int cid)// return single category
	 {
		 Category cat = null;
		 try {
			 Session session = this.factory.openSession();// creating session with help of factory available in category dao
			 cat = session.get(Category.class,cid);//will return fetch category and put in cat
			session.close();		 
		 }catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		 return cat;
	 }
	 
}
