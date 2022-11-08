package com.securityapp.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.securityapp.models.LoginUser;
import com.securityapp.models.Property;
import com.securityapp.models.Report;
import com.securityapp.models.User;
import com.securityapp.services.PropertyService;
import com.securityapp.services.ReportService;
import com.securityapp.services.UserService;

@Controller
public class HomeController {
	
	// Add once service is implemented:
	@Autowired
	private UserService userService;
	
	@Autowired
	private ReportService reportService;
	
	@Autowired
	private PropertyService propertyService;
	
	
//	ROOT 
	@GetMapping("/")
	public String root(HttpSession session) {
		System.out.println("ROOT");
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		return "redirect:/home";
	}
	
/////////////////////////////////////////////////////////////////////////	log and reg page
//	Defaulting to log and Reg page
 @GetMapping("/login")
 public String login(Model model) {
 
     model.addAttribute("newLogin", new LoginUser());
     return "login.jsp";
 }
 
 @GetMapping("/register")
 public String register(Model model) {
 
     model.addAttribute("newUser", new User());
     return "register.jsp";
 }
 
// If Creating a User
 @PostMapping("/register")
 public String register(@Valid @ModelAttribute("newUser") User newUser, 
         BindingResult result, Model model, HttpSession session) {
     
     if(result.hasErrors()) {
         model.addAttribute("newLogin", new LoginUser());
         return "register.jsp";
     }
     
     User user = userService.register(newUser, result);
     
     if(result.hasErrors()) {
         model.addAttribute("newLogin", new LoginUser());
         return "register.jsp";
     }
     
     session.setAttribute("userId", user.getId());
     return "redirect:/";
 }
 
// If logging in a User
 	@PostMapping("/login")
 	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
         BindingResult result, Model model, HttpSession session) {
     
	 User user = userService.login(newLogin, result);
	 
     if(result.hasErrors()) {
         model.addAttribute("newUser", new User());
         return "login.jsp";
     }
 
     session.setAttribute("userId", user.getId());
     
     return "redirect:/";
 }
 
// When logging out
 	@GetMapping("/logout")
	public String logout(HttpSession session) {
	 
		session.setAttribute("userId", null);
	     
	    return "redirect:/login";
	}
	
///////////////////////////////////////////////////////////////////////	CRUD pages	
//	Default to Home Page
	@GetMapping("/home")
	public String index(HttpSession session, Model model) {
		
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		
		model.addAttribute("user", userService.findUser((Long)session.getAttribute("userId")));
		return "home.jsp";
	}
	
//  Report Center - report center ////////////////////////////////////////////////
	@GetMapping("/reportcenter")
	public String reportCenter(HttpSession session, Model model) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		
		model.addAttribute("reports", reportService.findReportsByUserId((Long)session.getAttribute("userId")));
		return "reportCenter.jsp";
	}
	
//	Report Center - new report
	@GetMapping("/reportcenter/new")
	public String reportNew(HttpSession session, @ModelAttribute("report") Report report, Model model) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		else {
			model.addAttribute("property", propertyService.allProperties()); 
			return "reportCreate.jsp";
		}
	}
	
//	Report Center - create report
	@PostMapping("/reportcenter/create")
	public String reportCreate(@Valid @ModelAttribute("report") Report report, BindingResult result, HttpSession session, Model model) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		if(result.hasErrors()) {
			
			System.out.println("hasErrors");
			model.addAttribute("property", propertyService.allProperties());
			return "reportCreate.jsp";
		}
		else {	
			Long userId = (Long) session.getAttribute("userId");
	        User user = userService.findUser(userId);
	        
			System.out.println("No Errors");
			report.setUser(user);
			reportService.createReport(report);
			return "redirect:/reportcenter";
		}
		
	}

// Report Center - edit report
	@GetMapping("/reportcenter/{id}/edit")
	public String reportEdit(HttpSession session, @PathVariable("id") Long id, @ModelAttribute("report") Report report, Model model) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		
		Report calledReport = reportService.findReport(id);
		model.addAttribute("report", calledReport);
		model.addAttribute("property", propertyService.allProperties());
		return "reportEdit.jsp";
	}
	
// Report Center - put report
	@PutMapping("/reportcenter/{id}/update")
	public String reportUpdate(@PathVariable("id") Long id, @Valid @ModelAttribute("report") Report report, BindingResult result, HttpSession session, Model model) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		if(result.hasErrors()) {
			System.out.println("hasErrors");
			model.addAttribute("property", propertyService.allProperties());
			return "reportEdit.jsp";
		}
		else {
			Long userId = (Long) session.getAttribute("userId");
	        User user = userService.findUser(userId);
	        
			System.out.println("No Errors");
			report.setUser(user);
			reportService.createReport(report);
			return "redirect:/reportcenter";
		}
	}
	
// Report Center - delete report
	@DeleteMapping("/reportcenter/{id}/delete")
	public String destroyReport(@PathVariable("id") Long id) {
	    reportService.deleteReport(id);
	    return "redirect:/reportcenter";
	}
	
//  Property Center - property center ////////////////////////////////////////////////	
//	Property Center - view property
	@GetMapping("/propertycenter")
	public String propertyCenter(HttpSession session, Model model) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		
		model.addAttribute("property", propertyService.allProperties());
		return "propertyCenter.jsp";
	}

//	Property Center - new property
	@GetMapping("/propertycenter/new")
	public String propertyNew(HttpSession session, @ModelAttribute("property") Property property) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		else { 
			return "propertyCreate.jsp";
		}
	}
		
//		Report Center - create report
	@PostMapping("/propertycenter/create")
	public String reportCreate(@Valid @ModelAttribute("property") Property property, BindingResult result, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		if(result.hasErrors()) {
			
			System.out.println("hasErrors");
			return "propertyCreate.jsp";
		}
		else {	
			Long userId = (Long) session.getAttribute("userId");
	        User user = userService.findUser(userId);
	        
			System.out.println("No Errors");
			property.setUser(user);
			propertyService.createProperty(property);
			return "redirect:/propertycenter";
		}
		
	}
		
//	Property Center - edit property
	@GetMapping("/propertycenter/{id}/edit")
	public String propertyEdit(HttpSession session, @PathVariable("id") Long id, @ModelAttribute("property") Property property, Model model) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		
		Property calledProperty = propertyService.findProperty(id);
		model.addAttribute("property", calledProperty);

		return "propertyEdit.jsp";
	}	
		
//	Property Center - put property
	@PutMapping("/propertycenter/{id}/update")
	public String propertyUpdate(@PathVariable("id") Long id, @Valid @ModelAttribute("property") Property property, BindingResult result, HttpSession session, Model model) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		if(result.hasErrors()) {
			System.out.println("hasErrors");
			return "propertyEdit.jsp";
		}
		else {
			Long userId = (Long) session.getAttribute("userId");
	        User user = userService.findUser(userId);
	        
			System.out.println("No Errors");
			property.setUser(user);
			propertyService.createProperty(property);
			return "redirect:/propertycenter";
		}
	}
		
//	Property Center - delete property
	@DeleteMapping("/propertycenter/{id}/delete")
	public String destroyProperty(@PathVariable("id") Long id) {
	    propertyService.deleteProperty(id);
	    return "redirect:/propertycenter";
	}
	
//  Archive - archive ////////////////////////////////////////////////
//	Archive - view table
	@GetMapping("/archive")
	public String archive(HttpSession session, Model model) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		
		model.addAttribute("reports", reportService.allReports());
		return "archive.jsp";
	}
	
//	Archive - view table
	@GetMapping("/archive/{id}/view")
	public String archiveView(HttpSession session, @PathVariable("id") Long id, Model model) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		
		model.addAttribute("reports", reportService.findReport(id));
		return "archiveView.jsp";
	}
	
//	END
}





































































