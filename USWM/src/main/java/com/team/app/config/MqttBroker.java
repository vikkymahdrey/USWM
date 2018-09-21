package com.team.app.config;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;
import java.util.concurrent.TimeUnit;

import javax.transaction.Transactional;

import org.apache.commons.codec.binary.Base64;
import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.app.dao.FrameDao;
import com.team.app.domain.LoraFrame;
import com.team.app.logger.AtLogger;

@Service
public class MqttBroker implements MqttCallback,MqttIntrf {
	
	private static final AtLogger logger = AtLogger.getLogger(MqttBroker.class);
	
		
	@Autowired
	private FrameDao frameDao;	
		
	MqttClient client;
	
	MqttMessage message;
	
	 public void doDemo(String appId, String devId)  {
	    try {
	    	logger.debug("/ INside MQTT Broker"+devId);	
	    	MqttConnectOptions connOpts = new MqttConnectOptions();
	        connOpts.setUserName("loragw");
	        connOpts.setPassword("loragw".toCharArray());
	        connOpts.setCleanSession(true);
	        client = new MqttClient("tcp://139.59.14.31:1883", MqttClient.generateClientId());
	        
	        client.connect(connOpts);
	        client.setCallback(this);
	        client.subscribe("application/"+appId+"/node/"+devId+"/rx");
	        MqttMessage message = new MqttMessage();
	        message.setPayload("sending......."
	                .getBytes());
	        client.publish("application/"+appId+"/node/"+devId+"/tx", message);
	        System.out.println("Message printing here "+message);
	        //System.exit(0);
	    } catch (MqttException e) {
	        e.printStackTrace();
	    }
	}    
	
	

	/*@Transactional
	public void messageArrived(String topic, MqttMessage message) throws Exception {
		logger.debug("Inside messageArrived");
		try{
			LoraFrame frame=null;
			if(!message.toString().isEmpty()){
				 
				  JSONObject json=null;
				  		json=new JSONObject();
				  		json=(JSONObject)new JSONParser().parse(message.toString());
				  		logger.debug("REsultant json",json);
				  		
				  		 frame=new LoraFrame();
				  		
				  		 frame.setApplicationID(json.get("applicationID").toString());
				  		 frame.setApplicationName(json.get("applicationName").toString());
				  		 frame.setNodeName(json.get("nodeName").toString());
				  		 frame.setDevEUI(json.get("devEUI").toString());
				  		logger.debug("applicationID",json.get("applicationID").toString());
							logger.debug("applicationName",json.get("applicationName").toString());
								logger.debug("nodeName",json.get("nodeName").toString());
									logger.debug("devEUI",json.get("devEUI").toString());
				  		 
				  		 JSONArray arr=(JSONArray) json.get("rxInfo");
				  		 
				  		 if(arr!=null && arr.size()>0){
	   						 for (int i = 0; i < arr.size(); i++) {
	   							 JSONObject jsonObj = (JSONObject) arr.get(i);
	   							 frame.setGatewayMac(jsonObj.get("mac").toString());
	   							 frame.setGatewayName(jsonObj.get("name").toString());
	   							 
		   							logger.debug("mac",jsonObj.get("mac").toString());
		   								logger.debug("name",jsonObj.get("name").toString());
	   						 }
				  		 }
				  		 
				  		
				  		logger.debug("fport",json.get("fPort").toString());
				  	  		logger.debug("Data As:",json.get("data").toString());
				  	  		
				  	  	frame.setFPort(json.get("fPort").toString().trim());
				  	  	TimeZone.setDefault(TimeZone.getTimeZone("IST"));
				  	  	DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				  	  	formatter.setTimeZone(TimeZone.getTimeZone("IST")); // Or whatever IST is supposed to be
				  	  formatter.parse(formatter.format(new Date(System.currentTimeMillis())));
				  	  	frame.setCreatedAt(formatter.parse(formatter.format(new Date(System.currentTimeMillis()))));
				  	  	frame.setUpdatedAt(formatter.parse(formatter.format(new Date(System.currentTimeMillis()))));
				  	  	
				  	  	
				  	  	
				  	  	if(json.get("data")!=null){	
				  	  		 logger.debug("Data not empty");
				     		 byte[] decoded=Base64.decodeBase64(json.get("data").toString());
				     		 
				     		 	if(decoded!=null && decoded.length>0){
				     		 		
				     		 		int i=0;				     		 	
				     		 		String packetType="";
				     		 		int temp=0;
				     		 		String devMapId="";
				     		 		String waterLtr="";				     		 		
				     		 		int hourly=-1;
				     		 		int n=0;
				     		 		int packetLength=0;
				     		 		long millseconds=System.currentTimeMillis();
				     		 		LoraFrame frm=null;
				     		 			frm=new LoraFrame();
				     		 			for(Byte b : decoded){
				     		 				if(n>0){
				     		 					frm=new LoraFrame();
				     		 					n=0;	
			     		 		   				temp=0;
			     		 		   				waterLtr="";
			     		 		   			}
				     		 			  if(i==0){
					     		 			String decodeBinary =String.format("%x", b);
					     		 			 logger.debug("decodeBinary i=0 :",decodeBinary);
						     		 			//if(!decodeBinary.equalsIgnoreCase("11111111111111111111111111111111")){
						     		 				if(decodeBinary.equals("0")){
						     		 					packetType="0";
						     		 					devMapId="0";
						     		 				}else{
						     		 					if(decodeBinary.length()>1){
						     		 						//packetType=String.format("%02X ",decodeBinary.substring(0,decodeBinary.length()-4));
						     		 						packetType=String.valueOf(Integer.parseInt(decodeBinary.substring(0,decodeBinary.length()-1),16));
						     		 						devMapId=decodeBinary.substring(1);
						     		 					}else{
						     		 						packetType="0";
						     		 						devMapId=decodeBinary;
						     		 					}
						     		 					
						     		 				}						     		 				
						     		 			 	logger.debug("packetType :",packetType);
						     		 			 	logger.debug("devMapId :",devMapId);
						     		 			//} 	
					     		 			   i++;					     		 			 
						     		 		  }else if(i==1){
						     		 			String decodeBinary =String.format("%x", b);
						     		 			 logger.debug("decodeBinary i=1 :",decodeBinary);
							     		 			//if(!decodeBinary.equalsIgnoreCase("11111111111111111111111111111111")){
						     		 			 		if(packetType.equals("0")){
						     		 			 			logger.debug("Packet Type 0 in i=1");
						     		 			 			int devMapCombination=0;
						     		 			 			if(decodeBinary.length()>1){
						     		 			 				devMapCombination=Integer.parseInt(devMapId+decodeBinary,16);
						     		 			 			}else{
						     		 			 				devMapCombination=Integer.parseInt(devMapId+"0"+decodeBinary,16);
						     		 			 			}
						     		 			 			devMapId=String.valueOf(devMapCombination);
						     		 			 		}else if(packetType.equals("1")){
						     		 			 		 logger.debug("Packet Type as " ,packetType);
						     		 			 		}
							     		 			//}
							     		 		i++;	
						     		 		  }else if(i==2){
						     		 			//String decodeBinary = Integer.toBinaryString(b);
						     		 			String decodeBinary =String.format("%x", b);
						     		 			 logger.debug("decodeBinary i=2 :",decodeBinary);
						     		 				if(packetType.equals("0")){
				     		 			 			   logger.debug("Packet Type 0 in i==2");
				     		 			 			   //Calculating hourly
					     		 			 			hourly=hourly+Integer.parseInt(decodeBinary.substring(0,decodeBinary.length()-1),16);
						     		 					logger.debug("Total hourly :",hourly);
						     		 					logger.debug("Actual millseconds :",millseconds);
						     		 					millseconds=millseconds-TimeUnit.HOURS.toMillis(hourly);
						     		 					logger.debug("Sub millseconds :",millseconds);
						     		 					logger.debug("Date as :",formatter.parse(formatter.format(new Date(millseconds))));
						     		 				   
						     		 					//Calculating Packet Length						     		 					
						     		 					packetLength=Integer.parseInt(decodeBinary.substring(1),16);
						     		 				}else{
						     		 					logger.debug("Packet Type as ",packetType);	
						     		 				}
				     		 			 			
				     		 			 			
						     		 			
						     		 			  		String decodeBinary =String.format("%x", b);
						     		 			 		logger.debug("decodeBinary i=2 :",decodeBinary);
							     		 				if(packetType.equals("0")){
						     		 			 			logger.debug("Packet Type 0 in i==2");				     		 			 			
							     		 				    hourly=hourly+Integer.parseInt(decodeBinary,16);
							     		 					logger.debug("Total hourly :",hourly);
							     		 					logger.debug("Actual millseconds :",millseconds);
							     		 					millseconds=millseconds-TimeUnit.HOURS.toMillis(hourly);
							     		 					logger.debug("Sub millseconds :",millseconds);
							     		 					logger.debug("Date as :",formatter.parse(formatter.format(new Date(millseconds))));
						     		 			 		}else{
						     		 			 			logger.debug("Packet Type as ",packetType);	
						     		 			 		}
							     		 			
							     		 		i++;	
						     		 		  }else if(i>2){
						     		 			 String decodeBinary =String.format("%x", b);
						     		 			logger.debug("decodeBinary i>2 :",decodeBinary);						     		 			
							     		 			//if(!decodeBinary.equalsIgnoreCase("11111111111111111111111111111111")){
						     		 			
						     		 			
					     		 			 			
							     		 				if(packetType.equals("0")){
							     		 					//Bussiness logic here	
							     		 					logger.debug("Packet Type 0 in i>2");
							     		 					logger.debug("i Value : ",i);
							     		 					logger.debug("Packet Type ===0: ");
							     		 					logger.debug("Packet Length : ",packetLength);
							     		 					logger.debug("Temp Length : ",temp);
							     		 					logger.debug("waterLtr Length : ",waterLtr);
							     		 												     		 					
							     		 					if(temp<packetLength){
							     		 						if(String.valueOf(decodeBinary).length()==1){
							     		 							waterLtr=waterLtr+"0"+decodeBinary;
							     		 						}else{
							     		 							waterLtr=waterLtr+decodeBinary;
							     		 						}
							     		 						
							     		 						temp++;
							     		 						if(temp!=packetLength){
							     		 							i++;
								     		 						continue;
							     		 						}
							     		 						 
							     		 					}
							     		 					
							     		 					logger.debug("waterLtr Length final ===0",waterLtr);							     		 				
							     		 					logger.debug("resultant: packetType : ",packetType);
							     		 					logger.debug("devMapId: AS : ",devMapId);
							     		 						     		 		 	
									     		 		 	
									     		 		 	frm.setCreatedAt(formatter.parse(formatter.format(new Date(millseconds))));
									     		 		 	frm.setUpdatedAt(formatter.parse(formatter.format(new Date(millseconds))));						     		 					
									     		 		 	frm.setDevMapId(devMapId);
									     		 		 	//frm.setWaterltr(String.format("%02X ", Integer.toBinaryString(Integer.parseInt(waterLtr))));
									     		 		 	frm.setWaterltr(String.valueOf(Integer.parseInt(waterLtr,16)));
									     		 		 	frm.setApplicationID(frame.getApplicationID());
									     		 		 	frm.setApplicationName(frame.getApplicationName());
									     		 		 	frm.setNodeName(frame.getNodeName());
									     		 		 	frm.setDevEUI(frame.getDevEUI());
									     		 		 	frm.setGatewayMac(frame.getGatewayMac());
									     		 		 	frm.setGatewayName(frame.getGatewayName());
									     		 		 	frm.setFPort(frame.getFPort());
									     		 		    frameDao.save(frm);
							     		 					
									     		 		    millseconds=millseconds+TimeUnit.HOURS.toMillis(1);									     		 		    
							     		 					n++;							     		 					
									     		 		    
							     		 				}else{
							     		 					logger.debug("Packet Type as ",packetType);	
							     		 				}
						     		 				//}
							     		 		i++;							     		 			  
						     		 		  }
				     		 			
				     		 		}
				     		 		
				     		 		 
				     		 		 	
				     		 		
				     		 	}
					
				  	  	}				  		
				  		
		}
		
		}catch(Exception e){
			logger.error("Error",e);
			e.printStackTrace();
		}
	}*/
	
	
	@Transactional
	public void messageArrived(String topic, MqttMessage message) throws Exception {
		logger.debug("Inside messageArrived");
		try{
			LoraFrame frame=null;
			if(!message.toString().isEmpty()){
				 
				  JSONObject json=null;
				  		json=new JSONObject();
				  		json=(JSONObject)new JSONParser().parse(message.toString());
				  		logger.debug("REsultant json",json);
				  		
				  		 frame=new LoraFrame();
				  		
				  		 frame.setApplicationID(json.get("applicationID").toString());
				  		 frame.setApplicationName(json.get("applicationName").toString());
				  		 frame.setNodeName(json.get("nodeName").toString());
				  		 frame.setDevEUI(json.get("devEUI").toString());
				  		logger.debug("applicationID",json.get("applicationID").toString());
							logger.debug("applicationName",json.get("applicationName").toString());
								logger.debug("nodeName",json.get("nodeName").toString());
									logger.debug("devEUI",json.get("devEUI").toString());
				  		 
				  		 JSONArray arr=(JSONArray) json.get("rxInfo");
				  		 
				  		 if(arr!=null && arr.size()>0){
	   						 for (int i = 0; i < arr.size(); i++) {
	   							 JSONObject jsonObj = (JSONObject) arr.get(i);
	   							 frame.setGatewayMac(jsonObj.get("mac").toString());
	   							 frame.setGatewayName(jsonObj.get("name").toString());
	   							 
		   							logger.debug("mac",jsonObj.get("mac").toString());
		   								logger.debug("name",jsonObj.get("name").toString());
	   						 }
				  		 }
				  		 
				  		
				  		logger.debug("fport",json.get("fPort").toString());
				  	  		logger.debug("Data As:",json.get("data").toString());
				  	  		
				  	  	frame.setFPort(json.get("fPort").toString().trim());
				  	  	TimeZone.setDefault(TimeZone.getTimeZone("IST"));
				  	  	DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				  	  	formatter.setTimeZone(TimeZone.getTimeZone("IST")); // Or whatever IST is supposed to be
				  	  	formatter.parse(formatter.format(new Date(System.currentTimeMillis())));
				  	  	frame.setCreatedAt(formatter.parse(formatter.format(new Date(System.currentTimeMillis()))));
				  	  	frame.setUpdatedAt(formatter.parse(formatter.format(new Date(System.currentTimeMillis()))));
				  	  	
				  	  	
				  	  	
				  	  	if(json.get("data")!=null){	
				  	  		 logger.debug("Data not empty");
				     		 byte[] decoded=Base64.decodeBase64(json.get("data").toString());
				     		 
				     		 	if(decoded!=null && decoded.length>0){
				     		 		
				     		 		 String devIdBinary = Integer.toBinaryString(decoded[0]);
				     		 		 String waterValBinary = Integer.toBinaryString(decoded[1]);
				     		 		 	logger.debug("devIdBinary[0] AS : ",devIdBinary);
				     		 		 		logger.debug("waterValBinary[1] AS : ",waterValBinary);
				     		 		 				     		 		  	
				     		 		 			     		 		  	
				     		 		  int dId=Integer.parseInt(devIdBinary,2);
				     		 		  int waterVal=Integer.parseInt(waterValBinary,2);
				     		 		  	logger.debug("dId : ",dId);
				     		 		  		logger.debug("waterVal : ",waterVal);
				     		 			
				     		 		  				frame.setWaterltr(String.valueOf(waterVal));
				     		 		   				frameDao.save(frame);
				     		 		
				     		 	}
					
				  	  	}				  		
				  		
		}
		
		}catch(Exception e){
			logger.error("Error",e);
			e.printStackTrace();
		}
	}
	


	public void deliveryComplete(IMqttDeliveryToken token) {
	}
	
	public void doDemo() {
 	}


	public void connectionLost(Throwable cause) {
   	}

}
