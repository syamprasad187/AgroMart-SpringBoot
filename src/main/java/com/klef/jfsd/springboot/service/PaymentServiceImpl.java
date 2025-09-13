package com.klef.jfsd.springboot.service;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Order;
import com.klef.jfsd.springboot.repository.OrderRepository;
import com.razorpay.RazorpayClient;

@Service
public class PaymentServiceImpl implements PaymentService{
	
	@Autowired
	private OrderRepository orderRepository;
	
	@Value("${razorpay.key.id}")	// to read the property in the application.properties
	private String razorPayKey; 
	
	@Value("${razorpay.secret.key}")
	private String razorPaySecret;
	
	// to communicate b/w SpringBoot and Razorpay JPA
	private RazorpayClient client;

	@Override
	public Order createOrder(Order customerOrder) throws Exception{
		
		JSONObject orderReq = new JSONObject();
		orderReq.put("amount", customerOrder.getTotalAmount() * 100);	// amount - paisa
		orderReq.put("currency", "INR");
		orderReq.put("receipt", customerOrder.getEmail());
		
		this.client = new RazorpayClient(razorPayKey, razorPaySecret);
		
		com.razorpay.Order razorPayOrder = client.orders.create(orderReq);	// to create orders in Razorpay
		
		System.out.println(razorPayOrder);
		
		customerOrder.setRazorpayOrderId(razorPayOrder.get("id"));
		customerOrder.setOrderStatus(razorPayOrder.get("status"));
		
		orderRepository.save(customerOrder);
		return customerOrder;
	}
	
}
