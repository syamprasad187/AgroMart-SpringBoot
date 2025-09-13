	package com.klef.jfsd.springboot.controller;

import java.sql.Blob;  
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.http.MediaType;

import com.klef.jfsd.springboot.model.Farmer;
import com.klef.jfsd.springboot.model.Products;
import com.klef.jfsd.springboot.service.FarmerService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class FarmerController 
{
	@Autowired
	private FarmerService farmerService;
	
	
	@GetMapping("farmerhome")
	  public ModelAndView farmerhome()
	  {
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("farmerhome");
	  
	    return mv;
	  }
	
    @GetMapping("farmerlogin")
	public ModelAndView farmerlogin()
	{
		ModelAndView mv = new ModelAndView("farmerlogin");
		return mv;
	}
    
    @PostMapping("checkfarmerlogin")
    public ModelAndView checkfarmerlogin(HttpServletRequest request)
    {
    	ModelAndView mv = new ModelAndView();
    	
    	String email 	 = request.getParameter("femail");
    	String pwd = request.getParameter("fpassword");
    	
         Farmer f = farmerService.checkfarmerlogin(email, pwd);
         
         if(f!=null)
         {
        	 HttpSession session = request.getSession();
        	 session.setAttribute("farmer", f);
        	 
        	 mv.setViewName("farmerhome");
         }
         else
         {
        	 mv.setViewName("farmerlogin");
        	 mv.addObject("message", "Login Failed");
         }
         
         return mv;
    }
    
    @GetMapping("addproducts")
    public ModelAndView addproducts()
    {
    	ModelAndView mv = new ModelAndView("addproducts");
    	return mv;
    }
    
    @PostMapping("insertproducts")
    public ModelAndView insertproductsdemo(HttpServletRequest request, @RequestParam("productimage") MultipartFile file) throws Exception
    {
    	String msg = null;
    	
    	ModelAndView mv = new ModelAndView();
    	try
    	{
    		String category = request.getParameter("category");
 		   String name = request.getParameter("name");
 		   String description = request.getParameter("description");
 		   Double cost = Double.valueOf(request.getParameter("cost"));
 		   String productlink = request.getParameter("productlink");
 	   
 		  byte[] bytes = file.getBytes();
 		  Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
 		  //  creates a Blob object in Java from a byte array (bytes).
 		  
 		  Products p = new Products();
 		  p.setCategory(category);
 		  p.setName(name);
 		  p.setDescription(description);
 		  p.setCost(cost);
 		  p.setUrl(productlink);
 		  p.setImage(blob);
 		  
 		  msg=farmerService.AddProducts(p);
 		  System.out.println(msg);
 		  mv.setViewName("productmsg");
 		  mv.addObject("message",msg);
    	}
    	catch(Exception e)
    	{
    		msg = e.getMessage();
    		
    		System.out.println(msg.toString());
    		mv.setViewName("producterror");
    		mv.addObject("message",msg);
    	}
    	
		return mv;
    	
    }
    
    @GetMapping("viewallproducts")
    public ModelAndView viewallproducts()
    {
    	List<Products> plist = farmerService.ViewAllProducts();
    	
    	ModelAndView mv = new ModelAndView("viewallproducts");
    	
    	mv.addObject("plist", plist);
    	
    	return mv;
    }
    
    
	 
    @GetMapping("displayproductimage")
    public ResponseEntity<byte[]> displayproductimage(@RequestParam int id) throws Exception
    {
    	Products products = farmerService.ViewProductById(id);
    	byte [] imageBytes = null;
    	imageBytes = products.getImage().getBytes(1,(int) products.getImage().length());
    	
    	return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
    	  
    	// Response Body, HTTP Status Code, Headers
    }
	 
    
    @GetMapping("viewproductbyid")
    public ModelAndView  viewproductbyiddemo()
    {
    	   List<Products> productlist=farmerService.ViewAllProducts();
    	   ModelAndView mv=new ModelAndView("viewproductbyid");
    	   mv.addObject("productlist",productlist);
    	   return mv;
    }
    
    @PostMapping("displayproduct")
    public ModelAndView displayproductdemo(HttpServletRequest request)
    {
 	   int pid=Integer.parseInt(request.getParameter("pid"));
 	   Products product= farmerService.ViewProductById(pid);
 	   ModelAndView mv=new ModelAndView("displayproduct");
 	   mv.addObject("product",product);
 	   return mv;
    }
    
    @GetMapping("viewproductsbycategory")
    public ModelAndView  viewproductsbycategorydemo()
    {
         ModelAndView mv=new ModelAndView("viewproductsbycategory");
         return mv;
    }
    
    @PostMapping("displayproductsbycategory")
    public ModelAndView  viewproductsbycategorydemo(HttpServletRequest request)
    {
       String category = request.getParameter("category");
       
         List<Products> productlist=farmerService.viewallproductsbycategory(category);
         ModelAndView mv=new ModelAndView("displayproductsbycategory");
         mv.addObject("productlist",productlist);
         return mv;
    }
    
    
    @GetMapping("displayfarmersbyproducts")
    public ModelAndView displayfarmersbyproducts(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("displayfarmersbyproducts");

        HttpSession session = request.getSession();
        Farmer f = (Farmer) session.getAttribute("farmer");

        if (f == null) {
            mv.setViewName("farmerlogin"); // Redirect to the login page
            mv.addObject("message", "Session expired or not logged in. Please log in again.");
            return mv;
        }

        List<Farmer> flist = farmerService.displayProductsbyFarmer(f.getProductsProduced());
        mv.addObject("flist", flist);

        return mv;
    }
    
    
    
    
   
    
    @GetMapping("farmerlogout")
	  public ModelAndView adminlogout()
	  {
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("farmerlogin");
	    return mv;
	  }

}

