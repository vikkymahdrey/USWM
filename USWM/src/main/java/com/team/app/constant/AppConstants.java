package com.team.app.constant;

/**
 * 
 * @author Vikky
 *
 */
public class AppConstants {

	// REST API Mapping
	public static final String CONSUMER_API = "rest/consumer";
	public static final String ADMIN_API = "rest/admin";
	
	
	// Indicator
	public static final String IND_Y = "Y";
	public static final String IND_N = "N";
	public static final String IND_A = "A";
	public static final String IND_D = "D";
	public static final String LED_ON = "ON";
	public static final String LED_OFF = "OFF";
	
	// App key Config
	public static final String HTTP_HEADER_JWT_TOKEN = "jwt";
	
	public static final String HTTP_HEADER_TOKEN_NAME = "X-ACCESS-TOKEN";
	public static final String HTTP_HEADER_BASE_TOKEN_NAME = "X-BASE-TOKEN";
		
	public static final String TTL_LOGIN_KEY = "app.token.login.ttlmillis";
	
	public static final String KEY_UNIZEN_MOBILE = "UNIZEN_MOBILE";
	public static final String KEY_UNIZEN_THRIDPARTY = "UNIZEN_THIRDPARTY";
	public static final String KEY_UNIZEN_MOBILE_VAL = "TrustSecret";
		
	public static final String SUBJECT_SECURE = "MOBILE_SECURE";
	public static final String SUBJECT_NON_SECURE = "MOBILE_NON_SECURE";
	public static final String TOKEN_LOGN_ID = "MOBILE_LOGIN";
	
	public static final String Organisation = "Unizen";
	
	public static final String jwtToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJsb3JhLWFwcC1zZXJ2ZXIiLCJhdWQiOiJsb3JhLWFwcC1zZXJ2ZXIiLCJuYmYiOjE1MDk5NjE1NzIsInN1YiI6InVzZXIiLCJ1c2VybmFtZSI6ImFkbWluIn0.NDZGFGPDQNs7AgmGRzQk1WL5Y1tLjyRbw-n_TwHPZsY";
	public static final String domain ="https://139.59.14.31:8080";
	public static final String org_url = domain+"/api/organizations?limit=100";
	public static final String app_url =domain+"/api/applications?limit=100";
	public static final String user_url=domain+"/api/users?limit=100";
	public static final String status="Y";
	public static final String noportdomain ="139.59.14.31";
	
	public static final String timeZone="Asia/Kolkata";
	
	public static final String superAdmin="su";
	public static final String admin="admin";
	public static final String user="usr";
	
	// App token Config
	
	public static final String DAYS = "DAYS";
	public static final String HOURS = "HOURS";
	public static final String MINUTES = "MINUTES";
	public static final long TIME = 15;
	
	
	
	
	
	
}
