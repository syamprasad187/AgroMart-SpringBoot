package com.klef.jfsd.springboot.controller;

import java.util.ArrayList;  
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Customer;
import com.klef.jfsd.springboot.model.Products;
import com.klef.jfsd.springboot.service.CustomerService;
import com.klef.jfsd.springboot.service.FarmerService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class CustomerController 
{
	@Autowired
    private CustomerService customerService;
	
	@Autowired
	private FarmerService farmerService;
	
	@GetMapping("/")
	public ModelAndView home()
	{
		ModelAndView mv = new ModelAndView("home");
		return mv;
	}
	
	@GetMapping("/customerhome")
	public ModelAndView customerhome()
	{
		ModelAndView mv = new ModelAndView("customerhome");
		return mv;
	}
	
	@GetMapping("customerreg")
	public ModelAndView customerreg()
	{
		ModelAndView mv = new ModelAndView("customerreg");
		return mv;
	}
	
	@PostMapping("insertcustomer")
	public ModelAndView insertcustomer(HttpServletRequest request)
	{
		String name = request.getParameter("cname");
		String gender = request.getParameter("cgender");
		String dob = request.getParameter("cdob");
		String email = request.getParameter("cemail");
		String password = request.getParameter("cpwd");
		String location = request.getParameter("clocation");
		String contact = request.getParameter("ccontact");
		String status = "Registered";
		
		Customer c = new Customer();
		c.setName(name);
		c.setGender(gender);
		c.setDob(dob);
		c.setEmail(email);
		c.setPassword(password);
		c.setLocation(location);
		c.setContact(contact);
		c.setStatus(status);
		
		String msg = customerService.CustomerRegistartion(c);
		
		ModelAndView mv = new ModelAndView("regsuccess");
		mv.addObject("message",msg);
		
		return mv;
		
	}
	
	@GetMapping("customerlogin")
	public ModelAndView customerlogin()
	{
		ModelAndView mv = new ModelAndView("customerlogin");
		return mv;
	}
	
	
	
	@PostMapping("checkcustomerlogin")
	public ModelAndView checkcustomerlogin(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		String cemail = request.getParameter("cemail");
		String cpwd = request.getParameter("cpwd");
		
		Customer c = customerService.checkcustomerlogin(cemail, cpwd);
		if(c!=null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("customer", c);
       	 
       	     mv.setViewName("customerhome");
		}
		else
		{
			mv.setViewName("customerlogin");
       	     mv.addObject("message", "Login Failed");
        }
        
        return mv;
	}
	
	@GetMapping("viewallfarmerproducts")
    public ModelAndView viewallfarmerproducts()
    {
    	List<Products> plist = farmerService.ViewAllProducts();
    	
    	ModelAndView mv = new ModelAndView("viewallfarmerproducts");
    	
    	mv.addObject("plist", plist);
    	
    	return mv;
    }
	
	 @GetMapping("displayfarmerproductimage")
	    public ResponseEntity<byte[]> displayproductimage(@RequestParam int id) throws Exception
	    {
	    	Products products = farmerService.ViewProductById(id);
	    	byte [] imageBytes = null;
	    	imageBytes = products.getImage().getBytes(1,(int) products.getImage().length());
	    	
	    	return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	    	  
	    	// Response Body, HTTP Status Code, Headers
	    }
	    
	  
	     
	    
	    @GetMapping("customerlogout")
		  public ModelAndView customerlogout()
		  {
		    ModelAndView mv = new ModelAndView();
		    mv.setViewName("customerlogin");
		    return mv;
		  }
	    
	    
 
	    
	    
}
