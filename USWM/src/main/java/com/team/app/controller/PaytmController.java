package com.team.app.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.team.app.constant.AppConstants;
import com.team.app.logger.AtLogger;

@RestController
@RequestMapping(AppConstants.CONSUMER_API)
public class PaytmController {
private static final AtLogger logger = AtLogger.getLogger(PaytmController.class);
	
@RequestMapping(value = "/paymentURI", method = RequestMethod.GET)
public ResponseEntity<String> paymentURIHandler() throws Exception {
	logger.info(" /POST /paymentURI");		
	ResponseEntity<String> responseEntity = null;	
	try {		
				responseEntity = new ResponseEntity<String>("Heyo Paytm team, please use this URL for paytm services",HttpStatus.OK);
			
			
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	return responseEntity;
}
}
