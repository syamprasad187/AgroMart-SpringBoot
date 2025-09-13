package com.klef.jfsd.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.klef.jfsd.springboot.model.Order;
import com.klef.jfsd.springboot.service.PaymentService;

@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService paymentService;
	
	@GetMapping("/payment")
	public String init() {
		
		return "order";	// write the payment form file name
	}
	
	@PostMapping(value = "/create-order", produces = "application/json")
	@ResponseBody
	public ResponseEntity<Order> createOrder( @RequestBody Order customerOrder) throws Exception{
		
		Order createdOrder = paymentService.createOrder(customerOrder);
		
		return new ResponseEntity<>(createdOrder, HttpStatus.CREATED);
	}
}
