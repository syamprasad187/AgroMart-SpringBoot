package com.klef.jfsd.springboot.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Customer;
import com.klef.jfsd.springboot.model.Products;
import com.klef.jfsd.springboot.repository.CustomerRepository;
import com.klef.jfsd.springboot.repository.ProductRepository;


@Service
public class CustomerServiceImpl implements CustomerService
{
	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private ProductRepository productRepository;
 
	@Override
	public String CustomerRegistartion(Customer c) 
	{
		 customerRepository.save(c);
		return "Customer Registered Successfully";
	}

	@Override
	public Customer checkcustomerlogin(String email, String pwd) 
	{
      return  customerRepository.checkcustomerlogin(email, pwd);
	}

	@Override
	public List<Products> ViewAllProducts() 
	{
		return (List<Products>) productRepository.findAll();
	}
 

}
