package com.team.app.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IssueReportController 
{
	@RequestMapping(value= {"/issue"}, method=RequestMethod.GET)
	public String IssueReport(HttpServletRequest request, HttpServletResponse response)
	{
		
		return "IssueReport";
	}
	

}