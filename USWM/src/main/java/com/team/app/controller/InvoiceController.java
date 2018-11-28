package com.team.app.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class InvoiceController 
{
	@RequestMapping(value= {"/invoice"}, method=RequestMethod.GET)
	public String InvoceResponce(HttpServletRequest request, HttpServletResponse response)
	{
		
		return "Invoice";
	}
	

	@RequestMapping(value= {"/transactions"}, method=RequestMethod.GET)
	public String transactions()
	{
		
		return "transactions";
	}
}
