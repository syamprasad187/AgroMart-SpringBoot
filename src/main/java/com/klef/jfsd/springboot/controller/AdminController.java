package com.klef.jfsd.springboot.controller;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.DashboardData;
import com.klef.jfsd.springboot.model.Farmer;
import com.klef.jfsd.springboot.model.Order;
import com.klef.jfsd.springboot.repository.CustomerRepository;
import com.klef.jfsd.springboot.repository.OrderRepository;
import com.klef.jfsd.springboot.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@CrossOrigin(origins = "http://localhost:5173") 
public class AdminController 
{
	@Autowired
   private AdminService adminService;
	
	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private OrderRepository orderRepository;
	
	@GetMapping("adminhome")
	  public ModelAndView adminhome()
	  {
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("adminhome");
	    
	    long count = adminService.farmercount();
	    mv.addObject("farmercount", count);
	  
	    return mv;
	  }
	
	
	@GetMapping("adminlogin")
	public ModelAndView adminlogin()
	{
		ModelAndView mv = new ModelAndView("adminlogin");
		return mv;
	}
	
	@PostMapping("checkadminlogin")
	//@ResponseBody
	public ModelAndView checkadminlogin(HttpServletRequest request)
	{
		
		ModelAndView mv = new ModelAndView();
		
		String username = request.getParameter("auname");
		String pwd = request.getParameter("apwd");
		
		Admin a = adminService.checkadminlogin(username, pwd);
		if(a!=null)
		{
			//return "Admin Login Success";
			HttpSession session = request.getSession();
			session.setAttribute("admin", a);
			mv.setViewName("adminhome");
		
		}
		else
		{
			mv.setViewName("adminloginfail");
			mv.addObject("message", "Login Failed ! Please Check Your Credentials");
		}
		return mv;
	}
	
	@GetMapping("addfarmer")
	public ModelAndView addfarmer()
	{
		ModelAndView mv = new ModelAndView("addfarmer");
		return mv;
	}
	
	@PostMapping("insertfarmer")
	public ModelAndView insertfarmer(HttpServletRequest request)
	{
		String name = request.getParameter("fname");
		String email = request.getParameter("femail");
		String pwd = request.getParameter("fpwd");
		String address = request.getParameter("fadd");
		int farmize = Integer.parseInt(request.getParameter("ffarmsize"));
		String typeofproducts = request.getParameter("fprod");
		String contact = request.getParameter("fcontact");
		String status = "Added";
		
		Farmer f = new Farmer();
		f.setName(name);
		f.setEmail(email);
		f.setPassword(pwd);
		f.setAddress(address);
		f.setFarmsize(farmize);
		f.setProductsProduced(typeofproducts);
		f.setContact(contact);
		f.setStatus(status);
		
		String msg = adminService.AddFarmer(f);
		
		ModelAndView mv = new ModelAndView("addsuccess");
		mv.addObject("message",msg);
		
		return mv;

	}
	
	@GetMapping("viewallfarmers")
	public ModelAndView viewallfarmers()
	{
		ModelAndView mv = new ModelAndView();
		List<Farmer> flist =  adminService.ViewAllFarmers();
		mv.setViewName("viewallfarmers");
		mv.addObject("flist", flist);
		
		 long count = adminService.farmercount();
		  mv.addObject("farmercount", count);
		
		return mv;		
	}
	 
	@GetMapping("updatefarmerstatus")
	public ModelAndView updatefarmerstatus()
	{
		ModelAndView mv = new ModelAndView();
		List<Farmer> flist =  adminService.ViewAllFarmers();
		mv.setViewName("updatefarmerstatus");
		mv.addObject("flist", flist);
		
		return mv;
	}
	
	
	@GetMapping("updatestatus")
	public String updatestatus(@RequestParam("id") int fid, @RequestParam("status") String status)
	{
		adminService.updateFarmerStatus(status, fid);
		return "redirect:/updatefarmerstatus";
	}
	
	
	@GetMapping("delete")
	public String deletefarmeroperation(@RequestParam("id") int fid)
	{
		adminService.deletefarmer(fid);
		return "redirect:/viewallfarmers";
	}
	
 
	@GetMapping("adminsessionexpiry")
	public ModelAndView adminsessionexpiry()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminsessionexpiry");
		return mv;
	}
	
//	@GetMapping("/admin/dashboard")
//    public String getDashboard(Model model) {
//        Map<String, Object> data = adminService.getDashboardData();
//        model.addAttribute("dashboardData", data);
//        return "admindashboard";
//    }
	
//	@GetMapping("/admin/dashboard")
//    public String showDashboard(Model model) {
//        // Fetch total sales
//        BigDecimal totalSales = orderRepository.findAll().stream()
//                .map(Order::getTotalAmount)
//                .reduce(BigDecimal.ZERO, BigDecimal::add);
//
//        // Fetch total user count
//        long userCount = customerRepository.count();
//
//        // Create a map or object to send to the view
//        model.addAttribute("dashboardData", new DashboardData(totalSales, userCount));
//
//        return "admindashboard";
//	}
	
	 @GetMapping("adminlogout")
	  public ModelAndView adminlogout()
	  {
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("adminlogin");
	    return mv;
	  }
}
