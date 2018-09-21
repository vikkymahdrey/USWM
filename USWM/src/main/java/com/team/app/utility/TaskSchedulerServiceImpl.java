package com.team.app.utility;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.Executors;

import org.apache.commons.lang.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.concurrent.ConcurrentTaskScheduler;
import org.springframework.stereotype.Service;

import com.team.app.dao.TaskSchedulerDao;
import com.team.app.domain.TblSchedularTask;
import com.team.app.logger.AtLogger;


@Service
@Configuration
@EnableScheduling
@ComponentScan(basePackages="com.team.app.utility.*")
public class TaskSchedulerServiceImpl {
	
	private static final AtLogger logger = AtLogger.getLogger(TaskSchedulerServiceImpl.class);

	
	 @Autowired
	 TaskSchedulerDao taskSchedulerDao;	 
	 
	 @Bean
     public TaskScheduler taskExecutor () {
         return new ConcurrentTaskScheduler(
                   Executors.newScheduledThreadPool(2));
     }
	
	 
	 @Bean
	 public String getCronValue(){
		 logger.debug("In Schedular ");			 
		 TblSchedularTask task=taskSchedulerDao.getTaskSchedular();
		 
			 String df="";
			 if(task!=null){
				df = new SimpleDateFormat("ss mm hh d M ?").format(task.getTaskTtl());
				 logger.debug("In Schedular df",df);
				 task.setTaskTtl(DateUtils.addDays(task.getTaskTtl(), 1));
				 task.setUpdatedDt(new Date(System.currentTimeMillis()));
				 taskSchedulerDao.save(task); 				
			 } 
			 
			 
			 return df;
		 }
		
		  @Scheduled(cron="#{@getCronValue}")
		  public void schedulingTaskImpl() throws InterruptedException
		    {    
			  logger.debug("Execution completed.. ");		
		    }
	
	
	 
	 
	 
	 
	



}
