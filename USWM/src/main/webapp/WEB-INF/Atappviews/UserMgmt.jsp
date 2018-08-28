<%--
    Author     : Vikky
--%>


<%@page import="com.team.app.domain.*"%>
<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@page import="java.util.List"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Create User</title>
    
	<script type="text/javascript" src="js/jquery-latest.js"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
	  <link href="css/bootstrap.min.css" rel="stylesheet">
	  <link href="css/custom_siemens.css" rel="stylesheet">
	   <link href="css/marquees.css" rel="stylesheet">
	       
    
   
	  <!-- Font Awesome -->
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
	  <!-- Ionicons -->
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
	  <link rel="stylesheet" href="css/AdminLTE.min.css">
	  <link rel="stylesheet" href="css/AdminLTE.css">
	  <link rel="stylesheet" href="css/skins/_all-skins.min.css"> 
	  <link href="css/style.css" rel="stylesheet" type="text/css" />
	 

	<script src="js/app.min.js"></script>
	<script src="js/demo.js"></script>
	
<!-- Pie Charts... -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
    
   <script type="text/javascript">
   
   function confirmValidate(){
	   
	   var orgid=document.getElementById("orgid").value;
 	  	var appid=document.getElementById("appid").value;
 	  	var devid=document.getElementById("devid").value;
 	  	var usertype=document.getElementById("usertype").value;
 		
	   	   
 	   if(orgid=="0"){
		   alert("Please select Apartment!");
		   return false;
	   }else if(appid=="0"){
		   alert("Please select Block!");
		   return false;
	   }else if(devid=="0"){
		   alert("Please select Water Meter!");
		   return false;
	   }else if(usertype == "0") {
			alert("Please select User Type");
			return false;
	   }else if ($("input[name=uname]").val() == "") {
			alert("Please specify Username");
			return false;
	   }else if ($("input[name=email]").val() == "") {
			alert("Please specify Email ID");
			return false;
	   }else if (isNaN($("input[name=contact]").val())
				|| ($("input[name=contact]").val()).length != 10) {
			alert("Please specify 10 digit contact number");
			return false;
	   }else if ($("input[name=area]").val() == "") {
			alert("Please select area");
			return false;
	   }else if ($("input[name=place]").val() == "") {
			alert("Please select place");
			return false;
	   }else if ($("input[name=landmark]").val() == "") {
			alert("Please select landmark");
			return false;
	   }				
   }
   
   
   function checkUsername(){
		var uname=document.getElementById("uname").value;
	   if(uname!=''){
	   $.ajax({
           url: 'validateUserName',
           type: 'POST',
           //data: 'orgId='+orgid+'&appId='+appid+'&devId='+devid,
           data: jQuery.param({uname: uname}) ,
           success: function (data) {
        	   if(data!=''){
        	  		alert(data); 
        	  		document.getElementById("uname").value = "";
        	  		document.getElementById("uname").focus();
        	  		
        	   }
               },
		 		error: function(e){
	     			        alert('Error: ' + e);
	     		 }

              
           });
	   }  
	  //return false;
   }
   
   function checkEmail(){
	   var email=document.getElementById("email").value;
	   if(email!=''){
		   $.ajax({
	           url: 'validateEmail',
	           type: 'POST',
	           data: jQuery.param({email: email}) ,
	           success: function (data) {
	        	   if(data!=''){
	        	  		alert(data);
	        	  		document.getElementById("email").value = ""; 
	        	  		document.getElementById("email").focus();
	        	  		
	        	   }
	               },
			 		error: function(e){
		     			        alert('Error: ' + e);
		     		 }

	              
	           });
		   }  
   }
   
function getAppByOrgID()
{    
            	var orgid=document.getElementById("orgid").value;
            	
            	if(orgid=="0")
                	{      
            	
                	var appid=document.getElementById("appid");
                	var devid=document.getElementById("devid");
                		appid.innerHTML='<select name="appname" id="appid" onchange="getDevEUIByAppID()"> <option value="0" >--Choose Block--</option></select>';
                		devid.innerHTML='<select name="devname" id="devid"> <option value="0" >--Choose Water Meter--</option></select>';
                		return;
                	}
                else
                	{
                	                
                var url="getApplications?orgId="+orgid;                                    
                xmlHttp=GetXmlHttpObject()
                if (xmlHttp==null)
                {
                    alert ("Browser does not support HTTP Request");
                    return
                }                    
                xmlHttp.onreadystatechange=setApplication;	
                xmlHttp.open("GET",url,true);                
                xmlHttp.send(null);
                
                	}
 }
            
            
function getDevEUIByAppID()
{     
	var appid=document.getElementById("appid").value;
		
	if(appid=="0")
    	{                	
    	var devid=document.getElementById("devid");
    		devid.innerHTML='<select name="devname" id="devid"> <option value="0" >--Choose Water Meter--</option></select>';
    	return;
    	}
    else
    	{
    var url="getDevEUIByAppId?appId="+appid;                                    
    xmlHttp=GetXmlHttpObj()
    if (xmlHttp==null)
    {
        alert ("Browser does not support HTTP Request");
        return
    }                    
    xmlHttp.onreadystatechange=setDevEUI;	
    xmlHttp.open("GET",url,true);                
    xmlHttp.send(null);
    
    	}
}
                
            function GetXmlHttpObject()
            {
                var xmlHttp=null;
                if (window.XMLHttpRequest) 
                {
                    xmlHttp=new XMLHttpRequest();
                }                
                else if (window.ActiveXObject) 
                { 
                    xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
                }

                return xmlHttp;
            }
            
            
            function GetXmlHttpObj()
            {
                var xmlHttp=null;
                if (window.XMLHttpRequest) 
                {
                    xmlHttp=new XMLHttpRequest();
                }                
                else if (window.ActiveXObject) 
                { 
                    xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
                }

                return xmlHttp;
            }
        
            function setApplication() 
            {                      
                if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                { 
                    var returnText=xmlHttp.responseText;
                    var appid=document.getElementById("appid");
                    appid.innerHTML='<select  name="appname" id="appid" onchange="getDevEUIByAppID()"><Option value="0">--Choose Block--</Option>'+returnText+'</select>';                                             
                }
            }
            
            function setDevEUI() 
            {                      
                if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                { 
                    var returnText=xmlHttp.responseText;
                    var devid=document.getElementById("devid");
                    devid.innerHTML='<select  name="devname" id="devid"><Option value="0">--Choose Water Meter--</Option>'+returnText+'</select>';                                             
                }
            }
     </script>      
     
     
     <script type="text/javascript">
			function showPopup(url) {
				var params = "toolbars=no,menubar=no,location=no,scrollbars=yes,resizable=yes";
				size = "height=450,width=520,top=200,left=300," + params;
				if (url == "LandMarkSearch") {
					size = "height=450,width=600,top=200,left=300," + params;
				}
				
				var orgId=document.getElementById("orgid").value;
				if (url == "LandMarkSearch") {
					
					if(orgId=="0")
					{
					alert("Choose Apartment");
					return false;
					}
					url+="?orgId="+orgId;
				}
				
				newwindow = window.open(url, 'name', size);
		
				if (window.focus) {
					newwindow.focus();
				}
			}
</script> 
     
  </head>
  
  <body class="hold-transition skin-blue sidebar-mini">
  
  			<% 
  				Map<String,Object> organisations=(Map<String,Object>)request.getAttribute("organisations");
  		  		List<Role> roles=(List<Role>)request.getAttribute("roles");
  			%>
  			
							 
  <div class="wrapper">  
  	<%@include file="Header.jsp"%>  
 
	<div class="content-wrapper">
		
			<section class="content">
		 		<div class="content-wrap box box-primary">
		 		
					
		 		<div class="row">
							<div class="col-sm-12 text-right">
								<img src="images/user_iocn_header.png" />&nbsp;<b>Welcome <%=userSession.getUname()%></b> 
							</div>
					
				</div>
		 		
		 		<div class="box-header with-border">
  					  <h5 class="text-blue text-left "><span class="fa fa-user"></span><b> Create User</b></h5>
       
   				</div><!-- /.box-header -->
		 							
		 					<div class="row">
									<div class="col-sm-12 text-center">
									<%String message="";
						
										try{
											message=request.getParameter("message");
											if(message!=null&&!message.equals("")){
												
											}else{						
													message = "";
													message = request.getAttribute("status").toString();
													session.setAttribute("status", "");
											}
				
										}catch(Exception e)
										{
											;
										}	%>
				 						<span style="color: red;" ><%=message %></span>	
				 									
		   						</div>
		   				  </div>		
   						
   						  <div class="row" >
    				    	<div class="col-sm-12">	
    				    	
    				    	<form name="form1" action="userSubscription" onsubmit="return confirmValidate();" method="post">
										
								  <table class="table">
								  	
								  
								  	<tr>
								  		<td align="right"><b>Apartments:</b></td>
								  			
										<td>
										 <select name="orgid" id="orgid" onchange="getAppByOrgID()">
										    <option value="0">--Choose Apartment--</option>	
										    <%if(userSession.getRoleBean().getType().equalsIgnoreCase(AppConstants.superAdmin)){										    
											    if(organisations!=null && !organisations.isEmpty()){
											    	for(Map.Entry<String,Object> map :organisations.entrySet()){%>
											    	    <option value="<%=map.getKey()+":"+map.getValue()%>"><%=map.getValue()%></option>
											    	<%}
											    }
										    }else if(userSession.getRoleBean().getType().equalsIgnoreCase(AppConstants.admin)){
										    	if(organisations!=null && !organisations.isEmpty()){
											    	for(Map.Entry<String,Object> map :organisations.entrySet()){
											    		for(UserDeviceMapping udm : userSession.getUserDeviceMappings()){
											    		   if(udm.getOrgId().equals(map.getKey())){%>
											    	    	 <option value="<%=map.getKey()+":"+map.getValue()%>"><%=map.getValue()%></option>
											    		   <%}
											    		} 
											    	}
											    }	    
										    }%>
										 </select> 
										</td>
										
									</tr>
									<tr>	
									   <td align="right"><b>Blocks:</b></td>
									   
										 <td>
										 	<select name="appid" id="appid" onchange="getDevEUIByAppID()">
										    	<option value="0">--Choose Block--</option>	
										    </select> 
										</td>
									</tr>
									
									<tr>	
									   <td align="right"><b>Water Meters:</b></td>
									   
										 <td>
										 	<select name="devid" id="devid" >
										    	<option value="0">--Choose Water Meter--</option>	
										    </select> 
										</td>
									</tr>
									
									<tr>
								  		<td align="right"><b>User Type:</b></td>
								  													
										<td>
										 <select name="usertype" id="usertype">
										    <option value="0">--Choose User Type--</option>	
										    <%if(roles!=null && !roles.isEmpty()){
										    	for(Role r: roles){
											    	if(r.getType().equalsIgnoreCase(AppConstants.user)){%>
											    		<option value="<%=r.getId()%>" ><%=r.getName()%></option> 
											   		<%}
										    	}	
										     }%> 
										 </select> 
										</td>
									</tr>
									
									<tr>	
									   <td align="right"><b>Username:</b></td>
									   
										 <td>
										 	<input type="text" name="uname" id="uname" onchange="checkUsername()">
										</td>
									</tr>
									
									<tr>	
									   <td align="right"><b>Email ID:</b></td>
									   
										 <td>
										 	<input type="text" name="email" id="email" onchange="checkEmail()" >
										</td>
									</tr>
									
									<tr>	
									   <td align="right"><b>Mobile Number:</b></td>
									   
										 <td>
										 	<input type="text"  name="contact" id="contact" >
										</td>
									</tr>
									
									
									
									<tr>
										<td align="right">
											<input style="margin-left: 130%; background-color:#3c8dbc;"
												type="button" value="Add Location" class="formbutton"
													onclick="showPopup('LandMarkSearch') " />
										</td>
				
									</tr>
									
									<tr>	
									   <td align="right"><b>Area:</b></td>
									   
										 <td>
										 	<input type="text" name="area" id="area" readonly/>
										 	<input type="hidden" id="landMarkID" name="landMarkID" />
										</td>
									</tr>
									<tr>	
									   <td align="right"><b>Place:</b></td>
									   
										 <td>
										 	<input type="text" name="place" id="place" readonly/>
										</td>
									</tr>
									<tr>	
									   <td align="right"><b>Landmark:</b></td>
									   
										 <td>
										 	<input type="text" name="landmark" id="landmark" readonly/>
										</td>
									</tr>
									
									<tr>	
										<td align="right"></td>
											<td> <input type="submit"  class="formbutton" style="background-color:#3c8dbc;" value="Create user"/></td>
										 
									</tr>	
								</table>	
							 </form> 
							</div>	
					   </div>
										
					</div>	
			</section>	
			<%@include file="Footer.jsp"%>  		
	</div>	
	</div>
			
  </body>
</html>