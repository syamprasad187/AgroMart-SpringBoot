package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.klef.jfsd.springboot.model.CartList;

public interface CartlistRepository extends JpaRepository<CartList, Integer>
{
	 
}
