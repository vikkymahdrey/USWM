package com.team.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.team.app.constant.AppConstants;
import com.team.app.logger.AtLogger;
import com.team.app.service.ConsumerInstrumentService;

/**
 * 
 * @author Vikky
 *
 */

@RestController
@RequestMapping(AppConstants.CONSUMER_API)
public class ConsumerInstrumentController {
	
	@Autowired
	private ConsumerInstrumentService consumerInstrumentServiceImpl;
	
		
	private static final AtLogger logger = AtLogger.getLogger(ConsumerInstrumentController.class);
	
	static {
		
	    	
	    javax.net.ssl.HttpsURLConnection.setDefaultHostnameVerifier(
	    new javax.net.ssl.HostnameVerifier(){

	        public boolean verify(String hostname,
	                javax.net.ssl.SSLSession sslSession) {
	            if (hostname.equals("139.59.14.31")) {
	                return true;
	            }
	            return false;
	        }
	    });
	}


	
}
	