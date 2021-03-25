package com.learn.mycart.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.learn.mycart.entities.Cardidstore;

public class CardidstoreDao {
	private SessionFactory factory;

	public CardidstoreDao(SessionFactory factory) {
		this.factory = factory;
	}

	public Cardidstore getCardIDByusercardid(String usercardid) {
		Cardidstore cardid = null;
		
		try {
			String query = "from Cardidstore where cardidStore=: c";
			
			Session session = this.factory.openSession();
			Query q = session.createQuery(query);//obtaining the object of query by calling the createquerymethod,here type is query
			q.setParameter("c", usercardid);
			//q.setParameter("p", password);
			cardid = (Cardidstore) q.uniqueResult(); //cardid is containing all column values of table cardidstore
			session.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return cardid;
	}
}
