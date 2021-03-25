package com.learn.mycart.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Cardidstore {
	
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private int cardid;
	
	private String cardidStore;

	public Cardidstore() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Cardidstore(String cardidStore) {
		super();
		this.cardidStore = cardidStore;
	}
	public String getCardidStore() {
		return cardidStore;
	}

	public void setCardidStore(String cardidStore) {
		this.cardidStore = cardidStore;
	}

	public int getCardid() {
		return cardid;
	}

	public void setCardid(int cardid) {
		this.cardid = cardid;
	}

	@Override
	public String toString() {
		return "Cardidstore [cardid=" + cardid + ", cardidStore=" + cardidStore + "]";
	}
	
	
	

}
