package com.klef.jfsd.springboot.service;

import java.util.List; 
 

import com.klef.jfsd.springboot.model.Customer;
import com.klef.jfsd.springboot.model.Products;
 
public interface CustomerService 
{
   public String CustomerRegistartion(Customer c);
   public Customer checkcustomerlogin(String email, String pwd);
   
   public List<Products> ViewAllProducts();
   
   
}
