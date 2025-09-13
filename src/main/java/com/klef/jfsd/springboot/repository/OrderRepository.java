package com.klef.jfsd.springboot.repository;

import java.math.BigDecimal;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
   
//	@Query("select sum(o.totalAmount) from Order o")
//	public BigDecimal getTotalSales();
//
//	@Query("select count(o) from Order o where o.orderDate = CURRENT_DATE")
//	public Long getTodayOrders();
	
}
