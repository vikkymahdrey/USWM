package com.team.app.service.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import com.team.app.constant.AppConstants;
import com.team.app.logger.AtLogger;
import com.team.app.service.OrganisationService;

@Service
public class OrganisationServiceImpl implements OrganisationService {
	
	private static final AtLogger logger = AtLogger.getLogger(OrganisationServiceImpl.class);

	
	public Map<String, Object> getLoraServerOrganisation() throws Exception {
		
		Map<String,Object> organisations=null;
						
			 try {
				   organisations=new HashMap<String,Object>();	
				   String url=AppConstants.org_url;
					logger.debug("URLConn",url);
					URL obj1 = new URL(url);
					HttpURLConnection con = (HttpURLConnection) obj1.openConnection();
					con.setDoOutput(true);
					con.setRequestMethod("GET");
					con.setRequestProperty("accept", "application/json");
					con.setRequestProperty("Content-Type", "application/json");
					con.setRequestProperty("Grpc-Metadata-Authorization",AppConstants.jwtToken);
					
					    
					int responseCode = con.getResponseCode();
						logger.debug("POST Response Code :: " + responseCode);
							    				
					if(responseCode == HttpURLConnection.HTTP_OK) {
						logger.debug("Token valid,POST Response with 200");
						
						BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
						String inputLine;
						StringBuffer response = new StringBuffer();

						while ((inputLine = in.readLine()) != null) {
							response.append(inputLine);
						}
						
						in.close();
						
						JSONObject json=null;
							json=new JSONObject();
						json=(JSONObject)new JSONParser().parse(response.toString());
					
						JSONArray arr=(JSONArray) json.get("result");    					
						
						if(arr!=null && arr.size()>0){
							logger.debug("Inside Array not null");
							 for (int i = 0; i < arr.size(); i++) {
								 JSONObject jsonObj = (JSONObject) arr.get(i);													
									logger.debug("Name matching ..");
									logger.debug("Organisation name ..",jsonObj.get("name").toString());
									logger.debug("Organisation id ..",jsonObj.get("id").toString());
									organisations.put(jsonObj.get("id").toString(), jsonObj.get("name"));
						}
				        }
					}
					
			   }catch(Exception e){
					e.printStackTrace();
			   }
	   
			 return organisations;
	}

}
