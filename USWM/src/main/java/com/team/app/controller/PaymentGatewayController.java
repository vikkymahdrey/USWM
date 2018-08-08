package com.team.app.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.app.logger.AtLogger;
import com.team.app.service.impl.PaymentBillServiceImpl;

@Controller
@SessionAttributes({"status"})
public class PaymentGatewayController {
	
	private static final AtLogger logger = AtLogger.getLogger(PaymentGatewayController.class);
	
	@Autowired
	private PaymentBillServiceImpl paymentBillServiceImpl;
	
	@RequestMapping(value= {"/payBills"}, method=RequestMethod.GET)
	public String payBillsHandler(){
		logger.debug("In /payBills");		
			return "PayForm";
	}
	
	/*@RequestMapping(value= {"/payUBills"}, method={RequestMethod.GET,RequestMethod.POST})
	public String payUBillsHandler(){
		logger.debug("In /payUBills");		
			return "PayUBillsForm";
	}*/
	
	@RequestMapping(value= {"/payUBills"}, method={RequestMethod.GET,RequestMethod.POST})
	public String payUBillsHandler(){
		logger.debug("In /payUBills");		
			return "payuform";
	}
	
	@RequestMapping(value= {"/payBillForm"}, method=RequestMethod.POST)
	public String payBillsFormHandler(HttpServletRequest request, HttpSession session, HttpServletResponse response,Map<String, Object> map,RedirectAttributes redirectAttributes) throws ServletException, IOException{
		logger.debug("In /payBillForm");
		Map<String, String> values = paymentBillServiceImpl.hashCalMethod(request, response);
		String action=values.get("action");
		String key=values.get("key").trim();
		String hash=values.get("hash").trim();
		String txnid=values.get("txnid").trim();
		String amount=values.get("amount").trim();
		String firstname=values.get("firstname").trim();
		String email=values.get("email").trim();
		String phone=values.get("phone").trim();
		String productinfo=values.get("productinfo").trim();
		String surl=values.get("surl").trim();
		String furl=values.get("furl").trim();
		String lastname=values.get("lastname").trim();
		String curl=values.get("curl").trim();
		String address1=values.get("address1").trim();
		String address2=values.get("address2").trim();
		String city=values.get("city").trim();
		String state=values.get("state").trim();
		String country=values.get("country").trim();
		String zipcode=values.get("zipcode").trim();
		String udf1=values.get("udf1").trim();
		String udf2=values.get("udf2").trim();
		String udf3=values.get("udf3").trim();
		String udf4=values.get("udf4").trim();
		String udf5=values.get("udf5").trim();
		String pg=values.get("pg").trim();
		
		logger.debug("action : ",action);
		logger.debug("key : ",key);
		logger.debug("hash : ",hash);
		logger.debug("txnid : ",txnid);
		logger.debug("amount : ",amount);
		logger.debug("firstname : ",firstname);
		logger.debug("email : ",email);
		logger.debug("phone : ",phone);
		logger.debug("productinfo : ",productinfo);
		logger.debug("surl : ",surl);
		logger.debug("furl : ",furl);
		logger.debug("lastname : ",lastname);
		logger.debug("curl : ",curl);
		logger.debug("address1 : ",address1);
		logger.debug("address2 : ",address2);
		logger.debug("city : ",city);
		logger.debug("state : ",state);
		logger.debug("country : ",country);
		logger.debug("zipcode : ",zipcode);
		logger.debug("udf1 : ",udf1);
		logger.debug("udf2 : ",udf2);
		logger.debug("udf3 : ",udf3);
		logger.debug("udf4 : ",udf4);
		logger.debug("udf5 : ",udf5);
		logger.debug("pg : ",pg);
		
		map.put("action",action);
		map.put("key",key);
		map.put("hash",hash);
		map.put("txnid",txnid);
		map.put("amount",amount);
		map.put("firstname",firstname);
		map.put("email",email);
		map.put("phone",phone);
		map.put("productinfo",productinfo);
		map.put("surl",surl);
		map.put("furl",furl);
		map.put("lastname",lastname);
		map.put("curl",curl);
		map.put("address1",address1);
		map.put("address2",address2);
		map.put("city",city);
		map.put("state",state);
		map.put("country",country);
		map.put("zipcode",zipcode);
		map.put("udf1",udf1);
		map.put("udf2",udf2);
		map.put("udf3",udf3);
		map.put("udf4",udf4);
		map.put("udf5",udf5);
		map.put("pg",pg);
		
		
			return "PayUForm";
	}
	
	@RequestMapping(value= {"/paymentSuccess"}, method={RequestMethod.GET,RequestMethod.POST})
	public String paymentSuccessHandler(HttpServletRequest request, HttpSession session, HttpServletResponse response,Map<String, Object> map,RedirectAttributes redirectAttributes){
		logger.debug("In /paymentSuccess");	
		try{
			redirectAttributes.addFlashAttribute("status",
					"<div class=\"success\" > Redirecting url getting success result !</div>");
		}catch(Exception e){
			logger.error(e);
			redirectAttributes.addFlashAttribute("status",
					"<div class=\"failure\" >Exception in  success redirecting URL /paymentSuccess !</div>");
		}
			return "redirect:/payBills";
	}
	
	
	@RequestMapping(value= {"/paymentFailure"}, method={RequestMethod.GET,RequestMethod.POST})
	public String paymentFailureHandler(HttpServletRequest request, HttpSession session, HttpServletResponse response,Map<String, Object> map,RedirectAttributes redirectAttributes){
		logger.debug("In /paymentFailure");	
		try{
			redirectAttributes.addFlashAttribute("status",
					"<div class=\"success\" > Redirecting url getting success result of /paymentFailure!</div>");
		}catch(Exception e){
			logger.error(e);
			redirectAttributes.addFlashAttribute("status",
					"<div class=\"failure\" >Exception in  success redirecting URL /paymentFailure !</div>");
		}
			return "redirect:/payBills";
	}

}
