package com.learn.mycart.dao;

	import com.learn.mycart.entities.Product;
	import java.util.List;
	import org.hibernate.Session;
	import org.hibernate.SessionFactory;
	import org.hibernate.Transaction;
	import org.hibernate.query.Query;

	public class ProductDao {

	    private SessionFactory factory;

	    public ProductDao(SessionFactory factory) {
	        this.factory = factory;
	    }

	    public boolean saveProduct(Product product) { // taking product object as input parameter
	        boolean f = false;
	        try {

	            Session session = this.factory.openSession();
	            Transaction tx = session.beginTransaction();

	            session.save(product);//to save session is needed 

	            tx.commit();
	            session.close();
	            f = true;

	        } catch (Exception e) {
	            e.printStackTrace();
	            f = false;
	        }

	        return f;
	    }

	    //get all products
	    public List<Product> getAllProducts() {
	        Session s = this.factory.openSession();// open session from factory,take session from  factory
	        Query query = s.createQuery("from Product"); //take all data from product
	        List<Product> list = query.list(); // list of products
	        return list;
	    }

	    //get all  products of given category
	    public List<Product> getAllProductsById(int cid) {
	        Session s = this.factory.openSession(); // session is compulsory in all CRUD Operations from database
	        Query query = s.createQuery("from Product as p where p.category.categoryId =: id");
	        query.setParameter("id", cid); // put value of id
	        List<Product> list = query.list(); // query will return list of given category
	        return list;
	    }

	}

