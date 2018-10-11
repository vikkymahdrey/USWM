/*
package com.team.app.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalExceptionHandler {

	private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);
	
	
	
	@ExceptionHandler(Exception.class)
    public ModelAndView handleAllException(HttpServletRequest request, Exception ex){
		logger.debug("In @ControllerAdvice");
        logger.debug("Requested URL="+request.getRequestURL());
        logger.debug("Exception as="+ex);
       
         
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("exception", ex);
        modelAndView.addObject("url", request.getRequestURL());
        
        HttpSession session=request.getSession();
        	session.setAttribute("url", request.getRequestURL());
        		session.setAttribute("statusLog","failed");
        			session.setAttribute("exception", ex);
               
        if(request.getRequestURL().toString().contains("onSubmitlogin")){
	    	logger.debug("In / URL");
	    	return new ModelAndView("redirect:/?status=failed");
	    	    	//modelAndView.setViewName("index");
		}else{
			logger.debug("In /exception URL");
			modelAndView.setViewName("redirect:/?status=failed");
			//modelAndView.setViewName("index");
		}
        return modelAndView;
    } 
	
	@ResponseStatus(value=HttpStatus.NOT_FOUND, reason="IOException occured")
	@ExceptionHandler(IOException.class)
	public void handleIOException(){
		logger.error("IOException handler executed");
		//returning 404 error code
	}
}
*/