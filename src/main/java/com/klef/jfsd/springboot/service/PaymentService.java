package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Order;

public interface PaymentService {

	public Order createOrder(Order customerOrder) throws Exception;
}
