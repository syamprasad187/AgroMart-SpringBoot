package com.klef.jfsd.springboot.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Farmer;
import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.CustomerRepository;
import com.klef.jfsd.springboot.repository.FarmerRepository;
import com.klef.jfsd.springboot.repository.OrderRepository;
import com.klef.jfsd.springboot.repository.ProductRepository;

@Service
public class AdminServiceImpl implements AdminService
{
    @Autowired
	private AdminRepository adminRepository;
    
    @Autowired
    private FarmerRepository farmerRepository;
    
    @Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private OrderRepository orderRepository;
	
	@Autowired
	private ProductRepository productRepository;
	
	@Override
	public Admin checkadminlogin(String username, String password) 
	{
		 return adminRepository.checkadminlogin(username, password);
	}

	@Override
	public String AddFarmer(Farmer f) 
	{
		farmerRepository.save(f);
		return "Farmer Added Successfully..";
	}

	@Override
	public List<Farmer> ViewAllFarmers() 
	{
		 return farmerRepository.findAll();
	}

	@Override
	public String deletefarmer(int fid) 
	{
	   farmerRepository.deleteById(fid);
	   return "Farmer Deleted Successfully";
	}

	 

	@Override
	public Farmer displayFarmerbyID(int fid) 
	{	 
		 return farmerRepository.findById(fid).get();
	}

	@Override
	public String updateFarmerStatus(String status, int fid) 
	{
		 farmerRepository.updateFarmerStatus(status, fid);
		 return "Farmer Updated Successfully...";
	}

	@Override
	public long farmercount() 
	{		 
		return farmerRepository.count() ;
	}

//	@Override
//	public Map<String, Object> getDashboardData() {
//        Map<String, Object> data = new HashMap<>();
//        
//        // Total Sales
//        data.put("totalSales", orderRepository.getTotalSales());
//        
//        // User Analytics
//        data.put("userCount", customerRepository.count());
//
//        // Product Performance
//        data.put("productPerformance", productRepository.findAll());
//
//        // Today's Orders
//        data.put("todayOrders", orderRepository.getTodayOrders());
//
//        return data;
//
//	}
	 
}
