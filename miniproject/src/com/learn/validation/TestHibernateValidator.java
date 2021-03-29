package com.learn.validation;

import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import com.learn.mycart.entities.Product;

public class TestHibernateValidator {
	
	 public static void main(String[] args) 
	    {
	        //Create ValidatorFactory which returns validator
	        ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
	         
	        //It validates bean instances
	        Validator validator = factory.getValidator();
	 
	        Product product = new Product(null, "1", "abcgmail.com", 0, 0, 0, null);
	 
	        //Validate bean
	        Set<ConstraintViolation<Product>> constraintViolations = validator.validate(product);
	 
	        //Show errors
	        if (constraintViolations.isEmpty()) {
	            for (ConstraintViolation<Product> violation : constraintViolations) {
	                System.out.println(violation.getMessage());
	            }
	        } else {
	            System.out.println("Valid Object");
	        }
	    }

}
