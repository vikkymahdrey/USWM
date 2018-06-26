package com.team.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.app.logger.AtLogger;

@Controller
public class GraphicController {
	
	private static final AtLogger logger = AtLogger.getLogger(GraphicController.class);
	
	@RequestMapping(value= {"/barChart"})
	public String barCharthandler(){
		logger.debug("IN /barChart URL");
		return "chartjs";
	}
	
	@RequestMapping(value= {"/flotChart"})
	public String flotCharthandler(){
		return "flot";
	}
	
	@RequestMapping(value= {"/chartsMap"})
	public String chartsMapHandler(){
		return "chartmap";
	}
	
	
	@RequestMapping(value= {"/inlineChart"})
	public String inLineCharthandler(){
		return "inline";
	}
	
	@RequestMapping(value= {"/reports"})
	public String genReportsHandler(){
		return "simple";
	}

}
